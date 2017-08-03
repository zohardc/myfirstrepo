package util;
import java.sql.*;

//מטרה של המחלקה - להחזיר עצם של קונקשן
public class DBUtil {
	
	 //החרזה על משתנה קונקשן שאמורים להחזיר, המשתנה סטטי
	private static Connection conn;
	 
	//גטר של משתנה קונקשן
    public static Connection getConnection() {
    	//אם העצם כבר קיים אז תחזיר אותו וסיים
        if( conn != null )
            return conn;
 
        //אם לא קיים עצם ה קונקשין תצור ותחזיר
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
