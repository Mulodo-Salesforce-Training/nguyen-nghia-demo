trigger exampleTrigger on Contact (after insert, after delete) {
    if (Trigger.isInsert) {
        Integer recCount = Trigger.New.size();
        EmailManager.sendMail ('nguyen.nghia@mulodo.com', 'Demo Trigger', recCount + 'contact(s) were inserted');
    }
    if (Trigger.isDelete) {
        // nothing here
    }
}