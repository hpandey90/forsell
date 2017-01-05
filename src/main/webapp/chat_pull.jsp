<%@ page import="java.io.*, java.net.*,java.sql.*,forsell.DbConnect" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Insert title here</title>
</head>
<body>
		<% 
		try{
    		DbConnect db = new DbConnect();
    		Statement stmt = db.conn();  
    		String query = "select msg_pool from user limit 1";
    		ResultSet rs = stmt.executeQuery(query);
    		rs.next();
    		int msg_pool_flag = Integer.parseInt(rs.getString("msg_pool"));
    		System.out.println("message flag ="+ msg_pool_flag);
    		if(msg_pool_flag==1){
    			stmt.executeUpdate("update user set msg_pool=0");
			int character;
		    ObjectInputStream inbus=(ObjectInputStream) session.getAttribute("ibuff");
		    //System.out.println("ajsgduas===>"+inbus.readObject());
		    String op=inbus.readObject().toString();
		    while(inbus.readObject().toString()!=""){
		    	op+=inbus.readObject().toString();
		    }
		    out.print(op);
    		}
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