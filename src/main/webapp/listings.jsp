<jsp:include page="header_home.jsp"/>
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
<style>
.card {
    /* Add shadows to create the "card" effect */
    box-shadow: 4px 4px 4px 4px rgba(0,0,0,0.2);
    transition: 0.3s;
}

/* On mouse-over, add a deeper shadow */
.card:hover {
    box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2);
}

/* Add some padding inside the card container */
.card_container {
    padding: 2px 16px;
}
</style>
</head>
<body>
<% 
String listing;
listing = request.getParameter("q");
String query;
query = "SELECT * FROM postads WHERE prod_sub_cat = '"+listing+"'";
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
else{%>
<div>		
		<div style="float:left; width:21.5%;">
	    <jsp:include page="side_nav.jsp"/>
	    </div>
	    <div style='float:left; width:78.5%;'>
<%
	while(rs.next()){
			%>
	
		<div style="float:left; width:100%;">
		<div class="card" style="width:67.5%;float:left;margin-left:15px; margin-right:15px; margin-top:5px; margin-bottom:5px;">
		<img alt="Image" style='float:left;' src="./FileServlet/<%=rs.getString("prod_id")%>\\1.jpg" width="160" height="160">
		 <div class="card_container" style="float:left; width:70%; word-break:break-all;">
		    <h4><b><%out.println(rs.getString("prod_title")); %></b></h4> 
		    <p><%out.println(rs.getString("prod_desc")); %></p> 
		    <b><%out.println(rs.getString("price")); %></b>
		  </div>
		 </div>
		 </div>	
		<%
	}%></div></div><%
}
}
catch(Exception e) {
  out.println("SQLException caught: " +e.getMessage());
}
%>
<div></div><div></div>



</body>
</html>