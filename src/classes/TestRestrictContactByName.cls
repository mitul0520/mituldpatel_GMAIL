@isTest
public class TestRestrictContactByName {
	
    @isTest
    static void testInvalidLastName(){
        
        Contact con = new Contact();
        con.lastname = 'INVALIDNAME ';
        
        //perform test
        
        Test.startTest();
        
        try{
            Database.SaveResult result = Database.insert(con);
        }
        catch(DMLException e){
            System.assertEquals('Insert failed. First exception on row 0; first error: FIELD_CUSTOM_VALIDATION_EXCEPTION, The Last Name "INVALIDNAME" is not allowed for DML: []', e.getMessage());
        }
        Test.stopTest();
        
        
    }
}