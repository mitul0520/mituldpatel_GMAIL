public class ContactSearch {

    public static List<Contact> searchForContacts (String lastName, String postalcode){
        
        List<Contact> cts = [Select id, name from Contact 
                                 where lastname = :lastname and mailingPostalCode = :postalcode];
        
        return cts;
    }
}