var j$ = jQuery.noConflict();

j$(document).ready(function() {

});

function createAccount() {
    if (!validatorSLDSplugin.validate()) {
        var name = document.getElementById('Name').value;
        var fax = document.getElementById('fax').value;
        Visualforce.remoting.Manager.invokeAction(
            '{!$RemoteAction.CandidateFormControllerExtension.createAccount}',
            name,
            fax,
            function(result, event) {
                if (event.status) {
                    console.log(result);
                    validatorSLDSplugin.displayalert('Record created with Id..'+result,'slds-notify slds-notify--alert slds-theme--success slds-theme--alert-texture');
                } else {
                    validatorSLDSplugin.displayalert(event.message,'slds-notify slds-notify--alert slds-theme--error slds-theme--alert-texture');
                }
            }, {
                escape: false
            }
        );
    }
}
