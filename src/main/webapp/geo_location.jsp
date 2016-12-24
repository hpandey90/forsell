    <style>
      /* Always set the map height explicitly to define the size of the div
       * element that contains the map. */
      #map {
        height: 100%;
      }
      /* Optional: Makes the sample page fill the window. */
      html, body {
        height: 100%;
        margin: 0;
        padding: 0;
      }
      #floating-panel {
        position: absolute;
        top: 10px;
        left: 25%;
        z-index: 5;
        background-color: #fff;
        padding: 5px;
        border: 1px solid #999;
        text-align: center;
        font-family: 'Roboto','sans-serif';
        line-height: 30px;
        padding-left: 10px;
      }
      #floating-panel {
        position: absolute;
        top: 5px;
        left: 50%;
        margin-left: -180px;
        width: 350px;
        z-index: 5;
        background-color: #fff;
        padding: 5px;
        border: 1px solid #999;
      }
      #latlng {
        width: 225px;
      }
    </style>
    <div id="floating-panel">
      <input id="latlng" type="text" value="129.624,-2.372">
      <input id="submit" type="button" value="Reverse Geocode">
    </div>
    <div id="map"></div>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDttBuYDVH-vhfQdU0ABmenukvUrnvznQ8&callback=initMap" async defer></script>
    <script>
	<!-- $(document).ready(function(){initMap();}); -->
	
	
      function initMap() {
        var geocoder = new google.maps.Geocoder;
		navigator.geolocation.getCurrentPosition(function(position) {
		   // Get the coordinates of the current position.
		   var lat = position.coords.latitude;
		   var lng = position.coords.longitude;
		   console.log(lat+"===="+lng);
		  
          geocodeLatLng(geocoder, lat, lng);
			});
      }

      function geocodeLatLng(geocoder,lat,lng) {
        var input = document.getElementById('latlng').value;
        var latlngStr = input.split(',', 2);
        var latlng = {lat: parseFloat(lat), lng: parseFloat(lng)};
        geocoder.geocode({'location': latlng}, function(results, status) {
          if (status === 'OK'){
            if (results[0]) {
              console.log(results[0].formatted_address);
            } else {
              window.alert('No results found');
            }
          } else {
            window.alert('Geocoder failed due to: ' + status);
          }
        });
      }
	  $(document).ready(function(){
	  initMap();
	  });
    </script>