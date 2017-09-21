trigger ClosedOpportunityTrigger on Opportunity (after insert, after update) {
    /** With 'ClosedOpportunityTrigger' active, 
        if an opportunity is inserted or updated with a stage of 'Closed Won',
        it will have a task created with the subject 'Follow Up Test Task'.*/
    List<Task> taskList = new List<Task>();
    for (Opportunity opp: Trigger.new) {
        // case insert
        if (Trigger.isInsert) {
            taskList.add(new Task(Subject='Follow Up Test Task', WhatId = opp.Id));
        }
        // case update
        if (Trigger.isUpdate && opp.StageName == 'Closed Won' && Trigger.oldMap.get(opp.Id).StageName != 'Closed Won') {
            taskList.add(new Task(Subject='Follow Up Test Task', WhatId = opp.Id));
        }
    }
    // need to check size of taskList before add
    if (taskList.size() > 0 ) {
        insert taskList;
    }
    
}