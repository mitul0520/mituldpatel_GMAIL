trigger UserTrigger on User (before insert, before update) {
    
    if(Trigger.isInsert && Trigger.isBefore){
        UserTriggerHandler.beforeInsert( Trigger.new );
    }
    if(Trigger.isUpdate && Trigger.isBefore){
        UserTriggerHandler.beforeUpdate( Trigger.new, Trigger.oldMap );
    }
}