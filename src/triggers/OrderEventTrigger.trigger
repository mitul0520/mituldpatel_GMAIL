trigger OrderEventTrigger on Order_Event__e (after insert) {
    // List to hold all tasks to be created.
    List<Task> tasks = new List<Task>();

    Id userId = UserInfo.getUserId();


    // Iterate through each notification.
    for (Order_Event__e event : Trigger.New) {
        if (event.Has_Shipped__c == true) {
            // Create task 
            Task tk = new Task(Priority='Medium', status='New',subject='Follow up on shipped order ' + event.Order_Number__c, ownerId=userId);
            tasks.add(tk);

        }
   }

    // Insert all tasks corresponding to events received.
    insert tasks;
}