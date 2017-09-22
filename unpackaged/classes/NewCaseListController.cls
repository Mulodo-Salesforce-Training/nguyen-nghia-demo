/**
 * Created by admin_1 on 22/09/2017.
 */
public class NewCaseListController {
	public List<Case> getNewCases () {
		// id, case Number Where status = New only
		return [SELECT ID, CaseNumber FROM Case WHERE Status = 'New' LIMIT 10];
	}
}