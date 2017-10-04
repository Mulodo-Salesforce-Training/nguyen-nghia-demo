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
					// if found conflict ===> throw error to insertPos from trigger.new
					if(insertPos.Name.equals(conflictPos.Name)) {
						insertPos.addError(String.format(
											ERR_TEMPLATE,
											new List<String>{conflictPos.Name}));
					}
				}
			}

		}
	}

}