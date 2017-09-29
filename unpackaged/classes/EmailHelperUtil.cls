/**
 * Created by admin_1 on 26/09/2017.
 */
public class EmailHelperUtil {

	// Public method
	public static void sendMail(String address, String subject, String body) {
		// Create an email message object
		Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
		String[] toAddresses = new String[] {address};
		mail.setToAddresses(toAddresses);
		mail.setSubject(subject);
		mail.setPlainTextBody(body);
		// Pass this email message to the built-in sendEmail method
		// of the Messaging class
		try {
			Messaging.sendEmail(
					new Messaging.SingleEmailMessage[] { mail });
		} catch (EmailException err) {
			System.debug(err);
		}


		// Call a helper method to inspect the returned results
//		inspectResults(results);
	}

	// Helper method
//	private static Boolean inspectResults(Messaging.SendEmailResult[] results) {
//		Boolean sendResult = true;
//
//		// sendEmail returns an array of result objects.
//		// Iterate through the list to inspect results.
//		// In this class, the methods send only one email,
//		// so we should have only one result.
//		for (Messaging.SendEmailResult res : results) {
//			if (res.isSuccess()) {
//				System.debug('Email sent successfully');
//			}
//			else {
//				sendResult = false;
//				System.debug('The following errors occurred: ' + res.getErrors());
//			}
//		}
//
//		return sendResult;
//	}


	//  -------------------------------------------------------------------------
//  HELPER method: sendTemplatedEmail
//  -------------------------------------------------------------------------
//	public static void sendTemplatedEmail(String[] toRecipients, String[] ccRecipients, String templateApiName, ID targetObjId, Id whatId, ID orgWideEmailId, Boolean saveAsActivity, Attachment[] attachList ) {
//		//  templateId   must be ID of an Email template
//		//  targetObjId must be a Contact, User, Lead Id -- also used in merge fields of template recipient.xxxx
//		//  whatId    must be an SObject that is used in the merge fields of the template relatedTo.xxxx
//		//  fromId    if non null, use current user, otherwise, use this ID (most likely an org wide no reply id)
//		//  bcc      not permitted when using templates
//
//		Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
//
//		Id templateId;
//		try {templateId = [select id, name from EmailTemplate where developername = : templateApiName].id;}
//		catch (QueryException e) {
//			throw new QueryException ('[U-03] Unable to locate EmailTemplate using name: ' + templateApiName +
//					' refer to Setup | Communications Templates ' + templateApiName);
//		}
//
//
//		email.setToAddresses(toRecipients);
//		email.setCcAddresses(ccRecipients);
//		email.setTargetObjectId(targetObjId);
//		email.setWhatId(whatId);
//		email.setorgWideEmailAddressId(orgWideEmailId);
//		email.setTemplateId(templateId);
//		email.setSaveAsActivity(saveAsActivity);      // save email as activity on the targetObjId (i.e. Contact). Note activity can't be saved on Users
//
//		System.debug(LoggingLevel.INFO,'** entered sendTemplatedEmail, to:' + toRecipients + ' cc:' + ccRecipients +  ' templateId:' + templateId + ' tagetObjId:' + targetObjId +
//				' whatId:' + whatId + ' orgWideEmailId: ' + orgWideEmailId);
//		try {
//			Messaging.sendEmail(new Messaging.SingleEmailMessage[] {email});
//			return;
//		}
//		catch (EmailException e) {throw new EmailException('[U-02] sendTemplatedEmail error. ' + e.getMessage());}
//
//	}
}