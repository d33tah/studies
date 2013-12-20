package crud.crud;

import java.util.List;


import org.hibernate.Session;
import org.hibernate.Transaction;

public class ContactManager {
	
	Session session;

	public ContactManager(Session session) {
		this.session = session;
	}

	public void create(String name, String email) {
		Transaction tx = session.beginTransaction();
		Contact myContact = new Contact(name, email);
		session.save(myContact);
		session.flush();
		tx.commit();
	}

	@SuppressWarnings("unchecked")
	public List<Contact> read() {
		return session.createQuery("from Contact").list();
	}

	public void delete(Contact contact) {
		Transaction tx = session.beginTransaction();
		session.delete(contact);
		session.flush();
		tx.commit();

	}

	public void update(Contact contact, String name, String email) {
		Transaction tx = session.beginTransaction();
		contact.setName(name);
		contact.setEmail(email);
		session.save(contact);
		session.flush();
		tx.commit();

	}

}
