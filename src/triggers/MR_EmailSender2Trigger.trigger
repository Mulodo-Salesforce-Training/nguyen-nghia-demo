trigger MR_EmailSender2Trigger on Job_Application__c (after update, after insert) {
	// list of candidates will be sent
	List<Candidate__c> sentIMList = new List<Candidate__c>();
	// store id to get candidate list using SOQL query
	List<Id> sentIMId = new List<Id>();

	// set up the send email list
	//	CASE UPDATE ==> EASIER TO WRITE UNIT TEST
	if(trigger.isUpdate) {
		for(Job_Application__c app: trigger.new) {
			// check app status and app status change or not
			if(app.Status__c == 'Schedule Interviews' && app.Status__c != trigger.oldMap.get(app.Id).Status__c) {
				sentIMId.add(app.Candidate__c);
			}
		}
	}
	// CASE INSERT ==> EASIER TO WRITE UNIT TEST
	if(trigger.isInsert) {
		for(Job_Application__c app: trigger.new) {
			if(app.Status__c == 'Schedule Interviews') {
				sentIMId.add(app.Candidate__c);

			}
		}
	}

	// SOQL Query candidate list to get Email(recipient address)  and First Name(for email template)
	if(!sentIMId.isEmpty()) {
		for(Candidate__c[] cans: [SELECT Email__c, First_Name__c FROM Candidate__c WHERE Id IN :sentIMId]) {
			// chjeck if cans if empty or not
			if(!cans.isEmpty()) {
				for(Candidate__c c: cans) {
					sentIMList.add(c);
				}
			}
		}
	}

	// send email to each candidates with status == review resume
	if (!sentIMList.isEmpty()) {
		for(Candidate__c can: sentIMList) {
			// debug candidate
			System.debug(can.Email__c);
			string template = MR_CandidateEmailTemplateUtil.GetEmailTemplate(can.First_Name__c);
			if (can.Email__c != null) {
//				MR_EmailHelperUtil.sendMail(can.Email__c,
//						'Candidate Confirmation' ,
//						template) ;
				MR_EmailHelperUtil.sendMailUsingSFTemplate(can);
			}
		}
	}


}