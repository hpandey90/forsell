<jsp:include page="header_home.jsp"/>
<%@ page import="java.io.*,java.util.*,forsell.DbConnect;import java.sql.*" %>
<%@ page import="java.util.Date,java.text.SimpleDateFormat,java.text.ParseException"%>
<%@page import="java.text.SimpleDateFormat"%>

<link rel="stylesheet" href="css/auto-complete.css">
<form action="search.jsp" method="get">
<!-- <input id="hero-demo" autofocus type="text" name="q" placeholder="Programming languages ..." style="width:60%;max-width:600px;outline:0"> -->
</form>
<script src="scripts/auto-complete.js"></script>
 <script>
        var demo1 = new autoComplete({
            selector: '#hero-demo',
            minChars: 1,
            source: function(term, suggest){
                term = term.toLowerCase();
                var choices = ['ActionScript', 'AppleScript', 'Asp', 'Assembly', 'BASIC', 'Batch', 'C', 'C++', 'CSS', 'Clojure', 'COBOL', 'ColdFusion', 'Erlang', 'Fortran', 'Groovy', 'Haskell', 'HTML', 'Java', 'JavaScript', 'Lisp', 'Perl', 'PHP', 'PowerShell', 'Python', 'Ruby', 'Scala', 'Scheme', 'SQL', 'TeX', 'XML'];
                var suggestions = [];
                for (i=0;i<choices.length;i++)
                    if (~choices[i].toLowerCase().indexOf(term)) suggestions.push(choices[i]);
                suggest(suggestions);
            }
        });
</script>
<style>
.card {
    /* Add shadows to create the "card" effect */
    box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);
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
<!-- <input type="submit" value="GO"> -->

<div>
	<div style="float:left">
	<jsp:include page="side_nav.jsp"/>
	</div>
		<div style="float:right">
	<%
		try{
			DbConnect db = new DbConnect();
			Statement stmt=db.conn();
			String query = "select * from postads order by entry_date DESC;";
			System.out.println(query);
			ResultSet rs = stmt.executeQuery(query);
			int times=0,i=0,imgCount=0;
			if(!rs.isBeforeFirst()){
			}
			else
			{
				while(rs.next() && times<=4)
				{
					for(i=1;i<=5;i++)			
						if(!(rs.getString("img_ext"+i)).equals(""))
							imgCount++;
					%>
					<a href="/sell/details_page.jsp?id=<%=rs.getString("prod_id")%>">
						<div class="card" style="width:25%;float:left;margin-left:15px;">
						<%if(imgCount==0)
						{
							%><img src="images/Logo_BW.png" alt="Avatar" style="width:100%;height:300px;" /><%
							}
							else{%>
						  <img alt="Avatar" src="./FileServlet/<%=rs.getString("prod_id")%>\\1.<%=rs.getString("img_ext1") %>" style="width:100%;height:300px;">
						  <%} 
						  imgCount=0;
						  %>
						  <div class="card_container">
						    <h4><b><%out.println(rs.getString("prod_title")); %></b></h4> 
						    <p>Posted on: <%
							    String[] post = (rs.getString("entry_date")).split("\\.");
							    String dateStr = post[0];
							    SimpleDateFormat formater = new SimpleDateFormat("yyyy-MM-dd");
							    Date result = formater.parse(dateStr);
							    SimpleDateFormat AppDateFormat = new SimpleDateFormat("MMM-dd-yyyy");
							    out.println(AppDateFormat.format(result));
							    %></p> 
							    <p><%out.println(rs.getString("prod_desc")); %></p> 
							    <b>$<%out.println(rs.getString("price")); %></b> 
						  </div>
						</div>
						</a>
					<%
					times++;
				}
			}
		}
		catch(Exception e) {
			  System.out.println("SQLException caught: " +e.getMessage());
			  //return false;
		}
	%>
	</div>
</div>

