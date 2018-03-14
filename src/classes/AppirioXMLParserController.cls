//
// (c) 2015 Appirio, Inc.
//
// Controller for XML Parser Tool
//
// 12 Mar 2015 Divya Rao     Original
public class AppirioXMLParserController
{
    public String xmlInput {get; set;}
    public String XMLParserNumColsCount { get; set; }
    public String XMLParserNumRowsCount { get; set; }
    public List<Code_Variables__c> code {get;set;}
    
    public List<RecordTypeInformation> rtiList {get;set;}
    // Constructor
    public AppirioXMLParserController(){
    // fetch values from custom setting 'Code_Variables' for rows and column of text area field on visual force   
        Map<String,Code_Variables__c> customvalue = Code_Variables__c.getall();
        code = customvalue.values();
        XMLParserNumColsCount = customvalue.get('XMLParserNumCols').Value__c;
        XMLParserNumRowsCount = customvalue.get('XMLParserNumRows').Value__c;
    }
    //ParseXML action for the button
    public Boolean isError {get; set;}
    public void parseXML()
    {   
     try
       {   
        Dom.Document doc = new Dom.Document();
        doc.load(xmlInput);

        Dom.XmlNode xmlNodeRoot=doc.getRootElement();

        // Retrieve namespace of XML Node
        String namespace= xmlNodeRoot.getNamespace();
        List<Dom.XmlNode> chNodes= xmlNodeRoot.getChildElements();

        // map to hold each picklist value and every picklist value for it
        Map<String, list<String>> picklistFieldToAllPicklistValues = new Map<String, list<String>>();

        // This list will contain 1 element per record type retrieved
        rtiList = new List<RecordTypeInformation>();

        for(Dom.XmlNode x: chNodes)
        {
            string namespaceOfElementFields=x.getNamespace();
            if(x.getName().equals('fields') && x.getChildElement('picklist',namespaceOfElementFields)!=null) // fields
            {  
                String pickListName = x.getChildElement('fullName',namespaceOfElementFields).getText();
                picklistFieldToAllPicklistValues.put((pickListName),new List<String>()); // fullname

                Dom.XmlNode pickListNode = x.getChildElement('picklist',namespaceOfElementFields);
                // we're at the picklist level. now access the picklist value names
                for(Dom.XmlNode singlePickVal : pickListNode.getChildElements())
                {
                    if(singlePickVal.getName().equals('picklistValues') && singlePickVal.getChildElement('fullName',namespaceOfElementFields)!=null)
                    {
                        List<String> pickValues = new List<String>();
                        pickValues = picklistFieldToAllPicklistValues.get(pickListName);
                        pickValues.add(singlePickVal.getChildElement('fullName',namespaceOfElementFields).getText());
                        picklistFieldToAllPicklistValues.put(pickListName,pickValues);
                    }
                }
            }
        }

        for(Dom.XmlNode x: chNodes)
        {
            RecordTypeInformation objRTInformation=new RecordTypeInformation();
            if(x.getName().equals('recordTypes'))
            {
                List<Dom.XmlNode> nodes=new List<Dom.XmlNode>();
                nodes=x.getChildElements();
                for(Dom.XmlNode d: nodes)
                {
                    Map<String,List<String>> activePicklistMap=new Map<String,List<String>>();
                    if(d.getName().equals('label'))
                    {   
                        string recordTypeName=d.getText();
                        objRTInformation.rtName=d.getText();
                    }
                    if(d.getName().equals('picklistValues'))
                    {
                        List <Dom.XmlNode> pickListAndPickValues = new List<Dom.XmlNode>();
                        String pickListName = '';
                        for(Dom.XmlNode c: d.getChildElements())
                        {
                            if(c.getName().equals('picklist'))
                            {
                                objRTInformation.mapPicklistNameToActiveValues.put(c.getText(),new List<String>());
                                pickListName = c.getText();
                            }
                            if(c.getName().equals('values'))
                            {
                                List<String>pickListValues = new List<String>();
                                pickListValues = objRTInformation.mapPicklistNameToActiveValues.get(pickListName);
                                string namespaceOfElement=c.getNamespace();
                                Dom.XmlNode childValue=c.getChildElement('fullName',namespaceOfElement);
                                String text = childValue.getText();
                                pickListValues.add(text);
                                objRTInformation.mapPicklistNameToActiveValues.put(pickListName,pickListValues);
                            }
                        }
                    }
                }
            }

            if(objRTInformation.rtName!=null)
            {
                rtiList.add(objRTInformation);
            }
        }

        for(RecordTypeInformation singleRecordTypeInfo  : rtiList)
        {
            singleRecordTypeInfo.setMapPicklistNameToInactiveValues(picklistFieldToAllPicklistValues);
        }
     }
    catch(Exception e)
    {  
        ApexPages.addmessage(new ApexPages.Message(ApexPages.Severity.Error,'The XML seems to be incorrect. Please check it again.!'));
        isError=TRUE;
        if(rtiList != null)
        {
            rtiList.clear();
        }
    }

    }

