<!DOCTYPE HTML>
<html lang="en-US">
  <head>
    <meta charset="UTF-8">
    <title>Google Places</title>
    <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCTNj8ia2gmUviCAL5Beyrip_OQSI_hJdw&sensor=false&language=id&libraries=places"></script>
    <script type="text/javascript">
      
      
      my_map = {
        map: null,
        bandung: new google.maps.LatLng(-6.915094541608494, 107.61005401611328),
        init: function() {
          var mapDiv = document.getElementById('map_canvas')
          var mapOptions = {
            center: my_map.bandung,
            mapTypeId: google.maps.MapTypeId.ROADMAP,
            zoom: 14
          }
          my_map.map = new google.maps.Map(mapDiv, mapOptions);
        }
      }
      
      google.maps.event.addDomListener(window, 'load', my_map.init);
    </script>

    <style type="text/css">
      body {
        background-color:#ddd;
      }
      #map_canvas {
        background-color:#FFF;
        border: 5px solid #232323;
        border-radius: 5px;
        box-shadow: 5px 3px 5px rgba(150, 150, 150, 0.5);
        width: 600px;
        height:400px;
        margin:20px auto;
      }
    </style>
  </head>
  <body>
    <div id="map_canvas"></div>
  </body>
</html>