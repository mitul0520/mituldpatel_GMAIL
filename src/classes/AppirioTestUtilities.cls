//
// (c) 2015 Appirio, Inc.
//
// General test utility class 
//
// 5 Mar 2015 Leo Alves     Original
//
@isTest
public class AppirioTestUtilities {
    
    // create dev tools
    public static Dev_Tool_Config__c createDevTool(boolean isInsert){
        Dev_Tool_Config__c devTool = new Dev_Tool_Config__c(name = 'test');
        if (isInsert)
            insert devTool;
        return devTool;
    } 
    
    // dev tools data factory
    public static List<Dev_Tool_Config__c> devToolFactory(boolean isInsert, Integer instances){
        List<Dev_Tool_Config__c> devTools = new List<Dev_Tool_Config__c>();
        for (Integer i = 0; i < instances; i++){
            Dev_Tool_Config__c devTool = createDevTool(false);
            devTool.sort_order__c = i;
            devTools.add(devTool);
        }
        if (isInsert)
            insert devTools;
        return devTools;
    } 
}