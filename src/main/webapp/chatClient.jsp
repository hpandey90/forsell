<jsp:include page="header_home.jsp"/>
<%@ page import="java.io.*, java.net.*" %>
<HTML>
    <HEAD>
        <TITLE>Creating Client/Server Applications</TITLE>
    </HEAD>

    <BODY>
     <div style="margin-top:300px">
        <H1>Creating Client/Server Applications</H1>
        <% 
        try{
        	int character;
            System.out.println("1");
            System.out.println("2");
            //byte buffer[] = str.getBytes();
            //outSocket.write(buffer);
            System.out.println("3");
            ObjectInputStream inbus=(ObjectInputStream) session.getAttribute("ibu");
            /* while ((character = inSocket.read()) != -1) {
            	System.out.println((char) character);
                */ 
                
                out.print(inbus.readObject());
            //}

            
            System.out.println("4");
        }
        catch(java.net.ConnectException e){
        %>
            You must first start the server application 
            (YourServer.java) at the command prompt.
        <%
        }
        %>
       
        <form action="chatClient.jsp" method="get">
           <input type="text" name="imp" id="imp">
            <input type="submit" value="submit">
            </form>
            </div>
    </BODY>
</HTML>