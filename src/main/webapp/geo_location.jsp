<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://maps.googleapis.com/maps/api/js"></script>
	<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDttBuYDVH-vhfQdU0ABmenukvUrnvznQ8&callback=initMap" async defer></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/gmaps.js/0.4.24/gmaps.min.js"></script>
	<script type="text/javascript">
		<!--
		
		//-->
	//	var findMeButton = $('#ge');
		function findme(){
		//Check if the browser has support for the Geolocation API
		if (!navigator.geolocation) {
			console.log("no");
		findMeButton.addClass("disabled");
		$('.no-browser-support').addClass("visible");
		
		} else {
		 //e.preventDefault();
		
		 navigator.geolocation.getCurrentPosition(function(position) {
		
		   // Get the coordinates of the current possition.
		   var lat = position.coords.latitude;
		   var lng = position.coords.longitude;
		
		   $('.latitude').text(lat.toFixed(3));
		   $('.longitude').text(lng.toFixed(3));
		   $('.coordinates').addClass('visible');
		
		   // Create a new map and place a marker at the device location.
		   var map = new GMaps({
		     el: '#map',
		     lat: lat,
		     lng: lng
		   });
		
		   map.addMarker({
		     lat: lat,
		     lng: lng
		   });
		   var getJSON = function(url, callback) {
			    var xhr = new XMLHttpRequest();
			    xhr.open("get", url, true);
			    xhr.responseType = "json";
			    xhr.onload = function() {
			      var status = xhr.status;
			      if (status == 200) {
			        callback(null, xhr.response);
			        
			        console.log(xhr.response.results[0].address_components[1].short_name);
			      } else {
			    	  console.log("Yes");
			        callback(status);
			      }
			    };
			    xhr.send();
			};
		   var data;
		   $.getJSON("https://maps.googleapis.com/maps/api/geocode/json?latlng=29.624,-82.372&key=AIzaSyDttBuYDVH-vhfQdU0ABmenukvUrnvznQ8",function(err, data) {
			   if (err != null) {
				    alert("Something went wrong: " + err);
				  } else {
				    alert("Your query count: " + data.query.count);
				  }
		   });
		
		 });
		 
		
		}
		}
</script>
<style>
	#geocoding_form {
		  margin: 40px auto 40px;
		}
		
		.input-group {
		  margin-left: 4%;
		}
		
		.find-me.btn:focus {
		  border-color: transparent;
		  outline: 0;
		}
		
		.coordinates {
		  font-size: 18px;
		  opacity: 0;
		  margin-bottom: 40px;
		}
		
		.no-browser-support {
		  font-size: 18px;
		  opacity: 0;
		}
		
		.coordinates b:first-child {
		  margin-right: 15px;
		}
		
		.visible {
		  opacity: 1;
		}
		
		.map-overlay {
		  max-width: 600px;
		  height: 400px;
		  margin: 0 auto;
		  background-color: #fff;
		  position: relative;
		  border-radius: 2px;
		}
		
		#map {
		  max-width: 550px;
		  height: 400px;
		  margin: 0 auto;
		}
</style>
<head>
	<div class="container">

						  <h1>Geolocation Demo</h1>
						
						  <form id="geocoding_form" class="form-horizontal">
						    <div class="form-group">
						      <div class="col-xs-12 col-md-6 col-md-offset-3">
						        <button type="button" onclick="findme()" id="ge" class="find-me btn btn-info btn-block">Find My Location</button>
						      </div>
						    </div>
						  </form>
						
						  <p class="no-browser-support">Sorry, the Geolocation API isn't supported in Your browser.</p>
						  <p class="coordinates">Latitude: <b class="latitude">42</b> Longitude: <b class="longitude">32</b></p>
						
						  <div class="map-overlay">
						    <div id="map"></div>
						  </div>
						
						</div>
</head>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

</body>
</html>