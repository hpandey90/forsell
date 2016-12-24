package forsell;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



public class Login extends HttpServlet{
	
	protected void doGet(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
			
		// get request parameters for userID and password
				String user = request.getParameter("user");
				String pwd = request.getParameter("password");
				String password,name;
				try{
					DbConnect db = new DbConnect();
					Statement stmt=db.conn();
					String query = "Select * from user where user_name='"+user+"';";
					System.out.println(query);
					ResultSet rs = stmt.executeQuery(query);
					if(!(rs.isBeforeFirst()))
					{
						System.out.println("Failed");
					}
					else
					{
						rs.next();
						password= rs.getString("pass");
						name=rs.getString("full_user_name");
						if(password.equals(pwd))
						{
							HttpSession session = request.getSession();
							session.setAttribute("user", name);
							session.setMaxInactiveInterval(30*60);
							Cookie userName = new Cookie("user", user);
							userName.setMaxAge(30*60);
							response.addCookie(userName);
							response.sendRedirect("LoginSuccess.jsp");
						}
						else{
							RequestDispatcher rd = getServletContext().getRequestDispatcher("/index.jsp");
							PrintWriter out= response.getWriter();
							out.println("<font color=red>Either user name or password is wrong.</font>");
							rd.include(request, response);
						}
					}
				}
				catch(Exception e) {
				  System.out.println("SQLException caught: " +e.getMessage());
				  //return false;
				}	
				
	}
}
