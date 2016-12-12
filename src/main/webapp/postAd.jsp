<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head lang="en">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
	<script type="text/javascript">
	$(document).ready(function(){
		var count = 1;
		var current = "";
		function enableRemove(){
			if(count>1){
				$("#removeForm").show();
		    	$("#removeForm").prop('disabled', false);
		    }
		    else{
		    	$("#removeForm").hide();
		    	$("#removeForm").prop('disabled', true);
		    }
		}
		enableRemove();
	    $("#newForm").click(function(){
	    	count++;
	    	var string = "<table id='adTable"+count+"'><tr><td><div class='container-fluid'>Give it a Name: </div></td><td><div class='container-fluid'><input id='adTitle"+count+"' name='adTitle"+count+"' type='text' width='100' required></div></td></tr><tr><td><div class='container-fluid'>Specify it: </div></td><td><div class='container-fluid'><input id='adCategory"+count+"' name='adCategory"+count+"' type='text' required></div></td></tr><tr><td><div class='container-fluid'>Describe it: </div></td><td><div class='container-fluid'><textarea rows='3' columns='4'id='adDesc"+count+"' name='adDesc"+count+"' required></textarea></div><div class='container-fluid'><input type='file' accept='image/*' multiple='multiple' id='productImages"+count+"' name='productImages"+count+"' required></input></div></td></tr><tr></tr></table>";
	    	$("#itemInputDiv").append(string);
	    	current = "#adTable"+count;
	    	enableRemove();
	    });
	    $("#removeForm").click(function(){
	    	if(count > 1){
	    		$(current).remove();
	    		count--;
	    		enableRemove();
	    	}
	    });
	});
	</script>
	<title>Post your ad here</title>
	</head>
	<body>
		<div class='jumbotron'>
			<form action="addad.jsp" method="post" onsubmit="return upload();">
			<div id="itemInputDiv">
			<table id="adTable">
					<tr>
						<td>
							<div class='container-fluid'>Give it a Name: </div>
						</td>
						<td>
							<div class='container-fluid'><input id="adTitle" name="adTitle" type="text" width="100" required></div>
						</td>
					</tr>
					<tr>
						<td>
							<div class='container-fluid'>Specify it: </div>
						</td>
						<td>
							<div class='container-fluid'><input id="adCategory" name="adCategory" type="text" required></div>
						</td>
					</tr>
					<tr>
						<td>
							<div class='container-fluid'>Describe it: </div>
						</td>
						<td>
							<div class='container-fluid'><textarea rows="3" columns="4"id="adDesc" name="adDesc" required></textarea></div>
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
			</div>
				<table>
					<tr>
						<td>
							<div class='container-fluid'>
							Make yourself known:
							</div>
						</td>
					</tr>
					<tr>
						<td>
							<div class='container-fluid'>Name: </div>
						</td>
						<td>
							<div class='container-fluid'><input id="adUName" name="adUName" type="text" required></div>
						</td>
					</tr>
					<tr>
						<td>
							<div class='container-fluid'>Phone No: </div>
						</td>
						<td>
							<div class='container-fluid'><input id="adUPhone" name="adUPhone" type="text" min="10" max="10" required></div>
						</td>
					</tr>
				</table>
				
				<table>
					<tr>
						<td>
							<div class='container-fluid'><input id="newForm" value="Add Item" type="button"></div>
						</td>
						<td>
							<div class='container-fluid'><input id="removeForm" value="Remove Item" type="button"></div>
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