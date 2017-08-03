package controler;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import da.CustomerDA;
import model.Customer;

/**
 * Servlet implementation class CustomerControler
 */
@WebServlet("/CustomerControlerAjax")
public class CustomerControlerAjax extends HttpServlet {
     	private static final long serialVersionUID = 1L;

        public static final String LIST_Customer="/CustomerAjax.jsp";
        public static final String FORM_Customer="/form_CustomerAjax.jsp";


        //הפנייה ל
        // DA
        CustomerDA myCustomerDA;


    /**
     * @see HttpServlet#HttpServlet()
     */
    public CustomerControlerAjax() {
        super();
        // TODO Auto-generated constructor stub

        myCustomerDA=new CustomerDA();
    }

        /**
         * @see HttpServlet#doGet(HttpServletRequest request,
		HttpServletResponse response)
         */
        protected void doGet(HttpServletRequest request, HttpServletResponse
        		response) throws ServletException, IOException {
                // TODO Auto-generated method stub
                //response.getWriter().append("Served at: ").append(request.getContextPath());

                String action=request.getParameter("action");
                String forward="";

                if(action.equalsIgnoreCase("listCustomer"))
                {
                        forward=LIST_Customer;
                        List<Customer> list=myCustomerDA.getAllCustomers();
                        request.setAttribute("Customers", list);
                }
                
                else if(action.equalsIgnoreCase("delete"))
                {
                	forward=LIST_Customer;
                	int CustomerID=Integer.valueOf(request.getParameter("id"));
                	myCustomerDA.deleteCustomer(CustomerID);
                	List<Customer> list=myCustomerDA.getAllCustomers();
                	request.setAttribute("Customers", list);
                	response.setContentType("text/html");

                }
                else if(action.equalsIgnoreCase("update"))
                {
                	forward=FORM_Customer;
                	int CustomerID=Integer.valueOf(request.getParameter("id"));
                	Customer customer=myCustomerDA.getCustomerByID(CustomerID);
                	request.setAttribute("sumcustomer", customer); 
                	response.setContentType("text/html");
                }
                
                else if(action.equalsIgnoreCase("insert"))
                {
                	forward=FORM_Customer;
                	//int CustomerID=Integer.valueOf(request.getParameter("ID"));
                	//Customer customer=myCustomerDA.getCustomerByID(CustomerID);
                	request.setAttribute("action", "add");
                	
                }




        RequestDispatcher dispatcher=request.getRequestDispatcher(forward);
        dispatcher.forward(request, response);

        }

        /**
         * @see HttpServlet#doPost(HttpServletRequest request,
		HttpServletResponse response)
         */
        protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
                // TODO Auto-generated method stub
        		Customer customer=new Customer();
        		request.setCharacterEncoding("UTF-8");
        		
        		String name=request.getParameter("name_param");
        		customer.setCustomers_name(name);
                String idString=request.getParameter("id_param");
                String action_type=request.getParameter("action_type");
                
                if(idString == null || idString.isEmpty())
                {
                	// 
                }
                else
                {
                	int id=Integer.valueOf(idString);
                	customer.setCustomerid(id);
                	
                	if(action_type.equals("Update"))
                	{
                		myCustomerDA.updateCustomer(customer);
                	}
                	else
                	{
                		myCustomerDA.addCustomer(customer);
                	}
                }
                
                
                
                
                
                // דומה למה שכבר עשינו ב doget                
                List<Customer> list=myCustomerDA.getAllCustomers();
                request.setAttribute("cities", list);
                RequestDispatcher dispatcher=request.getRequestDispatcher(LIST_Customer);
                dispatcher.forward(request, response);
                
        }

}