/**
	Description: Extension support for standardController
	@ControllerExtension
*/
/**
This extension is used to modify default page size from standardSet Controller
*/
public with sharing class candidateControllerExtension {
	// procedure of an extension
	public candidateControllerExtension(ApexPages.StandardSetController standardController) {
		// set default page size from standard controller provided
		standardController.setPagesize(5);
	}


}