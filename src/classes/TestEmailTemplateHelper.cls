/**
 * Created by admin_1 on 26/09/2017.
 */
@isTest
public class TestEmailTemplateHelper {
	@isTest static void TestGetTemplate() {
		String outputTarget = 'Dear John, \n' +
				'Thank you for joining our interview. We would like to invite you to join our company, please check our offer details in attachment file and send your confirmation about this.\n' +
				'Thank you for reading this mail.';
		String res = CandidateEmailTemplateHelper.GetEmailTemplate('John');
		System.assert(res.length() > 0);
		System.assertEquals(outputTarget, res);
	}
}