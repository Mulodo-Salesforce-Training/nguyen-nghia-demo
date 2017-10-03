/**
 * Created by admin_1 on 26/09/2017.
 */
public class MR_EmailHelperUtil {
	// Send Mail Method using Template from SF
	public static void sendMailUsingSFTemplate(Candidate__c candidate) {
		if (candidate == null) { return; } // skipped if candidate == null
		Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage(); // mail content will be sent
		OrgWideEmailAddress owa = [SELECT Id, DisplayName, Address FROM  OrgWideEmailAddress LIMIT 1];
		EmailTemplate emailTemplate = [SELECT Id FROM EmailTemplate WHERE Name= 'ConfirmationEmailTemplate'];
		// select a dummy contact
		Contact c = [select id, Email from Contact where email <> null limit 1];

		List<Messaging.SingleEmailMessage>  willRollBackMailList = new List<Messaging.SingleEmailMessage>(); // email in this list will not be sent
		List<Messaging.SingleEmailMessage>  willSendMailList = new List<Messaging.SingleEmailMessage>();

		mail.setToAddresses(new List<String> {candidate.Email__c});
		mail.setTargetObjectId(c.Id);
		mail.setTemplateID(emailTemplate.Id);
		mail.setSaveAsActivity(false);
		mail.setOrgWideEmailAddressId(owa.Id);
		mail.setWhatId(candidate.Id);
		willRollBackMailList.add(mail);
		Savepoint sp = Database.setSavepoint();
		Messaging.sendEmail(willRollBackMailList);
		Database.rollback(sp);
		// need to roll back to evade from send email to some random contact
		for(Messaging.SingleEmailMessage ml: willRollBackMailList) {
			Messaging.SingleEmailMessage emailToSend = new Messaging.SingleEmailMessage();
			emailToSend.setToAddresses(ml.getToAddresses());
			emailToSend.setPlainTextBody(ml.getPlainTextBody());
			emailToSend.setHtmlBody(ml.getHtmlBody());
			emailToSend.setSubject(ml.getSubject());
			willSendMailList.add(emailToSend);
		}
		Messaging.sendEmail(willSendMailList);

	}
}