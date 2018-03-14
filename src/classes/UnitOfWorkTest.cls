@isTest
public class UnitOfWorkTest {
    @isTest
    static void challangeComplete()
    {
        fflib_sobjectUnitOfWork workUnit = new fflib_sobjectUnitOfWork(new Schema.SObjectType[]{Account.sObjectType, Contact.sObjectType, Note.sObjectType}); 
       for(Integer i= 1; i <= 100; i++)
       {
           Account acc = new Account();
           acc.Name = 'Test'+i;
           workUnit.registerNew(acc);
       }
        
        for(Integer i = 1; i <= 500; i++)
        {
            Contact cont = new Contact();
            cont.LastName = 'TestUoW' + i;
            workUnit.registerNew(cont);
            
            Note myNote = new Note();
            myNote.Title = 'Test' + i;
            
            workUnit.registerNew(myNote, Note.ParentId, cont);
           // workUnit.registerNew(myNote);
        }
        
        test.startTest();
        workUnit.commitWork();
        test.stopTest();
        
        system.assertEquals(100, [SELECT Id FROM Account].size());
        system.assertEquals(500, [SELECT Id FROM Contact].size());
        system.assertEquals(500, [SELECT Id FROM Note].size());
    }

}