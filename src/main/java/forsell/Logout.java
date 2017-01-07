package forsell;

import java.io.*;
import java.net.*;

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
    	String user_name="NoOne";
    	if(cookies != null){
	    	for(Cookie cookie : cookies){
	    		if(cookie.getName().equals("JSESSIONID")){
	    			System.out.println("JSESSIONID="+cookie.getValue());
	    			//user_name=cookie.getValue();
	    			break;
	    		}
	    		else if(cookie.getName().equals("user")){
	    			user_name=cookie.getValue();
	    		}
	    	}
    	}
    	
    	//invalidate the session if exists
    	//Socket sock =(Socket) session.getAttribute(socky);
    	HttpSession session = request.getSession(false);
    	/*String str;
    	Socket sock =(Socket) session.getAttribute("socky");
    	ObjectOutputStream outbus=(ObjectOutputStream) session.getAttribute("obuff");
        ObjectInputStream inbus=(ObjectInputStream) session.getAttribute("ibuff");
        str ="COMMAND"+"\r\n"+"EXIT"+"\r\n"+user_name+"\r\n";
    	outbus.writeObject(str);
    	outbus.flush();
    	sock.close();*/
    	//session.invalidate();
    //	request.getSession(false);
    	//session.invalidate();
    	//System.out.println("User="+session.getAttribute("user"));
    	//System.out.println("JID="+session.getAttribute("JSESSIONID"));
    	if(session != null){
    		session.invalidate();
    	}
    	response.sendRedirect("index.jsp");
    }
}
