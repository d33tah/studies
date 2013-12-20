package crud.crud;
 
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
 
/**
 * The persistent class for the contact database table.
 *
 */
@Entity
@Table(name = "contact")
public class Contact {
	@GeneratedValue
	@Id
    private Integer id;
    private String name;
    private String email;
 
    public Contact() {
    	//wolalbym bez, ale hibernate wymaga.
    }
 
    public Contact(String name, String email) {
        this.name = name;
        this.email = email;
    }
 
    public Integer getId() {
        return this.id;
    }
 
    public String getName() {
        return this.name;
    }
 
    public void setName(String name) {
        this.name = name;
    }
 
    public String getEmail() {
        return email;
    }
 
    public void setEmail(String email) {
        this.email = email;
    }
}