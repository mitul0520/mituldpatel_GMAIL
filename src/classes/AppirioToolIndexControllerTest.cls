//
// (c) 2015 Appirio, Inc.
//
// Test class for AppirioToolIndexController
//
// 5 Mar 2015 Leo Alves     Original
//
@isTest
private class AppirioToolIndexControllerTest {
    // static variables
    static List<Dev_Tool_Config__c> devTools;
    
    @isTest
    static void testInstatiate(){    
        createTestData();
        AppirioToolIndexController con = new AppirioToolIndexController();
        System.assertEquals(devTools.size(), con.devTools.size());
        
    }
    
    static void createTestData(){
        // create 5 dev tools
        devTools = AppirioTestUtilities.devToolFactory(true, 5);    
    }
}