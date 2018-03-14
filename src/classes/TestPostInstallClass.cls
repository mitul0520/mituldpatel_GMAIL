@isTest
private class TestPostInstallClass
{
	
	@isTest static void testInstallScript()
	{
		//PostInstallClass postInstall = new PostInstallClass();
		//Test.testInstall(postInstall, null);
		//Test.testInstall(postInstall, new Version(1,0),true);
		PostInstallClass.onInstall();
		List<Dev_Tool_Config__c> newDevToolRecords = new List<Dev_Tool_Config__c>([SELECT Id, name FROM Dev_Tool_Config__c]);
		System.assertEquals(3,newDevToolRecords.size(),'Dev_Tool_Config__c records not found');		
		List<Code_Variables__c> newCodeVariableRecords = Code_Variables__c.getAll().values();
		System.assertEquals(2,newCodeVariableRecords.size(),'Code_Variables__c records not found');
	}
}