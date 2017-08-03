
package model;
//pojo
public class Customer {
	
	private int customerid;
  public int getCustomerid() {
		return customerid;
	}
	public void setCustomerid(int Customerid) {
		this.customerid = Customerid;
	}

	private String customers_name;
  
  
 
 
  
      
  public String getCustomers_name() {
		return customers_name;
	}
	public void setCustomers_name(String customers_name) {
		this.customers_name = customers_name;
	}
@Override
  public String toString() {
      return "Customer [Customerid=]" + this.customerid + ", CustomerName=" + this.customers_name + "]";
  }


}
