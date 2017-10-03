/**
 * Created by admin_1 on 26/09/2017.
 */
@isTest
private class MR_PositionTriggerTest {
	@isTest static void testConflictInsert() {
		//	DATA FACTORY
		Position__c pos = new Position__c( Name = 'Conflict Test');
		insert pos;

		// START TEST
		Test.startTest();
			Position__c dupPos = new Position__c(Name= 'Conflict Test');
			Database.SaveResult res = Database.insert(dupPos, false); // use Database.SaveResult to assert SaveResult getErrors()
		Test.stopTest();

		// ASSERT
		System.assert(!res.isSuccess());
		System.assert(!res.getErrors().isEmpty());
		System.assertEquals('Conflict! Position: Conflict Test has already existed.', res.getErrors()[0].getMessage());
	}
}