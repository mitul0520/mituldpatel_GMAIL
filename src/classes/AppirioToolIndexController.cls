//
// (c) 2015 Appirio, Inc.
//
// Controller for index page of dev tools
//
// 5 Mar 2015 Leo Alves     Original

public class AppirioToolIndexController {
    // properties
    public List<Dev_Tool_Config__c> devTools {
        get {
            if (devTools == null)
                devTools = [SELECT name, page_name__c, img_url__c
                            FROM Dev_Tool_Config__c ORDER BY sort_order__c];
            return devTools;
        }
        private set;
    }
    
    // constructor
    public AppirioToolIndexController(){}
}