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
		    ObjectInputStream inbus=(ObjectInputStream) session.getAttribute("ibuff");
		    out.print(inbus.readObject());
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