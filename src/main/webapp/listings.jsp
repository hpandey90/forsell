<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*" %>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<% 
String listing;
listing = request.getParameter("goodssearch");
String query;
query = "SELECT prod_id FROM postads WHERE prod_sub_cat = '"+listing+"'";
String db = "forsale";
String user = "ashish";
try {
java.sql.Connection con;
Class.forName("com.mysql.jdbc.Driver");
con = DriverManager.getConnection("jdbc:mysql://192.168.0.16/"+db, user, "mypass");
Statement stmt = con.createStatement();
ResultSet rs = stmt.executeQuery(query);
if(!rs.isBeforeFirst()){
	%>
<div><%
out.println("NO RESULTS FOUND");
%>
</div>
<%
}
else{
	while(rs.next()){%>
		<div>
		<img alt="Image" src="<%="uploads\\" + rs.getString("prod_id") + "\\1.jpg" %>" width="160" height="160">
		<% 
		
		out.println(rs.getString("prod_id")); %>
		</div>
		<%
	}
}
}
catch(Exception e) {
  out.println("SQLException caught: " +e.getMessage());
}
%>

</body>
</html>