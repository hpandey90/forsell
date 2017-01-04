<jsp:include page="header_home.jsp"/>
<%@ page import="java.io.*, java.net.*" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Insert title here</title>
</head>
<body>
<% 
        try{
            int character;
            String str = null;
            String usr = null;
            str = request.getParameter("usermsg");
            usr = request.getParameter("username");
            ObjectOutputStream outbus=(ObjectOutputStream) session.getAttribute("obuff");
            ObjectInputStream inbus=(ObjectInputStream) session.getAttribute("ibuff");
            if(str != null && !str.equals(""))
            {
            	str += "\n";
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
</body>
</html>
</jsp:root>