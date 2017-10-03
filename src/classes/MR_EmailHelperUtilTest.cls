/**
 * Created by admin_1 on 26/09/2017.
 */
@isTest
private class MR_EmailHelperUtilTest {
	/** Test Case: Send to Null Candidate ===> email should not be sent
	*/
	@isTest(SeeAllData = true) static void TestSendMessageErr() {
		Test.startTest();
			MR_EmailHelperUtil.sendMailUsingSFTemplate(null);
			Integer emailInvocations = Limits.getEmailInvocations();
		Test.stopTest();
		System.assertEquals(emailInvocations, 0, 'should not send an error email');
	}
	/** Test Case: Send to Correct Candidate ===> expect email should be sent
	*/
	@isTest(SeeAllData = true) static void TestSendMessageWithTemplate() {
		// data factory
		Candidate__c candidate = new Candidate__c(
			First_Name__c = 'Nghia',
			Last_Name__c ='Nguyen',
			Email__c = 'nguyen.nghia@mulodo.com',
			Phone__c = '01212132815'
		);
		insert candidate;

		// test
		Test.startTest();
			MR_EmailHelperUtil.sendMailUsingSFTemplate(candidate);
			Integer emailInvocation = Limits.getEmailInvocations();
		Test.stopTest();
		System.assertEquals(emailInvocation, 2, 'Should send 2 email turns (1 roll back) after invoke sendMailMethod');
	}

}