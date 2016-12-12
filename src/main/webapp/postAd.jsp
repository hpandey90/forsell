<jsp:include page="header_home.jsp"/>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	<!--  --><link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
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
	    	var string = "<div id='itemDiv"+count+"' style='margin: 5px; padding:5px; border-radius:10px;'><h3 style='text-align:center;'>Item"+ count+"</h3><table id='adTable"+count+"' align='center'><tr><td><div class='container-fluid lh'>Give it a Name: </div></td><td><div class='container-fluid'><input id='adTitle"+count+"' class='bd' name='adTitle"+count+"' type='text' width='100' required></div></td></tr><tr><td><div class='container-fluid lh'>Specify it: </div></td><td><div class='container-fluid'><input id='adCategory"+count+"' class='bd' name='adCategory"+count+"' type='text' required></div></td></tr><tr><td><div class='container-fluid'>Describe it: </div></td><td><div class='container-fluid'><textarea rows='3' columns='4'id='adDesc"+count+"' name='adDesc"+count+"' style='resize:none;width:300px;box-shadow: 0 0 3px #e81212;' required></textarea></div><div class='container-fluid'><input type='file' accept='image/*' multiple='multiple' id='productImages"+count+"' name='productImages"+count+"' required></input></div></td></tr><tr></tr></table></div>";
	    	$("#itemInputDiv").append(string);
	    	current = "#itemDiv"+count;
	    	enableRemove();
	    });
	    $("#removeForm").click(function(){
	    	if(count > 1){
	    		$(current).remove();
	    		count--;
	    		current = "#itemDiv"+count;
	    		enableRemove();
	    	}
	    });
	});
	function loadFile() {
		if(document.getElementById("productImages").value)
			var filename= document.getElementById("productImages").value;
			console.log(filename);
		  var xhttp = new XMLHttpRequest();
		  xhttp.onreadystatechange = function() {
		    if (this.readyState == 4 && this.status == 200) {
		    // document.getElementById("demo").innerHTML = this.responseText;
		    }
		  };
		  xhttp.open("GET", "file_upload.jsp?file="+filename, true);
		  xhttp.send();
		}
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
		<div style='position: relative; margin-left:28%; margin-right:28%;'>
			<form action="file_upload.jsp" enctype="multipart/form-data" method="post" style = ''onsubmit="return upload();">
				<div id="itemInputDiv">
					<div id='itemDiv'style='margin: 5px; padding:5px; border-radius:10px;'>
						<h3 style='text-align:center;'>Item 1</h3>
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
						</table>
						
					</div>
				</div>

				
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