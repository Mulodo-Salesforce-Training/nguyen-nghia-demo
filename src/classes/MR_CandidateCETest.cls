/**
 * Created by nguyen.nghia@mulodo.com on 10/3/2017.
 */
/** DESCRIPTION: Test Class For CandidateControllerExtension
*/
@isTest
private class MR_CandidateCETest {
	@isTest static void testConstructor() {
		// data factory
		Candidate__c testCandidate = new Candidate__c(
				First_Name__c = 'Nghia',
				Last_Name__c ='Nguyen',
				Email__c = 'nguyen.nghia@mulodo.com',
				Phone__c = '01212132815'
		);
		insert testCandidate;

		Test.startTest();
			ApexPages.StandardSetController stdSetCtrl = new ApexPages.StandardSetController(new List<Candidate__c> {testCandidate});
			System.assertNotEquals(stdSetCtrl.getPageSize(), 5, 'Before init, pageSize of controller should not equals to 5');
//			IMPORTANT!: HAVE TO SAVE STANDARDSETCONTROLLER BEFORE CONSTRUCTOR
//			IF NOT WE WILL CATCH EXCEPTION:
//				System.VisualforceException: Modified rows exist in the records collection!
			stdSetCtrl.save(); // IMPORTANT!
			MR_CandidateCE candidateCE = new MR_CandidateCE(stdSetCtrl);
		Test.stopTest();

		System.assertEquals(stdSetCtrl.getPageSize(), 5, 'After init, pageSize of controller should be 5');
	}
}