/**
 * Created by admin_1 on 26/09/2017.
 */
@isTest
private class MR_EmailHelperUtilTest {
	@isTest static void TestSendMessageErr() {
		MR_EmailHelperUtil.sendMail(null, null, null);
	}
}