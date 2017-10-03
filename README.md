# A demo App Of Salesforce:
Mulodo Recruitment
# Features:
- Candidates CRUD
- Position CRUD
- Job Application CRUD
- Trigger
    - Email Sending Trigger
    - Position Conflict Trigger
- External Callout
    - Using Open Weather API
    - Store ApiKey in Custom Metadata Object    
- Custom Validation
    - Candidate:
        - Email
        - Phone
- Controller Extensions:
    - CandidateFormCE (inject StandardController)
    - CandidateCE (inject StandardSetController)
- Custom Controller: 
    - CandidateWeatherCC
- Visual Force Pages (Using Lightning Design System): 
    - New Candidate Custom Form (Using Javascript Remote Object)
    - Candidate List Custom 
    - Open Weather Form
- Unit Testing
    - Controller Extensions (Standard, Standard Set)
    - HttpCalloutMock
