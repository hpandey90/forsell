package forsell;
import java.sql.*;
import javax.sql.*;
public class DbConnect{
	public Statement conn(){
		  String db = "forsale";
		  String user = "ashish";
		  try{
		    java.sql.Connection con;
		    Class.forName("com.mysql.jdbc.Driver");
		    con = DriverManager.getConnection("jdbc:mysql://192.168.0.16/"+db, user, "mypass");
		    System.out.println (db + " database successfully opened.");
		    Statement stmt = con.createStatement();
		    return stmt;
		  }
		  catch(Exception e) {
			  System.out.println("SQLException caught: " +e.getMessage());
			  return null;
		  }
	}  
}
