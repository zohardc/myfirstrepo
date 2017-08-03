package da;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import model.Customer;
import util.DBUtil;

public class CustomerDA implements CustomerdaI {

        private Connection conn;

        public CustomerDA(){
                conn=DBUtil.getConnection();
        }
        @Override
        public void addCustomer(Customer customer) {
                try{
                        String query="INSERT INTO public.customers (customers_id, customers_name) VALUES (?,?)";
                        PreparedStatement preparedStatement = conn.prepareStatement(query);

                        preparedStatement.setLong(1, customer.getCustomerid());
                        preparedStatement.setString(2, customer.getCustomers_name());

                        preparedStatement.executeUpdate();
                        preparedStatement.close();
                }
                catch(SQLException e)
                {
                        System.out.println(e.getMessage());
                }

        }

        @Override
        public List<Customer> getAllCustomers() {
                List<Customer> Cities = new ArrayList<Customer>();
                //Customer[] Cities = new Customer[10];
                try
                {
                String query = "SELECT * FROM public.customers";
                Statement statement = conn.createStatement();

                ResultSet citiesTable = statement.executeQuery(query);

                while(citiesTable.next()){
                        Customer c = new Customer();
                        c.setCustomerid(citiesTable.getInt("customers_id"));
                        c.setCustomers_name(citiesTable.getString("customers_name"));

                        Cities.add(c);
                }
                }
                catch (SQLException e)
                {
                System.out.println(e.getMessage());
                }
                return Cities;
        }





        @Override
        public Customer getCustomerByID(int CustomerID) {

                Customer newCustomer = new Customer();

                try
                {
                String query = "SELECT * FROM public.customers WHERE customers_id='"+CustomerID+"'";

                Statement statement = conn.createStatement();

                ResultSet citiesStatement = statement.executeQuery(query);


                while(citiesStatement.next()){
                        newCustomer.setCustomerid(citiesStatement.getInt("customers_id"));
                        newCustomer.setCustomers_name(citiesStatement.getString("customers_name"));

                }

                }
                catch (SQLException e)
                {
                System.out.println(e.getMessage());
                }


                return newCustomer;

        }



        @Override
        public void updateCustomer(Customer customer) {

                try
                {
                String query = "UPDATE public.customers SET customers_name= ? where customers_ID= ?";

        PreparedStatement preparedStatement = conn.prepareStatement(query);

                preparedStatement.setInt(2,customer.getCustomerid());
                preparedStatement.setString(1,customer.getCustomers_name());

                preparedStatement.executeUpdate();
                preparedStatement.close();

                }
                catch (SQLException e)
                {
                System.out.println(e.getMessage());
                }


        }

        @Override
        public void deleteCustomer(int CustomerID) {

                try
                {
                String query = "DELETE FROM public.customers WHERE customers_id= ?";

                PreparedStatement preparedStatement = conn.prepareStatement(query);

                preparedStatement.setInt(1,CustomerID );

                preparedStatement.executeUpdate();

                }
                catch (SQLException e)
                {
                System.out.println(e.getMessage());
                }




        }

}