    //Inner class for storing record type/picklist values 
     @TestVisible class RecordTypeInformation
    {
        //Name of the record type
        public String rtName {get; set;}
        // Map of picklist API name to active picklist values
        // Use set instead of list in these maps
        public Map<String,List<String>> mapPicklistNameToActiveValues {get; set;}
        // Map of picklist name to all picklist values 
        public Map<String,List<String>> mapPicklistNameToAllValues {get; set;}
        //Map of picklist name to inactive picklist values
        //This is going to be created by removing the values that are present in all picklist
        //values but not in the active picklist values and adding it to a new list
        public Map<String,List<String>> mapPicklistNameToInactiveValues {get; set;}
        // List to hold the inactive picklist values obtained above
        //List<string> listInactiveValues=new List<String>(); 

        // Constructor
        public RecordTypeInformation(){
            // initialize variables
            mapPicklistNameToActiveValues = new Map<String,List<String>>();
            mapPicklistNameToAllValues = new Map<String,List<String>>();
            mapPicklistNameToInactiveValues=new Map<String,List<String>>();
        }

        public Map<String,List<String>> getPicklistAndAllValues(String picklistName, List<String> allValues)
        {
        	Map<String,List<String>> mapPicklistNameToAllValues = new Map<String,List<String>>();
        	mapPicklistNameToAllValues.put(picklistName, allValues);
        	return mapPicklistNameToAllValues;
        }

        public Map<String,List<String>> getPicklistAndActiveValues(String picklistName, List<String> activeValues)
        {
        	Map<String,List<String>> mapPicklistNameToAllValues = new Map<String,List<String>>();
        	mapPicklistNameToAllValues.put(picklistName, activeValues);
        	return mapPicklistNameToActiveValues;
        }

        public void setMapPicklistNameToInactiveValues(Map<String, List<String>> allPicklistsToPicklistValues)
        {
            // if there are no active values, return the full list.
            if(mapPicklistNameToActiveValues.keySet()== null)
            {
                mapPicklistNameToInactiveValues = allPicklistsToPicklistValues;
            }
            else // if there are active values, get the full list, and subtract the active values from the full list.
            {
                for(String singlePicklist: allPicklistsToPicklistValues.keySet())
                {
                    Set <String> allValues = new Set <String>();
                    Set <String> activeValues = new Set <String>();
                    Set <String> inactiveValues = new Set <String>();
                    List <String> pickListTemp = new List <String>();
                    List <String> inactiveValuesStringList = new List <String>();
                    pickListTemp = allPicklistsToPicklistValues.get(singlePicklist); // we've gotten all values
                    allValues.addAll(pickListTemp);
                    if(mapPicklistNameToActiveValues.get(singlePicklist)!=null)
                    {
                        pickListTemp = mapPicklistNameToActiveValues.get(singlePicklist);
                        activeValues.addAll(pickListTemp);
                    }
                    inactiveValues = allValues;
                    inactiveValues.removeAll(activeValues);
                    inactiveValuesStringList.addAll(inactiveValues);
                    mapPicklistNameToInactiveValues.put(singlePicklist, inactiveValuesStringList);
                }
            }
        }
    }
}