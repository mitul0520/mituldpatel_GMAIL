public with sharing class CaseService {

    public static void closeCases(Set <Id> caseId, String reason){
        // Validate Parameters
        if (caseId == null || caseId.size() == 0)
            throw new CaseServiceException('Case Ids not passed');
        
        //Query case, set status as closed
        List<Case> casesToClose = [Select id, Status, Reason from case
                                  where Id in :caseId];
        
        for (Case cs:casesToClose){
            cs.Status = 'Closed';
            cs.Reason = reason;
        }
        //update the database
        SavePoint sp = Database.setSavepoint();
        try{
        	update casesToClose;
        }
        catch (Exception e){
            Database.rollback(sp);
            throw e;
        }
    }

    public class CaseServiceException extends Exception {}
}