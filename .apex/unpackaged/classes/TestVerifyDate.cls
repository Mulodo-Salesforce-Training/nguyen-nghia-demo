@isTest
public class TestVerifyDate {
	// test date within 30 days
    @IsTest static void testWithinNext30() {
        Date today = Date.today();
        Date next5Days = today.addDays(5);
        Date res = VerifyDate.CheckDates(today, next5Days);
        System.assertEquals(res, next5Days);
    }
	// date 2 smaller
    @IsTest static void testEndOfMonth() {
        Date today = Date.today();
        Date nextMonthDay = today.addDays(40);
        Date expectDay = Date.newInstance(2017, 9, 30);
        System.debug('Expect Date is : ' + expectDay);
        Date res = VerifyDate.CheckDates(today, nextMonthDay);
        System.debug('Next Value is : ' + res);
        System.assertEquals(res, expectDay);
    }
	// date 2 within 30 days
	// date 2 greater than 30 days
}