<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<html>
<head>
<title>JDBC Connection</title>
</head>

<body>
<h1>JDBC Connection</h1>

<%
  String db = "forsale";
  String user = "ashish";
  Statement stmt;
 // String query = "CREATE TABLE TEST2 (Name VARCHAR(100));";
  try {
    java.sql.Connection con;
   Class.forName("com.mysql.jdbc.Driver");
    con = DriverManager.getConnection("jdbc:mysql://192.168.0.16/"+db, user, "mypass");
    out.println (db + " database successfully opened.");
    stmt = con.createStatement();
  }
  catch(Exception e) {
    out.println("SQLException caught: " +e.getMessage());
    //out.println(e.printStackTrace());
  }
%>

</body>
</html>