package crud.crud;

import java.awt.Menu;
import java.io.DataInputStream;
import java.io.IOException;
import java.util.List;
import java.util.Properties;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistry;
import org.hibernate.service.ServiceRegistryBuilder;

import org.apache.log4j.Logger;

public class App {

	static final Logger logger = Logger.getRootLogger();
	
	//http://www.srccodes.com/p/article/7/Annotation-based-Hibernate-Hello-World-example-using-Maven-build-tool-and-SQLite-database
	private static SessionFactory sessionFactory = null;
	private static ServiceRegistry serviceRegistry = null;

	private static SessionFactory configureSessionFactory()
			throws HibernateException {
		Configuration configuration = new Configuration();
		configuration.configure();

		Properties properties = configuration.getProperties();

		serviceRegistry = new ServiceRegistryBuilder()
				.applySettings(properties).buildServiceRegistry();
		sessionFactory = configuration.buildSessionFactory(serviceRegistry);

		return sessionFactory;
	}


	public static void main(String[] args) {
		// Configure the session factory
		configureSessionFactory();

		Session session = null;
		
		org.apache.log4j.Logger.getLogger("org.hibernate").setLevel(org.apache.log4j.Level.WARN);
		org.apache.log4j.Logger.getLogger("main").setLevel(org.apache.log4j.Level.WARN);
		logger.setLevel(org.apache.log4j.Level.WARN);

		try {
			session = sessionFactory.openSession();
			
			MenuCLI menu = new MenuCLI(new ContactManager(session));
			menu.showMenu();

		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			if (session != null) {
				session.close();
			}
		}
	}
}