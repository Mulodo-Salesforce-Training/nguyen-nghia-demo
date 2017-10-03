/**
 * Created by nguyen.nghia@mulodo.com on 28/09/2017.
 */

/** Description: Candidate Controller Extension - use to get custom Object Data
*	To Handle Form Control in Visual Force Page:  CandidateCustomFormPage
*/
public class MR_CandidateFormCE {
	// inject StandardController to be able to get object Data
	public MR_CandidateFormCE(ApexPages.StandardController controller) {
	}

	/** Description: Return Country Pick List for candidateCustomFormPage
	*/
	public static List<Schema.PicklistEntry> getCountryPickList() {
		Schema.DescribeFieldResult countryField = Candidate__c.Country__c.getDescribe();
		List<Schema.PicklistEntry> countryPickList = countryField.getPicklistValues();
		return countryPickList;
	}

	/** Description: Return Education Pick List for candidateCustomFormPage
	*/
	public static List<Schema.PicklistEntry> getEducationPickList() {
		Schema.DescribeFieldResult educationField = Candidate__c.Education__c.getDescribe();
		List<Schema.PicklistEntry> educationPickList = educationField.getPicklistValues();
		return educationPickList;
	}

	/** Description: To Test Pick List Value From Apex and describe on form (Experiment only!)
	* 	@Remoting Javascript
	*/
	@RemoteAction
	public static string getJSONEducationPickList() {
		Schema.DescribeFieldResult educationField = Candidate__c.Education__c.getDescribe();
		List<Schema.PicklistEntry> countryPickList = educationField.getPicklistValues();
		return JSON.serialize(countryPickList);
	}
	/** Description: Get Candidate List in JSON String(Experiment only!)
	* 	@Remoting Javascript
	*/
	@RemoteAction
	public static string getJSONCandidates() {
		// serialize to JSON
		return JSON.serialize([SELECT First_Name__c, Last_Name__c FROM Candidate__c]);
	}
}