<%@ page import="forsell.DbConnect;import java.sql.*" %>

<%
if(request.getParameter("q")!=""){
	DbConnect db = new DbConnect();
	Statement stmt=db.conn();
	String str = "";
	String query = "select distinct prod_sub_cat from cat_subcat_mapping where prod_sub_cat like '%"+request.getParameter("q")+"%'";
	ResultSet rs = stmt.executeQuery(query);
	if(!rs.isBeforeFirst()){
	}
	else
	{
		while(rs.next())
		{		
			str += rs.getString("prod_sub_cat")+",";
		}
		str = str.substring(0,str.length()-1);
		out.println(str+",table1,table2,table3,table4,table5");
	}
}
%>