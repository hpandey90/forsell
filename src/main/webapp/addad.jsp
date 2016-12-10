<%@ page import="java.io.*,java.util.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String Title,Category,Desc,Pics,UName,UPhone;
Title = request.getParameter("adTitle");
Category = request.getParameter("adCategory");
Desc = request.getParameter("adDesc");
Pics = request.getParameter("adPics");
UName = request.getParameter("adUName");
UPhone = request.getParameter("adUPhone");
out.println(Title + " " + Category);
%>
</body>
</html>