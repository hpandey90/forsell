<jsp:include page="header_home.jsp"/>
<%@ page import="java.io.*,java.util.*" %>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="forsell.*"%>
<%@ page import="java.util.Date,java.text.SimpleDateFormat,java.text.ParseException"%>
<%@page import="java.text.SimpleDateFormat"%>
<link rel="stylesheet" href="css/auto-complete.css">
<form action="search.jsp" method="get">
<!-- <input id="hero-demo" autofocus type="text" name="q" placeholder="Programming languages ..." style="width:60%;max-width:600px;outline:0"> -->
</form>
<style>

/*****************globals*************/
body {
  font-family: 'open sans';
  overflow-x: hidden; }

img {
  max-width: 100%; }

.preview {
  display: -webkit-box;
  display: -webkit-flex;
  display: -ms-flexbox;
  display: flex;
  -webkit-box-orient: vertical;
  -webkit-box-direction: normal;
  -webkit-flex-direction: column;
      -ms-flex-direction: column;
          flex-direction: column; }
  @media screen and (max-width: 996px) {
    .preview {
      margin-bottom: 20px; } }

.preview-pic {
  -webkit-box-flex: 1;
  -webkit-flex-grow: 1;
      -ms-flex-positive: 1;
          flex-grow: 1; }

.preview-thumbnail.nav-tabs {
padding:0;
  border: none;
  margin-top: 15px; }
  .preview-thumbnail.nav-tabs li {
    width: 18%;
    margin-right: 2.5%; }
    .preview-thumbnail.nav-tabs li img {
      max-width: 100%;
      display: block; }
    .preview-thumbnail.nav-tabs li a {
      padding: 0;
      margin: 0; }
    .preview-thumbnail.nav-tabs li:last-of-type {
      margin-right: 0; }

.tab-content {
  overflow: hidden; }
  

.card {
  margin-top: 0.3%;
  background: #eee;
  padding: 3em;
  line-height: 1.5em; }

@media screen and (min-width: 997px) {
  .wrapper {
    display: -webkit-box;
    display: -webkit-flex;
    display: -ms-flexbox;
    display: flex; } }

.details {
word-break: break-all;
  display: -webkit-box;
  display: -webkit-flex;
  display: -ms-flexbox;
  display: flex;
  -webkit-box-orient: vertical;
  -webkit-box-direction: normal;
  -webkit-flex-direction: column;
      -ms-flex-direction: column;
          flex-direction: column; }

.colors {
  -webkit-box-flex: 1;
  -webkit-flex-grow: 1;
      -ms-flex-positive: 1;
          flex-grow: 1; }

.product-title, .price, .sizes, .colors {
  text-transform: UPPERCASE;
  font-weight: bold; }

