public class BindVariableInSOQL {

    public static void printCAContacts(){
        List<Account> caAccounts = [select id, name from account where billingstate = 'CA'];
        
        List<Contact> contacts = [select id, name, accountid from contact
                                  where accountid in :caAccounts];
        
        for (Contact con:contacts){
            System.debug('>>>> '+ con.name);
        }
    }
}