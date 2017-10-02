// USE ES6 SYNTAX
var j$ = jQuery.noConflict();

function removeValidateMessage() {
    var errWrapper = document.getElementById('error-message-wrapper');
    errWrapper.classList.add('slds-hide');
}

function redirectTo(href) {
    window.location.href = href;
}



j$(document).ready(function() {
    // candidate form
    let candidateForm = document.getElementById('candidate-custom-form');
    let errRes = document.getElementById('error-message-wrapper'); // get errRes div to toggle hidden/show the block
    let errInfo = document.getElementById('error-message-info'); // errMess to appendHTML message to show validation message
    let successRes = document.getElementById('success-message-wrapper'); // get successRes div to toggle hidden/show the block
    let successInfo = document.getElementById('success-message-info'); // successInfo to appendHTML message to show validation message
    j$('#Birthday__c').datepicker(); // datepicker init by appiPhony
    j$('#Birthday__c').datepicker(); // datepicker init by appiPhony
    j$('[data-aljs="picklist"]').picklist(); // picklist init by appiPhony

    /**  Description: Method to call the standard controller action from SF
     *  Using Javascript Remoting Object
     *  @Param methodName {string}
     *  @Param dataList {string...}
     *  @Param callback action
     * @Standard_VF_Method
     * */
    var submitCandidate = () => {

        // first name
        let First_Name__c = document.getElementById('First_Name__c').value;
        // last name
        let Last_Name__c = document.getElementById('Last_Name__c').value;
        let Phone__c = document.getElementById('Phone__c').value;
        // email
        let Email__c = document.getElementById('Email__c').value;
        // birthday
        let Birthday__c = document.getElementById('Birthday__c').value;
        if (Birthday__c) { Birthday__c = moment(Birthday__c, 'MM/DD/YYYY').toDate(); }

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
        // console.log('Submit Object', submitObject ); //logger
        candidate.create(submitObject, (err, recs) => {
            if (err) {
                errInfo.innerHTML = err;
                errRes.classList.remove('slds-hide');
                errRes.focus();
                window.location.hash = 'error-message-wrapper';
            }
            if (recs) {
                successInfo.innerHTML = `Candidate ${recs} has been created`;
                successRes.classList.remove('slds-hide');
                window.location.has = 'success-message-wrapper';
            }
        })
    };

    candidateForm.addEventListener('submit', (e) => {
        e.preventDefault();
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


