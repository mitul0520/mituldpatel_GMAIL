@Istest(SeeAllData=true)
public class AccountManagerTest {
    

    
    @IsTest
    public static void testaccountmanager() {
        RestRequest request = new RestRequest();
        request.requestUri = 'https://mituldapatel-dev-ed.my.salesforce.com/services/apexrest/Accounts/001i000001cUKygAAG/contacts';
        request.httpMethod = 'GET';
        RestContext.request = request;
        
		system.debug('test account result = '+ AccountManager.getAccount());

        
    }
    

}