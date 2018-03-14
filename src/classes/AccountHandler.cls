public class AccountHandler {

    public static Account insertNewAccount (String accName){
        
        Account acc = new Account();
        
        try{
            acc.name = accName;
            insert acc;
            
        }
        catch (Exception e){
            System.debug(e.getMessage());
            return null;
        }
        
        return acc;
        
    }
}