<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head lang="en">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	<!--  --><link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
	<script type="text/javascript">
	$(document).ready(function(){
	    $("#newForm").click(function(){
	    	
	    	$("#adTable").last().after("<table id='adTable'><tr><td><div class='container-fluid'>Give it a Name: </div></td><td><div class='container-fluid'><input id='adTitle' name='adTitle'type='text' width='100' required></div></td></tr><tr><td><div class='container-fluid'>Specify it: </div></td><td><div class='container-fluid'><input id='adCategory' name='adCategory' type='text' required></div></td></tr><tr><td><div class='container-fluid'>Describe it: </div></td><td><div class='container-fluid'><textarea rows='3' columns='4'id='adDesc' name='adDesc' required></textarea></div><div class='container-fluid'><input type='file' accept='image/*' multiple='multiple' id='productImages' name='productImages' required></input></div></td></tr><tr></tr></table>");
	    });
	});
	</script>
	<style>
	.bd {
		    box-shadow: 0 0 3px #e81212;
    		border: black;
    		width:300px
	}
	.lh{
	line-height:3;
	}
	td,th{
		width:180px;
	}
	
	</style>
	<title>Post your ad here</title>
	</head>
	<body>
		<div class='jumbotron'>
			<form action="addad.jsp" method="post" onsubmit="return upload();">
				<table id="adTable" align="center">
					<tr>
						<td>
							<div class='container-fluid lh'>Give it a Name: </div>
						</td>
						<td>
							<div class='container-fluid'><input class="bd" id="adTitle" name="adTitle" type="text" required></div>
						</td>
					</tr>
					<tr>
						<td>
							<div class='container-fluid lh'>Specify it: </div>
						</td>
						<td>
							<div class='container-fluid '><input class="bd" id="adCategory" name="adCategory" type="text" required></div>
						</td>
					</tr>
					<tr>
						<td>
							<div class='container-fluid lh'>Describe it: </div>
						</td>
						<td>
							<div class='container-fluid'><textarea rows="3" columns="4"id="adDesc" name="adDesc" style="resize:none;width:300px;box-shadow: 0 0 3px #e81212;"  required></textarea></div>
							<div class='container-fluid'><input type="file" accept="image/*" multiple="multiple" id="productImages" name="productImages" required></input></div>
						</td>
					</tr>
					<tr>
						<!-- <td>
						<div class='container'>Upload some cool pics: </div>
						</td>
						<td>
						<div class='container'>
						    <input type="file" name="photo" id="photo">
						</div>
						</td>
						 -->
					</tr>
				</table>
				
				<table align="center">
					<tr>
						<td>
							<div class='container-fluid lh'>
							Make yourself known:
							</div>
						</td>
					</tr>
					<tr>
						<td>
							<div class='container-fluid lh'>Name: </div>
						</td>
						<td>
							<div class='container-fluid'><input class="bd" id="adUName" name="adUName" type="text" required></div>
						</td>
					</tr>
					<tr>
						<td>
							<div class='container-fluid lh'>Phone No: </div>
						</td>
						<td>
							<div class='container-fluid'><input class="bd" id="adUPhone" name="adUPhone" type="text" min="10" max="10" required></div>
						</td>
					</tr>
				</table>
				
				<table align="center">
					<tr>
						<td>
							<div class='container-fluid'><input id="newForm" value="Add Item" type="button"></div>
						</td>
						<td>
							<div class='container-fluid'><input id="submit" value="Submit" type="submit"></div>
						</td>
					</tr>
				</table>
				
			</form>
		</div>
	</body>
</html>