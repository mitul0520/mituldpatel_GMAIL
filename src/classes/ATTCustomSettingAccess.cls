public class ATTCustomSettingAccess {

    static Map<String, ATT_Custom_Setting__c> attCS = ATT_Custom_Setting__c.getAll();
    
    public static void debugATTCustomSettingAccess(){
        
        System.debug ('=== all keys in the cs: ' + attCS.keySet());
        
        ATT_Custom_Setting__c attAuth = attCS.get('ATT Auth Details');
        System.debug ('=== auth key: ' + attAuth.Auth_Header_Key__c );
        System.debug ('=== auth value: ' + attAuth.Auth_Header_Value__c  );
      }  
    
}