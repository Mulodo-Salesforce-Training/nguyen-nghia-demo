@isTest
public class TestAccountDeletion {
    @isTest static void TestDeleteAccountWithOneOpportunity() {
        Account account = new Account(Name = 'Example Account');
        insert account;
        Opportunity accOpp = new Opportunity(
            AccountId = account.Id,
            StageName = 'Prospecting',
            CloseDate = System.today().addMonths(1),
            Name = account.Name + ' Opportunity'
        );
        insert accOpp;
        // perform test
        Test.startTest();
        Database.DeleteResult result = Database.delete(account, false);
        Test.stopTest();
        
        System.assert(!result.isSuccess());
        System.assert(result.getErrors().size() > 0);
        System.assertEquals('Cannot delete account with related opportunities.',
                             result.getErrors()[0].getMessage());
        
    }
}