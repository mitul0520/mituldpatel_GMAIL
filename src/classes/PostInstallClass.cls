//global class PostInstallClass implements InstallHandler
//{
public class PostInstallClass
{
	//global void onInstall(InstallContext context)
	public static void onInstall()
	{
		//if(context.previousVersion() == null)
		//{
		List<Dev_Tool_Config__c> allRecords = new List<Dev_Tool_Config__c>([SELECT Id, name FROM Dev_Tool_Config__c]);
		List<Code_Variables__c> newCodeVariableRecords = Code_Variables__c.getAll().values();
		if(allRecords.isEmpty())
		{
			Id toolRecordType = [SELECT Id FROM RecordType WHERE Name='Dev Tool'].Id;
			Dev_Tool_Config__c xmlParser = new Dev_Tool_Config__c(Name='XML Parser', Page_Name__c='AppirioXMLParser', Sort_Order__c=1, RecordTypeId=toolRecordType);
			Dev_Tool_Config__c awesomeExtractor = new Dev_Tool_Config__c(Name='Awesome Extractor', Sort_Order__c=2, RecordTypeId=toolRecordType);
			Dev_Tool_Config__c customScheduler = new Dev_Tool_Config__c(Name='Custom Scheduler', Sort_Order__c=3, RecordTypeId=toolRecordType);
			List<Dev_Tool_Config__c> allDevToolsToCreate = new List<Dev_Tool_Config__c>{xmlParser, awesomeExtractor, customScheduler};
			insert allDevToolsToCreate;
		}
		if(newCodeVariableRecords.isEmpty())
		{
			// create code variable records here too
			Code_Variables__c xmlParserNumCols = new Code_Variables__c(Name='XMLParserNumCols', Value__c='80');
			Code_Variables__c xmlParserNumRows = new Code_Variables__c(Name='XMLParserNumRows',Value__c='15');
			List<Code_Variables__c> allCodeVariablesToCreate = new List<Code_Variables__c>{xmlParserNumCols, xmlParserNumRows};
			insert allCodeVariablesToCreate;
		}
	}
}