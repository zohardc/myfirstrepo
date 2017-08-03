package da;

import java.util.List;

import model.Customer;

public interface CustomerdaI {
	
	//CRUD-Create
	public void addCustomer(Customer customer);
	
	//CRUstD-Read
	public List<Customer> getAllCustomers();
	public Customer getCustomerByID(int customerid);
	
	//CRUstD-Update
	public void updateCustomer(Customer customer);
	
	//CRUstD-Delete
	public void deleteCustomer(int customerid);
	
	

}
