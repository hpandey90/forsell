package forsell;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Logout extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	response.setContentType("text/html");
    	Cookie[] cookies = request.getCookies();
    	if(cookies != null){
	    	for(Cookie cookie : cookies){
	    		if(cookie.getName().equals("JSESSIONID")){
	    			System.out.println("JSESSIONID="+cookie.getValue());
	    			break;
	    		}
	    	}
    	}
    	
    	//invalidate the session if exists
    	HttpSession session = request.getSession(false);
    //	request.getSession().invalidate();
    //	request.getSession(false);
    	//session.invalidate();
    	System.out.println("User="+session.getAttribute("user"));
    	System.out.println("JID="+session.getAttribute("JSESSIONID"));
    	if(session != null){
    		session.invalidate();
    	}
    	response.sendRedirect("index.jsp");
    }
}
