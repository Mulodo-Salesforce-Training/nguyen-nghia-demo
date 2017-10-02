/**
 * Created by admin_1 on 26/09/2017.
 */
@isTest
private class TestEmailHelperUtil {
	@isTest static void TestSendMessageErr() {
		EmailHelperUtil.sendMail(null, null, null);
	}
}