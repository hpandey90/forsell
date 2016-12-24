package forsell;

import java.io.IOException;
import java.sql.*;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


//import forsell.DbConnect;

public class Register extends HttpServlet{
	
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException,IOException	{
		String name = request.getParameter("fullname");
		String email = request.getParameter("email");
		String pass = request.getParameter("password");
		try{
				DbConnect db = new DbConnect();
				Statement stmt=db.conn();
				String query = "INSERT INTO user (full_user_name,user_name,pass,registration_date) VALUES ('"+name+"','"+email+"','"+pass+"',now());";
				System.out.println(query);
				stmt.executeUpdate(query);
		}
	  catch(Exception e) {
		  System.out.println("SQLException caught: " +e.getMessage());
		  //return false;
	  }
		response.sendRedirect("index.jsp");
		//return true;
	}
	
}
