public with sharing class  UserTriggerHandler {

    public static void beforeInsert(List<User> newList){
        updateUserData(newList);
      
    }
    
    public static void beforeUpdate(List<User> newList , Map<Id, User> oldMap){
        updateUserData(newList);
    }
    
    public static void updateUserData (List<User> users){
        
        
        for(User us : users){
            
            us.UserData_XML__c = getUserData(us);
            
            if(us.UserData_XML__c != null){
        		us.UserData_Enc__c = EncodingUtil.base64Encode(Blob.valueOf(us.UserData_XML__c));        
        		     
            }
        }
	
		
    }
    
    private static String getUserData(User us){
        
        XmlStreamWriter w = new XmlStreamWriter();
        w.writeStartElement('','batch','');
        w.writeStartElement('','users','');
        w.writeStartElement('','user','');
        w.writeAttribute('', '', 'user_ref', us.Id);
        w.writeAttribute('', '', 'active',  '1');
        //w.writeAttribute(prefix, namespaceURI, localName, value);
        
        
        w.writeEndElement();//end user
        w.writeEndElement(); //end users
        w.writeEndElement();//end batch 
        String userData = w.getXmlString();
        w.close();
        
        return userData;
    }
}