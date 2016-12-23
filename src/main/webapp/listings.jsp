<jsp:include page="header_home.jsp"/>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*" %>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="forsell.*"%>
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
<script>
function submitForm(){
	document.forms["sort"].submit();
}
</script>
</head>
<body>
<% 
String listing,order=null;
listing = request.getParameter("q");
order = request.getParameter("sortBy");
if(order!=null){
if(order.equals("Price: Low to High"))
	order = "price";
else if(order.equals("Price: High to Low"))
	order = "price  desc";
else if(order.equals("Most Recent"))
	order = "entry_date desc";
}
String query;
query = "SELECT * FROM postads WHERE prod_sub_cat = '"+listing+"'";
if(order != null)
	query = query + " ORDER BY " + order; 
try {
DbConnect db = new DbConnect();
Statement stmt = db.conn();
ResultSet rs = stmt.executeQuery(query);
%>
<div>		
		<div style="float:left; width:21.5%;">
	    <jsp:include page="side_nav.jsp"/>
	    </div>
	    
<%
if(!rs.isBeforeFirst()){%>
<div style='float:left; width:50%;'>
<%
out.println("SORRY MATE!! NOBODY SELL THE ITEMS YOU WANT YET....");
%>
</div>
<%
}
else{
%><div style='float:left; width:50%;'><%
	while(rs.next()){
			%>
		
		<div style="float:left; width:100%;">
		<div class="card" style="width:96%;float:left;margin-left:15px; margin-right:15px; margin-top:5px; margin-bottom:5px;">
		<img alt="Image" style='float:left;' src="./FileServlet/<%=rs.getString("prod_id")%>\\1.<%=rs.getString("img_ext1") %>" width="160" height="160">
		 <div class="card_container" style="float:left; width:70%; word-break:break-all;">
		    <h4><b><%out.println(rs.getString("prod_title")); %></b></h4> 
		    <p><%out.println(rs.getString("prod_desc")); %></p> 
		    <b><%out.println(rs.getString("price")); %></b>
		  </div>
		 </div>
		 </div>	
		<%
	}%></div>
<% } %></div>
<div style='float:left; width:28.5%;'>
<form name="sort" action="listings.jsp">
  <select name="sortBy" onchange="submitForm()">
  	<option value="Sort By:">Sort By:</option>
    <option value="Most Recent">Most Recent</option>
    <option value="Price: Low to High">Price: Low to High</option>
    <option value="Price: High to Low">Price: High to Low</option>
  </select>
  <input type="hidden" name="q" value=<%=request.getParameter("q")%>>
</form>
</div>
<%
}
catch(Exception e) {
  out.println("SQLException caught: " +e.getMessage());
}
%>




</body>
</html>