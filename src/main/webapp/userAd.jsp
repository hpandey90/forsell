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
<title>See you posted Ads here</title>
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
		
		margin: 3%;
	    padding-left: 2%;
	    background: rgba(128, 128, 128, 0.4);
	}
	
	.filtersDiv > div{
		max-height:100px;
		overflow-y: auto;
		height: 98%;
	}
	/* Add some padding inside the card container */
	.card_container {
	    padding: 2px 16px;
	}
	</style>
	<script>
	function submitForm(){
		document.forms["filter"].submit();
	}
	</script>
</head>
<body>
<%
String userName = null,order = null,id= null;
String status = null;	
String query = null;
status = request.getParameter("status");
id = request.getParameter("id");
userName = request.getParameter("uName");
order = request.getParameter("sortBy");
if(order!=null){
if(order.equals("Price: Low to High"))
	order = "price";
else if(order.equals("Price: High to Low"))
	order = "price desc";
else if(order.equals("Most Recent"))
	order = "entry_date desc";
}
if(userName != null)
	query = "SELECT * FROM postads where user_name = '"+ userName + "'";
if(order != null && !(order.equals("Sort By:")))
	query = query + " ORDER BY " + order;
else if(order == null)
	query = query + " ORDER BY entry_date desc";
try
{
	DbConnect db = new DbConnect();
	Statement stmt = db.conn();
	ResultSet rs = stmt.executeQuery(query);
	%>
<form name="filter" action="userAd.jsp">
<div style='margin-top:100px;'>	
<%
if(!rs.isBeforeFirst()){%>
<div style='float:left; width:50%;'>
<%
out.println("YOU HAVE NOT POSTED ANY ADS YET! WANT TO POST SOMETHING?");
%>
<a href="postAd.jsp">POST AD</a>
</div>
<%}
else{
%>
<div style='float:right; width:28.5%;'>
Sort By :-  
  <select name="sortBy" onchange="submitForm()">
 <% if(order != null){
  	if(order.equals("entry_date desc")){ %>
    <option value="Most Recent" selected>Most Recent</option>
   <% }else{  %>
    <option value="Most Recent">Most Recent</option>
  <% }
    if(order.equals("price")){   %>
    <option value="Price: Low to High" selected>Price: Low to High</option>
  <%  }else{   %>
    <option value="Price: Low to High" >Price: Low to High</option>
  <%  }
    if(order.equals("price desc")){  %>
    <option value="Price: High to Low" selected>Price: High to Low</option>
  <%  }else{  %>
    <option value="Price: High to Low">Price: High to Low</option>
  <%    }
    }else{  %>
    <option value="Most Recent" selected>Most Recent</option>
    <option value="Price: Low to High" >Price: Low to High</option>
    <option value="Price: High to Low">Price: High to Low</option>
  <% } %> 
  </select>
  <input type="hidden" name="uName" value='<%=request.getParameter("uName")%>'/>
  
</div>
			<div style='float:right; width:50%;'>
			<%
	while(rs.next()){
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
		  <div style='width:67%; float:left; '>  
		  	<b>
		  		<h3 style='margin-top:3%; margin-bottom:3%;'><%out.println(rs.getString("prod_title")); %></h3>
		  	</b>
		  </div>
		    <div style='width:33%; float:right; font-size:x-small;'><p>Posted on: <b><%
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
		    %></b></p> </div>
		    <%if(status == null || !id.equals(rs.getString("prod_id"))){ %>
		    <div>Edit Your Post</div>
		    <div><input type="button" <%=rs.getString("prod_id")%> name=<%=rs.getString("prod_id")%> value="Mark as Sold"></div>
		    <%}
		    else if(id.equals(rs.getString("prod_id"))){%>
		    <div>SOLD</div>
		    <%}%>
		    <div style='width:100%; float:left'><p style='margin-top:0%'><%out.println(rs.getString("prod_desc")); %></p> </div>
		    <div style='width:100%; float:left'><b>$<%out.println(rs.getString("price")); %></b></div>
		  </div>
		 </div>
		 </a>
		 </div>				
<%	
	 }%>
	 </div>
<%	 
	}%>
	</div>
	</form>
	<%
}
catch(Exception e){
	System.out.println(e.getMessage());
}
%>
 <script>$("input[type=button]").on("click",function(){
				submitForm();
			});</script>
</body>
</html>