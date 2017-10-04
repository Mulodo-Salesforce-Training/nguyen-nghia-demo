trigger MR_EmailSenderTrigger on Job_Application__c (after update, after insert) {
	// list of candidates will be sent
	List<Candidate__c> candidateReceiveEmailList = new List<Candidate__c>();
	// store id to get candidate list using SOQL query
	List<Id> candidateReceiveEmailIdList = new List<Id>();

	// 1.set up the send email list to use bulk query
	if(trigger.isUpdate) {
		for(Job_Application__c app: trigger.new) {
			// check app status and app status change or not
			if(app.Status__c == 'Schedule Interviews' && app.Status__c != trigger.oldMap.get(app.Id).Status__c) {
				candidateReceiveEmailIdList.add(app.Candidate__c);
			}
		}
	} else if (trigger.isInsert) {
		for(Job_Application__c app: trigger.new) {
			if(app.Status__c == 'Schedule Interviews') {
				candidateReceiveEmailIdList.add(app.Candidate__c);
			}
		}
	}

	// 2.SOQL Query candidate list to get Email(recipient address)  and First Name(for email template)
	if(!candidateReceiveEmailIdList.isEmpty()) {
		// NO NEED TO USE BATCH QUERY WHEN AMOUNT CANDIDATE IS NOT TOO LARGE (MORE THAN 200)
		candidateReceiveEmailList= [SELECT Email__c, First_Name__c FROM Candidate__c WHERE Id IN :candidateReceiveEmailIdList];
		System.debug(candidateReceiveEmailIdList);
		System.debug(candidateReceiveEmailList);
	}

	// send email to each candidates with status == review resume
	if (!candidateReceiveEmailList.isEmpty()) {
		for(Candidate__c candidate: candidateReceiveEmailList) {
			if (candidate.Email__c != null) {
//				MR_EmailHelperUtil.sendMail(can.Email__c,
//						'Candidate Confirmation' ,
//						template) ;
				MR_EmailHelperUtil.sendMailUsingSFTemplate(candidate);
			}
		}
	}


}