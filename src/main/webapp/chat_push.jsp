<%@ page import="java.io.*, java.net.*,java.sql.*,forsell.DbConnect" %>
<% 
        try{

            int character;
            String str = null;
            String usr = null;
            str = request.getParameter("str");
            usr = request.getParameter("username");
            ObjectOutputStream outbus=(ObjectOutputStream) session.getAttribute("obuff");
            ObjectInputStream inbus=(ObjectInputStream) session.getAttribute("ibuff");
            if(str != null && !str.equals(""))
            {
				str =usr+"\r\n"+ str + "\r\n";

            	outbus.writeObject(str);
            	outbus.flush();
            }
        }
        catch(java.net.ConnectException e){
        %>  
            You must first start the server application 
            (YourServer.java) at the command prompt.
        <%
        }
        %>