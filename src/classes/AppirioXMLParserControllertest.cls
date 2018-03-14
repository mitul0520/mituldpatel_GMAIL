public class AppirioXMLParserControllertest
{

    public String xmlInput { get; set; }

    public String XMLParserNumColsCount { get; set; }
    public String XMLParserNumRowsCount { get; set; }
    public List<Code_Variables__c> code {get;set;}
    public AppirioXMLParserControllertest()
    {
        Map<String,Code_Variables__c> customvalue = Code_Variables__c.getall();
        code = customvalue.values();
        System.debug('Value from custom setting' + code );
        XMLParserNumColsCount = customvalue.get('XMLParserNumCols').Value__c;
        System.debug('Custom setting column' + XMLParserNumColsCount);
        XMLParserNumRowsCount = customvalue.get('XMLParserNumRows').Value__c;
        System.debug('Custom setting Row' + XMLParserNumRowsCount);
    }  
   
}