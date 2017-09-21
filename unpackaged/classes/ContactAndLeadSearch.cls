public class ContactAndLeadSearch {
    public static List<List<SObject>> searchContactsAndLeads (string name) {
        return (List<List<SObject>>) [FIND :name IN ALL FIELDS RETURNING Contact(firstname, lastname), Lead(firstname, lastname)];
    }
}