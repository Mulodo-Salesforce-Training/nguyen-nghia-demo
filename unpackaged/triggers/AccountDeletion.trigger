trigger AccountDeletion on Account (before delete) {   

    for (Account a: [SELECT Id FROM Account WHERE Id IN (SELECT AccountId FROM Opportunity) AND Id IN :Trigger.old]) {
        Trigger.oldMap.get(a.Id).addError('Cannot delete account that has related opportunities');
    }
}