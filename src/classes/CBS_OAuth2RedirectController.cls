public with sharing class  CBS_OAuth2RedirectController {

    @AuraEnabled
    public static boolean getToken(String code){
        
        System.debug('Code: ' + code);
        return true;
    }
    
}