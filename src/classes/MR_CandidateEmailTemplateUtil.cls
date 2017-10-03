/**
 * Created by admin_1 on 26/09/2017.
 */

/** Description: To Create An Email Format Base on Template
* Due to Using Direct Template from Salesforce need to specifies Contact or User To send Email
* However we just want to send email to candidate object email so we need to add our local template
*/
public class MR_CandidateEmailTemplateUtil {
	private static final string EmailTemplate = 'Dear {0}, \n' +
	'Thank you for joining our interview. We would like to invite you to join our company, please check our offer details in attachment file and send your confirmation about this.\n' +
	'Thank you for reading this mail.';

	/** Description: Method get in recipient name and return an email message base on EmailTemplate
	*/
	public static string GetEmailTemplate(string recipient) {
		return String.format(EmailTemplate, new String[] {recipient});
	}
}