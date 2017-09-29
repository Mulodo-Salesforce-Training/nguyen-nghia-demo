// USE ES6 SYNTAX
var j$ = jQuery.noConflict();

j$(document).ready(function() {
    // candidate form
    let candidateForm = document.getElementById('candidate-custom-form');

    /**  Description: Method to call the standard controller action from SF
     *  Using Javascript Remoting Object
     *  @Param methodName {string}
     *  @Param dataList {string...}
     *  @Param callback action
     * @Standard_VF_Method
     * */
    let submitCandidate = () => {
        // first name
        let First_Name__c = document.getElementById('First_Name__c').value;
        // last name
        let Last_Name__c = document.getElementById('Last_Name__c').value;
        let Phone__c = document.getElementById('Phone__c').value;
        // email
        let Email__c = document.getElementById('Email__c').value;
        // birthday
        let Birthday__c = document.getElementById('Birthday__c').value;
        // photo
        let Photo__c = document.getElementById('Photo__c').value;
        // street
        let Street__c = document.getElementById('Street__c').value;
        // city
        let City__c = document.getElementById('City__c').value;
        // state-province
        let State_Province__c = document.getElementById('State_Province__c').value;
        // country
        let Country__c = document.getElementById('Country__c').value;
        // zip-postalcode
        let Zip_Postal_Code__c = document.getElementById('Zip_Postal_Code__c').value;
        // currentlyemployed
        let Currently_Employed__c = document.getElementById('Currently_Employed__c').value;
        // currentemployer
        let Current_Employer__c = document.getElementById('Current_Employer__c').value;
        // yearofexperience
        let Years_of_Experience__c = document.getElementById('Years_of_Experience__c').value;
        // education
        let Education__c = document.getElementById('Education__c').value;
        // standard object from sObjectModel
        var candidate = new SObjectModel.Candidate;
        // shorthand object ===> submit object contains all data from template
        const submitObject = {
            First_Name__c, Last_Name__c, Email__c, Phone__c,
            Birthday__c, Photo__c, Street__c, City__c,
            State_Province__c, Country__c, Zip_Postal_Code__c, Current_Employer__c,
            Years_of_Experience__c, Education__c
        };
        console.log('Submit Object', submitObject );
        candidate.create(submitObject, (err, recs) => {
            err ? console.log(err) : console.log(recs);
        })
    };

    candidateForm.addEventListener('submit', () => {
        submitCandidate();
    });

    // custom log to check value of each field
    // let customLog = `FirstName: ${firstName}.
    //  LastName: ${lastName}. Zip: ${zip_postal}.
    //  Email: ${email}. currentlyEmployed: ${currentlyEmployed}.
    //  Birthday: ${birthday}. currentEmployer : ${currentEmployer}.
    //  Photo: ${photo}. Year Of Exp: ${yearOfExp}.
    //  Street: ${street}. Education: ${education}.
    //  City: ${city}.
    //   `;
    // console.log(customLog);

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


