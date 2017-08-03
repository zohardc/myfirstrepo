package util;
import java.sql.*;

//���� �� ������ - ������ ��� �� ������
public class DBUtil {
	
	 //����� �� ����� ������ ������� ������, ������ ����
	private static Connection conn;
	 
	//��� �� ����� ������
    public static Connection getConnection() {
    	//�� ���� ��� ���� �� ����� ���� �����
        if( conn != null )
            return conn;
 
        //�� �� ���� ��� � ������� ���� ������
         String url = "jdbc:postgresql://horton.elephantsql.com:5432/gyfyvpba";
    	 String username = "gyfyvpba";
    	 String password = "sA8-pGPIM5AHTd17lUHmFr6BzjWx9MFl";
    	 
    	 
    	 try 
         {
             Class.forName("org.postgresql.Driver");
             conn = DriverManager.getConnection(url, username, password);
         }
           
    	 catch (ClassNotFoundException | java.sql.SQLException e) 
         {
 	            System.out.println(e.getMessage());
 	     }
 
        return conn;
    }
 
    public static void closeConnection( Connection toBeClosed ) {
        if( toBeClosed == null )
            return;
        
        
        try {
            toBeClosed.close();
        } catch (SQLException e) {
        	System.out.println(e.getMessage());
        }
    }
}
