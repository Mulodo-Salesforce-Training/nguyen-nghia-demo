trigger PositionTrigger on Position__c(before insert) {
	String errorTemplate = 'Conflict! Position: {0} has already existed.';
	String[] conflictsIds = new String[]{};
//	List<String> newPosNameList = new List<String>();
	if(Trigger.isInsert && !Trigger.new.isEmpty()) {
		for(Position__c newPos: Trigger.new) {
			// not need to use bulk query here because we have to send error to each insert object
			List<Position__c> conflictList = [SELECT Id FROM Position__c WHERE Name =: newPos.Name];
			// if conflict List.length > 0 ===> means already existed this name
			if(!conflictList.isEmpty()) {

				String errorMsg = String.format(errorTemplate, new String[] {newPos.Name});
				// through message
				newPos.addError(errorMsg);
			}
		}
	}

	// check newPos Name in database Conflicts or not
//	if(!newPosNameList.isEmpty()) {
//		List<Position__c> conflictList = [SELECT Id, Name FROM Position__c WHERE Name IN :newPosNameList];
//		if(!conflictList.isEmpty()) {
//			for(Position__c flict: conflictList) {
//
//			}
//		}
//	}


}