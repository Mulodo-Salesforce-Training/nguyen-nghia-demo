/**
 * Created by nguyen.nghia@mulodo.com on 10/3/2017.
 */
/** DESCRIPTION: Test Class for Candidate Form Controller Extension
*	@TestControllerExtension
*/
@isTest
private class MR_CandidateFormCETest {
	@TestSetup static void dataFactory() {
		Candidate__c candidate = new Candidate__c(
			First_Name__c = 'Nguyen',
				Last_Name__c = 'Nghia',
				Email__c = 'nguyen.nghia@mulodo.com',
				Phone__c = '01212137215'
		);
		insert candidate;
	}

	@isTest static void testConstructor() {
		// data factory
		Candidate__c testCandidate = new Candidate__c(
				First_Name__c = 'Nghia',
				Last_Name__c ='Nguyen',
				Email__c = 'nguyen.nghia@mulodo.com',
				Phone__c = '01212132815'
		);
		insert testCandidate;
		ApexPages.StandardController stdCtrl = new ApexPages.StandardController(testCandidate);

		Test.startTest();
		MR_CandidateFormCE candidateFormCE = new MR_CandidateFormCE(stdCtrl);
		Test.stopTest();

		System.assert(candidateFormCE != null, 'Constructor success');
	}

	@isTest static void testGetEducationPickList() {
		Test.startTest();
		List<Schema.PicklistEntry> educationPickList = MR_CandidateFormCE.getEducationPickList();
		Test.stopTest();
		System.assert(educationPickList.size() > 0, 'Should be able to get Education Pick List');
	}

	@isTest static void testGetCountryPickList() {
	Test.startTest();
		List<Schema.PicklistEntry> countryPickList = MR_CandidateFormCE.getCountryPickList();
		List<Schema.PicklistEntry> educationPickList = MR_CandidateFormCE.getEducationPickList();
	Test.stopTest();

		System.assert(countryPickList.size() > 0, 'Should be able to get Country Pick List');
		System.assert(educationPickList.size() > 0, 'Should be able to get Education Pick List');


	}

	@isTest static void testGetJSONCandidates() {
		Test.startTest();
		String JSONRes = MR_CandidateFormCE.getJSONCandidates();
		List<Candidate__c> parseFromJSONList = (List<Candidate__c>) System.JSON.deserialize(JSONRes, List<Candidate__c>.class);
		Test.stopTest();
		System.assert(!String.isEmpty(JSONRes), 'Return string should not be empty');
		System.assert(parseFromJSONList.size() > 0 , 'Return List should be greater than 0');
	}

	@isTest static void testGetJSONEducationPickList() {
		Test.startTest();
		String JSONEducationPickList = MR_CandidateFormCE.getJSONEducationPickList();
		List<Schema.PicklistEntry> educationPickList = (List<Schema.PicklistEntry>)System.JSON.deserialize(JSONEducationPickList, List<Schema.PicklistEntry>.class);
		Test.stopTest();
		System.assert(!String.isEmpty(JSONEducationPickList), 'Return string should not be empty');
		System.assert(educationPickList.size() > 0, 'Should be able to convert to List and list size > 0');
	}

}