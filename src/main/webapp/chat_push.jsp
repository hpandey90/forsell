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
        <div style="margin:100px">
		        <form name="message" action="#" method="post">
		        <input name="username" type="text" id="username">
		        <input name="usermsg" type="text" id="usermsg" size="63" />
		        <input name="submitmsg" type="submit"  id="submitmsg" value="Send" />
    	</div>
    </form>
</body>
</html>