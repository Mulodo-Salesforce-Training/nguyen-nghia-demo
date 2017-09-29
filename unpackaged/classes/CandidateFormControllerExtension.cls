/**
 * Created by admin_1 on 28/09/2017.
 */
public class CandidateFormControllerExtension {

	public CandidateFormControllerExtension(ApexPages.StandardController controller) {
	}

	@RemoteAction
	public static Id createAccount(String name,String fax){

		Account acc = new Account();
		acc.Name = name;
		acc.Fax = fax;

		insert acc;

		return acc.Id;
	}
}