.checked, .price span {
  color: #ff9f1a; }

.product-title, .rating, .product-description, .price, .vote, .sizes {
  margin-bottom: 5px;
  margin-top: 5px; }

.product-title {
  margin-top: 0; }

.size {
  margin-right: 10px; }
  .size:first-of-type {
    margin-left: 40px; }

.color {
  display: inline-block;
  vertical-align: middle;
  margin-right: 10px;
  height: 2em;
  width: 2em;
  border-radius: 2px; }
  .color:first-of-type {
    margin-left: 20px; }

.add-to-cart, .like {
  background: #ff9f1a;
  padding: 1.2em 1.5em;
  border: none;
  text-transform: UPPERCASE;
  font-weight: bold;
  color: #fff;
  -webkit-transition: background .3s ease;
          transition: background .3s ease; }
  .add-to-cart:hover, .like:hover {
    background: #b36800;
    color: #fff; }

.not-available {
  text-align: center;
  line-height: 2em; }
  .not-available:before {
    font-family: fontawesome;
    content: "\f00d";
    color: #fff; }

.orange {
  background: #ff9f1a; }

.green {
  background: #85ad00; }

.blue {
  background: #0076ad; }

.tooltip-inner {
  padding: 1.3em; }

@-webkit-keyframes opacity {
  0% {
    opacity: 0;
    -webkit-transform: scale(3);
            transform: scale(3); }
  100% {
    opacity: 1;
    -webkit-transform: scale(1);
            transform: scale(1); } }

@keyframes opacity {
  0% {
    opacity: 0;
    -webkit-transform: scale(3);
            transform: scale(3); }
  100% {
    opacity: 1;
    -webkit-transform: scale(1);
            transform: scale(1); } }

/*# sourceMappingURL=style.css.map */
.view {
    /* Add shadows to create the "card" effect */
    box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);
    transition: 0.3s;
}

.view_all {
    /* Add shadows to create the "card" effect */
    box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);
    transition: 0.3s;
}

/* On mouse-over, add a deeper shadow */
.view:hover {
    box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2);
}

.view_all:hover {
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
	<div class="container" style="float:right;width:85%">
	
		<div class="card">
			<div class="container-fliud">
				<div class="wrapper row">
					
<%
    String detail,query,val;
	int i,imgCount=0;
	detail = request.getParameter("id");
	query = "SELECT * FROM postads WHERE prod_id = '"+ detail + "'";
	System.out.println(query);
	ResultSet rs=null;
	try {
		DbConnect db = new DbConnect();
		Statement stmt = db.conn();
		rs = stmt.executeQuery(query);
		rs.next();
		for(i=1;i<=5;i++)			
			if(!(rs.getString("img_ext"+i)).equals(""))
				imgCount++; 
		%>
					<div class="preview col-md-6" style='width: 40%; min-width:40%; margin-right: 3%; padding-left:0;'>
		<%
		i=1;
		if(imgCount>=1){
           %>			
           				<div class="preview-pic tab-content" style="float:left">
						  <div class="tab-pane active" id="pic-<%=i%>"><img src="./FileServlet/<%=detail%>\\<%=i%>.<%=rs.getString("img_ext"+(i++))%>" alt="Avatar" style="width:400px;height:400px" /></div>
		<%}
		else {%>
						<div class="preview-pic tab-content" style="float:left">
						  <div class="tab-pane active" id="pic-<%=i%>"><img src="images/Logo_BW.png" alt="Avatar" style="width:400px;height:400px" /></div>
		<% }
		while(i<=imgCount){ %>
						  <div class="tab-pane" id="pic-<%=i%>"><img src="./FileServlet/<%=detail%>\\<%=i%>.<%=rs.getString("img_ext"+(i++))%>" alt="Avatar" style="width:400px;height:400px"/></div>
						  <!--<div class="tab-pane" id="pic-3"><img src="images/duoc-langur.png" alt="Avatar" style="width:400px;height:400px"/></div>
						  <div class="tab-pane" id="pic-4"><img src="images/snub-nosed.png" alt="Avatar" style="width:400px;height:400px"/></div> -->
						
	<%					}
		i=1;
		if(imgCount>=1){
		%>				</div>
						<ul class="preview-thumbnail nav nav-tabs">
						  <li class="active"><a data-target="#pic-<%=i%>" data-toggle="tab"><img src="./FileServlet/<%=detail%>\\<%=i%>.<%=rs.getString("img_ext"+(i++))%>" /></a></li>
	<%}
		else{%>
						</div>
						<ul class="preview-thumbnail nav nav-tabs">
						  <li class="active"><a data-target="#pic-<%=i%>" data-toggle="tab"><img src="images/Logo_BW.png" /></a></li>
	    <% }
		while(i<=imgCount){ %>				
						  <li><a data-target="#pic-<%=i%>" data-toggle="tab"><img src="./FileServlet/<%=detail%>\\<%=i%>.<%=rs.getString("img_ext"+(i++))%>" /></a></li>
						  <!--<li><a data-target="#pic-3" data-toggle="tab"><img src="images/duoc-langur.png" /></a></li>
						  <li><a data-target="#pic-4" data-toggle="tab"><img src="images/snub-nosed.png" /></a></li> -->
						
				<%
			}
		%>		
						</ul>
					</div>
					<div class="details col-md-6" style='width:60%;'>
						<h2 class="product-title"><%=rs.getString("prod_title") %></h2>
						<p class="product-description"><%=rs.getString("prod_desc") %></p>
						<h4 class="price">Price: <span>$<%=rs.getString("price") %></span></h4>
						<p class="vote">Posted on: <b><%
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
		    %></b></p>
						
<%  }
	catch(Exception e){
		 out.println("SQLException caught: " +e.getMessage());
	}
	%>
						<div class="action">
							<button class="add-to-cart btn btn-default" type="button" onclick="location.href='http://localhost:8080/sell/chat_box.jsp?username=<%=rs.getString("user_name")%>';">Message Seller</button>
							<div id="fb-root"></div>
								<script>(function(d, s, id) {
								  var js, fjs = d.getElementsByTagName(s)[0];
								  if (d.getElementById(id)) return;
								  js = d.createElement(s); js.id = id;
								  js.src = "//connect.facebook.net/en_US/sdk.js#xfbml=1&version=v2.8";
								  fjs.parentNode.insertBefore(js, fjs);
								}(document, 'script', 'facebook-jssdk'));</script>
								<div class="fb-like" data-href="http://localhost:8080/sell/details_page.jsp?id=<%=detail%>" data-layout="standard" data-action="like" data-size="small" data-show-faces="true" data-share="true"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div id="fb-root"></div>
		<script>(function(d, s, id) {
		  var js, fjs = d.getElementsByTagName(s)[0];
		  if (d.getElementById(id)) return;
		  js = d.createElement(s); js.id = id;
		  js.src = "//connect.facebook.net/en_US/sdk.js#xfbml=1&version=v2.8";
		  fjs.parentNode.insertBefore(js, fjs);
		}(document, 'script', 'facebook-jssdk'));</script>
		<div class="fb-comments" data-width="550px" data-href="http://localhost:8080/sell/details_page.jsp?id=<%=detail%>" data-numposts="4"></div>
	</div>	
</div>
