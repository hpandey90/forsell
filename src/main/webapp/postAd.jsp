<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Post your ad here</title>
</head>
<body>
<form action="addad.jsp" method="post" onsubmit="return upload();">
<table id="adTable">
<tr>
<td>
<div>Give it a Name: </div>
</td>
<td>
<div><input id="adTitle" name="adTitle"type="text" width="100"></div>
</td>
</tr>
<tr>
<td>
<div>Specify it: </div>
</td>
<td>
<div><input id="adCategory" name="adCategory" type="text"></div>
</td>
</tr>
<tr>
<td>
<div>Describe it: </div>
</td>
<td>
<div><input id="adDesc" name="adDesc" type="text"></div>
</td>
</tr>
<tr>
<!-- <td>
<div>Upload some cool pics: </div>
</td>
<td>
<div>
    <input type="file" name="photo" id="photo">
</div>
</td>
 -->
</tr>
<tr>
<td>
<div>
Make yourself known:
</div>
</td>
</tr>
<tr>
<td>
<div>Name: </div>
</td>
<td>
<div><input id="adUName" name="adUName" type="text"></div>
</td>
</tr>
<tr>
<td>
<div>Phone No: </div>
</td>
<td>
<div><input id="adUPhone" name="adUPhone" type="text"></div>
</td>
</tr>
<tr>
<td>
<div><input id="submit" value="Submit" type="submit"></div>
</td>
</tr>
</table>
</form>
</body>
</html>