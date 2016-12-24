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
import java.security.MessageDigest;



public class Login extends HttpServlet{
	
	protected void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
			
		// get request parameters for userID and password
				String user = request.getParameter("user");
				String pwd = request.getParameter("password");
				String password,plainText,name;
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
						plainText = pwd;
						name=rs.getString("full_user_name");
						MessageDigest mdAlgorithm = MessageDigest.getInstance("MD5");
						mdAlgorithm.update(plainText.getBytes());

						byte[] digest = mdAlgorithm.digest();
						StringBuffer hexString = new StringBuffer();

						for (int i = 0; i < digest.length; i++) {
						    plainText = Integer.toHexString(0xFF & digest[i]);

						    if (plainText.length() < 2) {
						        plainText = "0" + plainText;
						    }

						    hexString.append(plainText);
						}

						System.out.print(hexString.toString());
						if(password.equals(hexString.toString()))
						{
							HttpSession session = request.getSession();
							session.setAttribute("user", name);
							session.setMaxInactiveInterval(30*60);
							Cookie userName = new Cookie("user", user);
							userName.setMaxAge(30*60);
							response.addCookie(userName);
							response.sendRedirect(request.getHeader("referer"));
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
