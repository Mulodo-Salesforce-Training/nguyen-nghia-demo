/**
 * Created by admin_1 on 26/09/2017.
 */
@isTest
private class MR_EmailSenderTriggerTest {
	@testSetup static void dataFactory() {
		// data factory
		// need to add extra contact because emailSenderTrigger is base on roll back email sending to a random contact
		Contact contact = new Contact(
				Salutation = 'Ms.',
				LastName = 'Nghia',
				Email='test@mulodo.com'
		);
		insert contact;

		Candidate__c testCan = new Candidate__c(
				First_Name__c = 'Nghia',
				Last_Name__c ='Nguyen',
				Phone__c = '01212132815',
				Email__c = 'nguyen.nghia@mulodo.com'
		);
		insert testCan;
		Position__c testPos = new Position__c(Name='C# Test Pos');
		insert testPos;
		Job_Application__c testApp = new Job_Application__c(Candidate__c = testCan.Id, Position__c = testPos.Id, Status__c ='New');
		insert testApp;
	}

	@isTest static void TestOnCreate() {
		// get data from test factory
		Candidate__c testCan = [SELECT Id FROM Candidate__c WHERE First_Name__c = 'Nghia'];
		Position__c testPos = [SELECT Id FROM Position__c WHERE Name = 'C# Test Pos'];

		// start test
		Test.startTest();
			Job_Application__c newApp = new Job_Application__c(
					Candidate__c = testCan.Id,
					Position__c = testPos.Id,
					Status__c ='Schedule Interviews'
			);
			insert newApp;
			Integer emailInvocations = Limits.getEmailInvocations();
		Test.stopTest();
		System.assert(newApp.Id != null, 'New Application created');
		System.assertEquals(2, emailInvocations, 'An email should be send');
		/**@TODO Add System Assert Here*/
	}

	@isTest static void TestOnUpdate() {
		// get data from test factory
		Job_Application__c existsApp = [SELECT Id, Status__c FROM Job_Application__c WHERE Status__c = 'New' LIMIT 1];

		// test
		Test.startTest();
			existsApp.Status__c = 'Schedule Interviews';
			update existsApp;
			Integer emailInvocations = Limits.getEmailInvocations();
		Test.stopTest();
		System.assertEquals(existsApp.Status__c, 'Schedule Interviews', 'Update Exist App Success');
		System.assertEquals(2, emailInvocations, 'An email should be send');
	}

}