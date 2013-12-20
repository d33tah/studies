package crud.crud;

import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.List;
import java.util.Scanner;

public class MenuCLI {

	private class CannotSelect extends Exception {
	}

	private ContactManager manager;
	private String name;
	private String email;
	private Scanner sc;
	private Contact contact;

	public MenuCLI(ContactManager manager) {
		this.manager = manager;
		sc = new Scanner(System.in);
	}

	private void showContacts(List<Contact> list) {
		int i = 1;
		for (Contact contact : list) {
			System.out.printf("%2d: %s %s\n", i, contact.getName(),
					contact.getEmail());
			i += 1;
		}
	}

	private Contact selectContact() throws CannotSelect {
		List<Contact> list = manager.read();
		if (list.size() == 0) {
			throw new CannotSelect();
		}
		showContacts(list);
		for (;;) {
			System.out.print("Select a contact: ");
			int index = sc.nextInt();
			sc.nextLine();
			index -= 1;
			if (index < 0 || index > list.size()) {
				System.out.println("A contact with this ID does not exist.");
			}
			return list.get(index);
		}
	}

	private void askForData() {
		System.out.print("Please enter the name: ");
		name = sc.nextLine();
		System.out.print("Please enter the email: ");
		email = sc.nextLine();
	}

	public void showMenu() throws IOException {
		for (;;) {
			System.out.println("0. [E]xit");
			System.out.println("1. [C]reate");
			System.out.println("2. [R]ead");
			System.out.println("3. [U]pdate");
			System.out.println("4. [D]elete");
			System.out.print("Select one of the numbers: ");

			String line = sc.nextLine();
			char reply = line.charAt(0);
			System.out.println("");
			try {
				switch (reply) {
				case '0':
				case 'e':
					return;
				case 'c':
				case '1':
					askForData();
					manager.create(name, email);
					break;
				case '2':
				case 'r':
					showContacts(manager.read());
					break;
				case '3':
				case 'u':
					contact = selectContact();
					askForData();
					manager.update(contact, name, email);
					break;
				case '4':
				case 'd':
					contact = selectContact();
					manager.delete(contact);
					break;
				default:
					System.out.println("Unknown option: " + reply);
					break;
				}
			} catch (CannotSelect e) {
				System.out.println("No records in the database.");
			}
		}
	}

}
