/**
 * Created by remjx on 29-Sep-17.
 */
/**	Description: A controller to send data in JSON type to Angular controller
	@ControllerExtension
*/
public with sharing class candidateTestAngular {
	// procedure constructor
	public candidateTestAngular(ApexPages.StandardController controller) {

	}
	@RemoteAction
	public static string getJSONCandidates() {
		// serialize to JSON
		return JSON.serialize([SELECT First_Name__c, Last_Name__c FROM Candidate__c]);
	}

	/** Description: To Test Pick List Value From Apex and describe on form
		@Remoting Javascript
	*/
	@RemoteAction
	public static string getEducationPickList() {
		Schema.DescribeFieldResult educationField = Candidate__c.Education__c.getDescribe();
		List<Schema.PicklistEntry> countryPickList = educationField.getPicklistValues();
		return JSON.serialize(countryPickList);
	}

	@AuraEnabled
	public List<Candidate__c> getListCandidate() {
		return [SELECT First_Name__c, Last_Name__c FROM Candidate__c];
	}
}