@isTest
public class TestRestrictContactByName {
	// 2 test
	// 1st. insert contact with a valid name
    @isTest static void validNameTest() {
        // create data test
        Test.startTest();
        Contact contact = new Contact(LastName = 'ARANDOMNAME');
        Database.SaveResult res = Database.insert(contact, false);
        Test.stopTest();
        System.assert(res.isSuccess());
        System.assert(res.getErrors().size() == 0);
    }
    
    // 1st. update contact with a valid name
    @isTest static void validNameTestUpdate() {
        // create data test
        Contact contact = new Contact(LastName = 'ARANDOMNAME');
        insert contact;
        Test.startTest();
        contact.LastName = 'OTHER NAME';
        Database.SaveResult res = Database.update(contact, false);
        Test.stopTest();
        System.assert(res.isSuccess());
        System.assert(res.getErrors().size() == 0);
        // System.assertEquals(res.getErrors()[0].getMessage(), 'The Last Name "'+contact.LastName+'" is not allowed for DML');
    }
    
	// 2nd. contact with an INVALIDNAME insert
    @isTest static void invalidNameTestInsert() {
        // create data test
        Test.startTest();
        Contact contact = new Contact(LastName = 'INVALIDNAME');
        Database.SaveResult res = Database.insert(contact, false);
        Test.stopTest();
        System.assert(!res.isSuccess());
        System.assert(res.getErrors().size() > 0);
        System.assertEquals(res.getErrors()[0].getMessage(), 'The Last Name "'+contact.LastName+'" is not allowed for DML');
    }
    
    // 2nd. update contact with Invalid Name
    @isTest static void invalidNameTestUpdate() {
        // create data test
        Contact contact = new Contact(LastName = 'ARANDOMNAME');
        insert contact;
        Test.startTest();
        contact.LastName = 'INVALIDNAME';
        Database.SaveResult res = Database.update(contact, false);
        Test.stopTest();
        System.assert(!res.isSuccess());
        System.assert(res.getErrors().size() > 0);
        System.assertEquals(res.getErrors()[0].getMessage(), 'The Last Name "'+contact.LastName+'" is not allowed for DML');
    }
}