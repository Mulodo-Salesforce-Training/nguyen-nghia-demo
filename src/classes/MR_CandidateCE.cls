/**
	Description: Extension support for standardController
	@ControllerExtension
*/
/**
This extension is used to modify default page size from standardSet Controller
*/
public with sharing class MR_CandidateCE {
	private static final Integer DEFAULT_PAGE_SIZE = 5;
	// inject standardSetController in order to manipulate pagination and handle list data
	public MR_CandidateCE(ApexPages.StandardSetController standardController) {
		// set default page size from standard controller provided
		standardController.setPagesize(DEFAULT_PAGE_SIZE);
	}

}