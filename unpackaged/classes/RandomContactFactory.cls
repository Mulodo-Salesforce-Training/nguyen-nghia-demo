public class RandomContactFactory {
    public static List<Contact> generateRandomContacts(Integer amount, string lastName) {
        List<Contact> output = new List<Contact>();
        for (Integer i = 0; i < amount; i++) {
            output.add(new Contact(FirstName = 'Test_' + i, LastName = lastName));
        }
        return output;
    }
}