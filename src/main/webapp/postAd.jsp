<jsp:include page="header_home.jsp"/>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	<script type="text/javascript">
	$(document).ready(function(){
		var count = 1;
		var current = "";
		function enableRemove(){
			if(count>1){
		    	$("#removeForm").show();
		    }
		    else{
		    	$("#removeForm").hide();
		    }
		}
		enableRemove();
	    $("#newForm").click(function(){
	    	if(count<6){
	    		count++;
		    	var string = "<div id='itemDiv"+count+"' class='itemDiv'><div class='abc'><h3 style='text-align:center;'>Item "+count+"</h3><div class='full'><div class=' lh half'>ITEM NAME</div>	<div class='rh half'><input class='bd' id='adTitle"+count+"' name='adTitle"+count+"' type='text' required></div></div><div class='full'><div class=' lh half'>SPECIFICATIONS </div><div class='rh half'><input class='bd' id='adSubCategory"+count+"' name='adSubCategory"+count+"' type='text' required></div></div><div class='full'><div class=' lh half'>DESCRIPTION </div><div class='rh half'><textarea class='tarea bd' id='adDesc"+count+"' name='adDesc"+count+"' required></textarea></div></div><div class='full'><div class='lh half'>PRICE</div><div class='rh half'><input class='bd' id='adPrice"+count+"' name='productPrice' type='text' required><label hidden style='color:red;' required>price invalid !!!</label></div></div><div class='full'><div class='lh half'>PICTURES</div><div class='rh half'><input class='bdss' type='file' accept='image/*' multiple='multiple' id='productImages"+count+"' name='productImages"+count+"'></input></div></div></div></div>";
		    	//var string = "<div id='itemDiv"+count+"'style='margin: 5px; padding:5px; border-radius:10px;'><h3 style='text-align:center;'>Item "+count+"</h3><div class='full'><div class=' lh half'>Give it a Name: </div><div class='rh half'><input class='bd' id='adTitle"+count+"' name='adTitle"+count+"' type='text'></div></div><div class='full'><div class=' lh half'>Specify it: </div><div class='rh half'><input class='bd' id='adCategory"+count+"' name='adCategory"+count+"' type='text'></div></div><div class='full'><div class=' lh half'>Describe it: </div><div class='rh half'><textarea rows='3' columns='4'id='adDesc"+count+"' name='adDesc"+count+"' style='resize:none;width:100%;box-shadow: 0 0 3px #e81212;'></textarea></div><div class=' full'><input type='file' accept='image/*' multiple='multiple' id='productImages"+count+"' name='productImages"+count+"'></input></div></div></div>";
		    	$("#itemInputDiv").append(string);
		    	current = "#itemDiv"+count;
		    	enableRemove();
	    	}
	    });
	    $("#removeForm").click(function(){
	    	if(count > 1){
	    		$(current).remove();
	    		count--;
	    		current = "#itemDiv"+count;
	    		enableRemove();
	    	}
	    });
	    $("#adUPhone").on('input', function(){
	    	var phone = $("#adUPhone").val();
	    	if((phone.length < 10 && phone.length > 0)|| isNaN(phone)){
	    		$("label").removeAttr("hidden");
	    	}
	    	else{
	    		$("label").attr("hidden", "hidden");
	    	}
	    });
	    
	    $(".imageClass").change(function(){
	    	var $this = $(this);
	        if (this.files && this.files[0]) {
	            var reader = new FileReader();
	            
	            reader.onload = function (e) {
	                $this.parent().find('img').attr('src', e.target.result);
	            }
	            reader.readAsDataURL(this.files[0]);
	        }
	    });
	});
	</script>
	<style>
	.bd {
		    box-shadow: 0 0 3px #9a9595;
    		border: black;
    		width:100%;
    		margin-top:10px;
    		height:26px;
    		border-radius: 3px;
	}
	.lh{
		margin-left:10%;
		line-height:3;
	}
	.rh{
		margin-right:10%;
	}
	
	td,th{
		width:180px;
	}
	.half{
		width:40%;
		float: left;
	}
	
	.halfAssedButtons{
		width:50%;
		float: left;
	}
	
	.third{
		width:33%;
		float: left;
	}
	.full{
		width:100%;
		float:left;
	}
	.newItemDiv{
		margin-bottom:1.5%;
		
	}
	.itemDiv{
		margin: 5px; padding:5px; border-radius:10px; height:320px; background: rgba(157, 157, 157, 0.06);
	}
	.userInfoDiv{
		background: #ecebeb;
    	border-radius: 10px;
   	    margin-left: 1%;
    	width: 98%;
    	margin-right: 1%;
	}
	.abc{
	margin: 5px; padding:5px; border-radius:10px; margin-top:0px;padding-top:0px;
	}
	.tarea{
		resize:none; height:60px; width:98.5%; margin-bottom:0px;
	}
	.imageClass{
		width:40px;height:40px;
		position: absolute;
	    margin-left: -45px;
	    margin-top: 5px;
	    opacity: 0;
	}
	.imgDiv{
		width:20%;
		float:left;	
	}
	
	</style>
	<title>Post your ad here</title>
	</head>
		<div style='position: relative; margin-left:22%; margin-right:22%;'>
			<form action="./AddAd" method="post" style = ''onsubmit="return upload();" enctype="multipart/form-data">
				<div id="itemInputDiv">
					<div id='itemDiv' class='itemDiv'>
						<div><%
							  String err = null;
							  err = request.getParameter("error");
							  if(err != null){
								  if(!err.equals("1"))
									out.println("Your last "+ err +" entries failed to get registered!! Please try again");
								  else
									out.println("Your last entry failed to get registered!! Please try again");
									}%></div>
						<div class='abc'>
							<h3 style='text-align:center;'>Item 1</h3>
							<div class='full'>
								<div class=' lh half'>ITEM NAME </div>							
								<div class='rh half'><input class="bd" id="adTitle" name="adTitle" type="text" required></div>
							</div>
							<div class='full'>
								<div class=' lh half'>SPECIFICATIONS </div>
								<div class='rh half'><input class="bd" id="adSubCategory" name="adSubCategory" type="text" required></div>
							</div>
							<div class='full'>
								<div class=' lh half'>DESCRIPTION </div>	
								<div class='rh half'><textarea class='tarea bd' id="adDesc" name="adDesc" required></textarea></div>		
							</div>	
							<div class='full'>
								<div class='lh half'>PRICE</div>
								<div class='rh half'><input class="bd" id="adPrice" name="productPrice" type="text" required><label hidden style="color:red;" required>price invalid !!!</label></div>
							</div>
							<div class='full'>
								<div class='lh half'>PICTURES</div>
								<div class='rh half'>
									<div class='imgDiv'>
										<img src='images/unnamed.png' width='50px' height='50px'/>
										<input class='bd imageClass' type="file" accept="image/*" id="productImages1_1" name="productImages1_1"></input>
									</div>
									<div class='imgDiv'>
										<img src='images/unnamed.png' width='50px' height='50px'/>
										<input class='bd imageClass' type="file" accept="image/*" id="productImages1_2" name="productImages1_2"></input>
									</div>
									<div class='imgDiv'>
										<img src='images/unnamed.png' width='50px' height='50px'/>
										<input class='bd imageClass' type="file" accept="image/*" id="productImages1_3" name="productImages1_3"></input>
									</div>
									<div class='imgDiv'>
										<img src='images/unnamed.png' width='50px' height='50px'/>
										<input class='bd imageClass' type="file" accept="image/*" id="productImages1_4" name="productImages1_4"></input>
									</div>
									<div class='imgDiv'>
										<img src='images/unnamed.png' width='50px' height='50px'/>
										<input class='bd imageClass' type="file" accept="image/*" id="productImages1_5" name="productImages1_5"></input>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- <div id="newItemDiv" class='newItemDiv full' align="center">
					<div class=' full'><input id="newForm" value="Add Item" type="button"></div>
					<div class=' full'><input id="removeForm" value="Remove Item" type="button" hidden></div>
				</div> -->
				
				<div id="newItemDiv" class="newItemDiv full" align="center">
					<div id="newForm" class="halfAssedButtons"><p style="
					    font-family: sans-serif;
					    font-size: 20px;
					    width: 135px;
					    color: #f9f8f8;
					    /* height: 45px; */
					    padding: 0px;
					    text-align: center;
					    font-weight: bolder;
					    background: rgba(76, 195, 79, 1);
					    border: none;
					    border-radius: 8px;
					    padding: 7px;
						" class="">Add Item <b style="
					    font-size: xx-large;
					    vertical-align: middle;
						">+</b></p></div>
						
					<div id="removeForm" class="halfAssedButtons"><p style="
					    font-family: sans-serif;
					    font-size: 20px;
					    width: 141px;
					    color: #f9f8f8;
						background: #d42c2c;
					    /* height: 45px; */
					    padding: 0px;
					    text-align: center;
					    font-weight: bolder;
					    border: none;
					    border-radius: 8px;
					    padding: 7px;
						" class="">Remove Item <b style="
					    font-size: xx-large;
					    vertical-align: text-top;
						">-</b></p></div>
				</div>

				<div class='full userInfoDiv' id='userInfoDiv'>
					<div style='margin: 5px; padding:5px; border-radius:10px;'>
						<div class='lh full'>
							ABOUT YOU:
						</div>
						<div class='full'>
							<div class=' lh half'>NAME </div>
							<div class='rh half'><input class="bd" id="adUName" name="adUName" type="text" required></div>
						</div>
						<div class='full'>
							<div class=' lh half'>PHONE NUMBER </div>
							<div class='rh half'><input class="bd" id="adUPhone" name="adUPhone" type="text" max ="9999999999" min="1000000000" maxlength="10" required><label hidden style="color:red;" >phone number invalid !!!</label></div>
						</div>
						<div class='full'>
							<div class=' lh half'>PIN </div>
							<div class='rh half'><input class="bd" id="autocomplete" name="adUPin" type="text" required><label hidden style="color:red;" >pin invalid !!!</label></div>
						</div>
						<div class='full'>
							<div class=' lh half'>STREET </div>
							<div class='rh half'><input class="bd" id="adUAddress" name="adUAddress" type="text" maxlength="15" required></div>
						</div>
					</div>
				</div>
				<div id="submissionDiv" align="center" class='full' style='margin-botton:5%;'>
					<div class=' full'><input id="submit" value="Submit" type="submit"></div>
				</div>
			</form>
		</div>
		<script>
      // This example displays an address form, using the autocomplete feature
      // of the Google Places API to help users fill in the information.

      // This example requires the Places library. Include the libraries=places
      // parameter when you first load the API. For example:
      // <script src="https://maps.googleapis.com/maps/api/js?key=YOUR_API_KEY&libraries=places">

      var placeSearch, autocomplete;
      var componentForm = {
        street_number: 'short_name',
        route: 'long_name',
        locality: 'long_name',
        administrative_area_level_1: 'short_name',
        country: 'long_name',
        postal_code: 'short_name'
      };

      function initAutocomplete() {
        // Create the autocomplete object, restricting the search to geographical
        // location types.
        autocomplete = new google.maps.places.Autocomplete(
            /** @type {!HTMLInputElement} */(document.getElementById('autocomplete')),
            {types: ['geocode']});

        // When the user selects an address from the dropdown, populate the address
        // fields in the form.
        autocomplete.addListener('place_changed', fillInAddress);
      }

      function fillInAddress() {
        // Get the place details from the autocomplete object.
        var place = autocomplete.getPlace();

        for (var component in componentForm) {
          document.getElementById(component).value = '';
          document.getElementById(component).disabled = false;
        }

        // Get each component of the address from the place details
        // and fill the corresponding field on the form.
        for (var i = 0; i < place.address_components.length; i++) {
          var addressType = place.address_components[i].types[0];
          if (componentForm[addressType]) {
            var val = place.address_components[i][componentForm[addressType]];
            document.getElementById(addressType).value = val;
          }
        }
      }

      // Bias the autocomplete object to the user's geographical location,
      // as supplied by the browser's 'navigator.geolocation' object.
      function geolocate() {
        if (navigator.geolocation) {
          navigator.geolocation.getCurrentPosition(function(position) {
            var geolocation = {
              lat: position.coords.latitude,
              lng: position.coords.longitude
            };
            var circle = new google.maps.Circle({
              center: geolocation,
              radius: position.coords.accuracy
            });
            autocomplete.setBounds(circle.getBounds());
          });
        }
      }
    </script>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyA4qrUt8B5VustIw8nXAy1odj-Lr8zuAIw&libraries=places&callback=initAutocomplete"
        async defer></script>
	</body>
</html>