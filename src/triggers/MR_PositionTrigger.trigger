trigger MR_PositionTrigger on Position__c(before insert) {
	private static final String ERR_TEMPLATE = 'Conflict! Position: {0} has already existed.';
	List<String> newNameList = new List<String>();
	List<Position__c> conflictPosList;
	if (Trigger.isInsert && !Trigger.new.isEmpty()) {
		// add name of each trigger.new in newNameList
		for(Position__c newPos: Trigger.new) {
			newNameList.add(newPos.Name);
		}
		// using bulk query to get conflictPosList
		conflictPosList = [SELECT Name FROM Position__c WHERE Name IN :newNameList];
		if (conflictPosList.size() > 0 ) {
			// iterate through conflict list
			for (Position__c conflictPos: conflictPosList) {
				// foreach conflictPos find the conflict insert from trigger.new that match Name with the conflictPos
				for (Position__c insertPos: Trigger.new) {
					// if found conflict ===> through error to insertPos from trigger.new
					if(insertPos.Name.equals(conflictPos.Name)) {
						insertPos.addError(String.format(
											ERR_TEMPLATE,
											new List<String>{conflictPos.Name}));
					} else {
						return;
					}
				}
			}

		} else {
			return;
		}
	} else {
		return ;
	}


//	OLD VERSION: NOT USING BULK QUERY
//	if(Trigger.isInsert && !Trigger.new.isEmpty()) {
//		// using bulk query
//		List<Position__c> conflictList = [SELECT Id FROM Position__c WHERE Name IN :Trigger.new];
//		for(Position__c newPos: Trigger.new) {
//			// not need to use bulk query here because we have to send error to each insert object
//			List<Position__c> conflictList = [SELECT Id FROM Position__c WHERE Name =: newPos.Name];
//			// if conflict List.length > 0 ===> means already existed this name
//			if(!conflictList.isEmpty()) {
//
//				String errorMsg = String.format(errorTemplate, new String[] {newPos.Name});
//				// through message
//				newPos.addError(errorMsg);
//			}
//		}
//	}



}