<%@ page import="java.io.*,java.util.*" %>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
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
String db = "forsale";
String user = "ashish";
String Title,Category,Desc,Pics,UName,UPhone;
Title = request.getParameter("adTitle");
Category = request.getParameter("adCategory");
Desc = request.getParameter("adDesc");
String query = "INSERT INTO postads (prod_title,prod_cat,prod_desc) VALUES ('"+Title+"','"+Category+"','"+Desc+"');";
try {
  java.sql.Connection con;
 Class.forName("com.mysql.jdbc.Driver");
  con = DriverManager.getConnection("jdbc:mysql://192.168.0.16/"+db, user, "mypass");
  out.println (db + " database successfully opened.");
  Statement stmt = con.createStatement();
  stmt.executeUpdate(query);
  out.println ("Query Executed");
}
catch(Exception e) {
  out.println("SQLException caught: " +e.getMessage());
  //out.println(e.printStackTrace());
}

%>
</body>
</html>