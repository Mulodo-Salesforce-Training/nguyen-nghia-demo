/**
 * Created by admin_1 on 22/09/2017.
 */
public class ContactListController {
	private String sortOrder = 'LastName';
	// default getters method of contacts
	public List<Contact> getContacts() {
		String orderField = 'LastName';
//		List<Contact> contacts  = [
//				SELECT Id, FirstName, LastName, Title, Email FROM Contact ORDER BY LastName LIMIT 10
//		];
		// should use dynamic SOQL instead of inline query
		String queryString = 'SELECT Id, FirstName, LastName, Title, Email FROM CONTACT ' +
				'ORDER BY ' + sortOrder +
				' ASC LIMIT 10';
		List<Contact> contacts = Database.query(queryString);
		return contacts;
	}

	public void sortByLastName () {
		this.sortOrder  = 'LastName';
	}

	public void sortByFirstName () {
		this.sortOrder  = 'FirstName';
	}
}