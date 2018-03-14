public class ContactAndLeadSearch {

    public static List<List< SObject>> searchContactsAndLeads (String searchString){
        
        return [Find :searchString In  NAME FIELDS RETURNING Contact(id, Name), Lead(id, name)];
    }
}