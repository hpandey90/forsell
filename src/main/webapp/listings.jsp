<jsp:include page="header_home.jsp"/>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*" %>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="forsell.*"%>
<%@ page import="java.util.Date,java.text.SimpleDateFormat,java.text.ParseException"%>
<%@page import="java.text.SimpleDateFormat"%>
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
	.filtersDiv{
		max-height:100px;
		overflow-y: auto;
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
int noResult=0,i=0; 
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
String query;//,streetFilter,zipFilter,priceFilter;
String[] streetValues = request.getParameterValues("street");
String[] zipValues = request.getParameterValues("zip");
String[] priceValues = request.getParameterValues("price");
query = "SELECT * FROM postads WHERE prod_sub_cat = '"+listing+"'";
if(streetValues != null){
	query += " and street in ('";
	for(i=0; i< (streetValues.length - 1); i++)
		query += streetValues[i] + "','";
	query += streetValues[i] + "')";
	System.out.println(query);
}
if(zipValues != null){
	query += " and zip_code in ('";
	for(i=0; i< (zipValues.length - 1); i++)
		query += zipValues[i] + "','";
	query += zipValues[i] + "')";
	System.out.println(query);
}
if(priceValues != null){
	query += " and price in ('";
	for(i=0; i< (priceValues.length - 1); i++)
		query += priceValues[i] + "','";
	query += priceValues[i] + "')";
	System.out.println(query);
}
if(order != null)
	query = query + " ORDER BY " + order; 
HashMap<String,Integer> streetFilter = new HashMap<String,Integer>();
HashMap<String,Integer> zipFilter = new HashMap<String,Integer>();
HashMap<String,Integer> priceFilter = new HashMap<String,Integer>();
try {
DbConnect db = new DbConnect();
Statement stmt = db.conn();
ResultSet rs = stmt.executeQuery(query);
%>
<div>			    
<%
if(!rs.isBeforeFirst()){%>
<div style='float:left; width:50%;'>
<%
out.println("SORRY MATE!! NOBODY SELL THE ITEMS YOU WANT YET....");
noResult = 1;
%>
</div>
<%
}
else{
%>
<div style='float:right; width:28.5%;'>
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
			<div style='float:right; width:50%;'>
			<%
	while(rs.next()){
				streetFilter.put(rs.getString("street"),1);
				zipFilter.put(rs.getString("zip_code"),1);
				priceFilter.put(rs.getString("price"),1);
			%>
		
		<div style="float:left; width:100%;">
		<a href="/sell/details_page.jsp?id=<%=rs.getString("prod_id")%>">
		<div class="card" style="width:96%;float:left;margin-left:15px; margin-right:15px; margin-top:5px; margin-bottom:5px;">
		<div style='width:30%;'>
		<%if(!(rs.getString("img_ext1")).equals("")){%>
			<img alt="Image" style='float:left;' src="./FileServlet/<%=rs.getString("prod_id")%>\\1.<%=rs.getString("img_ext1") %>" width="160" height="160">
		<%}
		else{%>
			<img alt="Image" style='float:left;' src="images/Logo_BW.png" width="160" height="160">
		<%} %>	
		</div>
		 <div class="card_container" style="float:left; width:68%; word-break:break-all;">
		  <div style='width:68%; float:left; '>  <b ><h3 style='margin-top:3%; margin-bottom:3%;'><%out.println(rs.getString("prod_title")); %></h3></b> </div>
		    <div style='width:32%; float:right; font-size:x-small;'><p>Posted on: <%
		    String[] post = (rs.getString("entry_date")).split("\\.");
		    String dateStr = post[0];
		    SimpleDateFormat formater = new SimpleDateFormat("yyyy-MM-dd");
		    Date result = formater.parse(dateStr);
		    SimpleDateFormat AppDateFormat = new SimpleDateFormat("MMM-dd-yyyy");
		    out.println(AppDateFormat.format(result));
		    out.println(" ");
		    Date date = new Date();
		    Timestamp timestamp = rs.getTimestamp("entry_date");
		    date = new java.util.Date(timestamp.getTime());
		    SimpleDateFormat AppDateFormat2 = new SimpleDateFormat("hh:mm a");
		    out.println(AppDateFormat2.format(date));
		    %></p> </div>
		    <div style='width:100%; float:left'><p style='margin-top:0%'><%out.println(rs.getString("prod_desc")); %></p> </div>
		    <div style='width:100%; float:left'><b>$<%out.println(rs.getString("price")); %></b></div>
		  </div>
		 </div>
		 </a>
		 </div>	
		<%
	}
	Iterator it1 = streetFilter.entrySet().iterator();
	Iterator it2 = zipFilter.entrySet().iterator();
	Iterator it3 = priceFilter.entrySet().iterator();
	Map.Entry pair;
	%></div>
	<div style="float:left; width:21.5%;">
	   <%--  <jsp:include page="side_nav.jsp"/> --%>
	    <div class='filtersDiv'>
	     <form method="get" name="filter" action="listings.jsp">
	    	<div>Filter By Street:
	    	<%while(it1.hasNext()){
	    		pair = (Map.Entry)it1.next();			    		
	    	 %>
	    	<div>
	    	<script>
	    	$("input[type=checkbox]").on("change",function(){
	    		submitForm("filter");
	    	});
	    	</script>
	    	<input type='checkbox' name="street" value="<%=pair.getKey().toString() %>"><%=pair.getKey().toString() %></div>
	    		<% } %>
	    	</div>		
	    	<div>Filter By Zip Code:
	    	<%while(it2.hasNext()){
	    		pair = (Map.Entry)it2.next();			    		
	    	 %>
	    	<div><input type='checkbox' name="zip" value="<%=pair.getKey().toString() %>"><%=pair.getKey().toString() %></div>
	    		<% } %>
	    	</div>	
	    	<div>Filter By Price:
	    	<%while(it3.hasNext()){
	    		pair = (Map.Entry)it3.next();			    		
	    	 %>
	    	<div><input type='checkbox' name="price" value="<%=pair.getKey().toString()%>"><%=pair.getKey().toString() %></div>
	    		<% } %>
	    	</div>	
	    	<input type="hidden" name="q" value=<%=request.getParameter("q")%>>
	    	<%-- <input type="hidden" name="sortBy" value=<%=request.getParameter("sortBy")%>> --%>     	
	    </div>
    </div>
<% } %></div>
<%if(noResult == 0){ %>
<div style='float:left; width:28.5%;'>
<!-- <form name="sort" action="listings.jsp"> -->
  <select name="sortBy" onchange="submitForm('filter')">
  	<!-- <option value="Sort By:">Sort By:</option> -->
    <option value="Most Recent">Most Recent</option>
    <option value="Price: Low to High">Price: Low to High</option>
    <option value="Price: High to Low">Price: High to Low</option>
  </select>
 <%--  <input type="hidden" name="q" value=<%=request.getParameter("q")%>>
  <input type="hidden" name="street" value=<%=request.getParameterValues("street")%>>
  <input type="hidden" name="zip" value=<%=request.getParameterValues("zip")%>>
  <input type="hidden" name="price" value=<%=request.getParameterValues("price")%>> --%>
</form>
</div>
<%
}
}
catch(Exception e) {
  out.println("SQLException caught: " +e.getMessage());
}
%>
<div></div><div></div>

</body>
</html>
