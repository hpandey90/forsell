<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<jsp:include page="header_home.jsp"/>
<%@ page import="java.io.*, java.net.*" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Chat - Customer Module</title>
<style>
body {
    font:12px arial;
    color: #222;
    text-align:center;
    padding:35px; }
  
form, p, span {
    margin:0;
    padding:0; }
  
input { font:12px arial; }
  
a {
    color:#0000FF;
    text-decoration:none; }
  
    a:hover { text-decoration:underline; }
  
#wrapper, #loginform {
    margin:0 auto;
    padding-bottom:25px;
    background:#EBF4FB;
    width:504px;
    border:1px solid #ACD8F0; }
  
#loginform { padding-top:18px; }
  
    #loginform p { margin: 5px; }
  
#chatbox {
    text-align:left;
    margin:0 auto;
    margin-bottom:25px;
    padding:10px;
    background:#fff;
    height:270px;
    width:430px;
    border:1px solid #ACD8F0;
    overflow:auto; }
  
#usermsg {
    width:395px;
    border:1px solid #ACD8F0; }
  
#submit { width: 60px; }
  
.error { color: #ff0000; }
  
#menu { padding:12.5px 25px 12.5px 25px; }
  
.welcome { float:left; }
  
.logout { float:right; }
  
.msgln { margin:0 0 2px 0; }
</style>
</head>
 
<div id="wrapper" style="margin-top:100px">
    <div id="menu">
        <p class="welcome">Welcome, <b></b></p>
        <p class="logout"><a id="exit" href="#">Exit Chat</a></p>
        <div style="clear:both"></div>
    </div>
     
    <div id="chatbox" >
     <% 
        try{
            int character;
            String str = null;
            String usr = null;
            str = request.getParameter("usermsg");            
            usr = request.getParameter("username");     
            System.out.println("0");
            Socket socket = new Socket("192.168.0.5", 8000);
            //Socket isocket = new Socket("192.168.0.5", 8766);
            OutputStream outSocket = socket.getOutputStream();   
            outSocket.flush();
            InputStream inSocket = socket.getInputStream();
            InputStream inOb=inSocket;
            session.setAttribute("ino",inSocket);
            ObjectOutputStream buffout=new ObjectOutputStream(outSocket);
            ObjectInputStream buffin=new ObjectInputStream(inSocket);
            session.setAttribute("ibu",buffin);
            if(str!="")
            {
            	buffout.writeObject(str);
           	    buffout.flush();
            }
            if(str != null && !str.equals(""))
            {
             	str += "\n";
            System.out.println("1");
            System.out.println("2");
            //byte buffer[] = str.getBytes();
            //outSocket.write(buffer);
            System.out.println("3");
            while ((character = inSocket.read()) != -1) {
            	System.out.print((char) character);
                out.print((char) character);
            }

            
            System.out.println("4");
           }
        }
        catch(java.net.ConnectException e){
        %>  
            You must first start the server application 
            (YourServer.java) at the command prompt.
        <%
        }
        %>
       </div>
    <form name="message" action="" method="post">
        <input name="username" type="text" id="username">
        <input name="usermsg" type="text" id="usermsg" size="63" />
        <input name="submitmsg" type="submit"  id="submitmsg" value="Send" />
    </form>
</div>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.3/jquery.min.js"></script>
<script type="text/javascript">
// jQuery Document
$(document).ready(function(){
 
});
</script>
</body>
</html>