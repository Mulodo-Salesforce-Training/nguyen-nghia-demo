public class AccountHandler {
    public static Account insertNewAccount (String input) {
        Account insrtAcc = new Account();
        insrtAcc.name = input;
        try {
            insert insrtAcc;
            System.debug(insrtAcc);
            return insrtAcc;
        } catch (DMLException e) {
            System.debug(e);
        }
        return null;
    }
}