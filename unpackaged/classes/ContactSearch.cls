public class ContactSearch {
    public static List<Contact> searchForContacts (string lastName, string mailingPostalCode) {
        return (List<Contact>) [SELECT id, name FROM Contact WHERE lastname =: lastName AND mailingpostalcode =: mailingPostalCode];
    }
}