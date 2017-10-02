/**
 * Created by admin_1 on 28/09/2017.
 */
public class MR_CandidateFormCE {

	public MR_CandidateFormCE(ApexPages.StandardController controller) {
	}
// TO TEST ANGULAR
//	@RemoteAction
//	public static Id createAccount(String name,String fax){
//
//		Account acc = new Account();
//		acc.Name = name;
//		acc.Fax = fax;
//
//		insert acc;
//
//		return acc.Id;
//	}
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
}