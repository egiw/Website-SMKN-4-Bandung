<!DOCTYPE HTML>
<html lang="en-US">
  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no"/>
    <title>Map Canvas</title>
    <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCTNj8ia2gmUviCAL5Beyrip_OQSI_hJdw&sensor=false&language=id&region=ES"></script>
    <script type="text/javascript">
      
      SITi_map = {
        init:function() {
          var map;
          var mapCanvas = document.getElementById('map_canvas');
          var mapOptions = {
            center: new google.maps.LatLng(-6.915094541608494, 107.61005401611328),
            mapTypeId: google.maps.MapTypeId.ROADMAP,
            zoom: 14
          }
      
          map = new google.maps.Map(mapCanvas, mapOptions);
          
          var locations = [
            new google.maps.LatLng(-6.914327684046259, 107.59743690490723),
            new google.maps.LatLng(-6.914838922559386, 107.6301383972168),
            new google.maps.LatLng(-6.907340702276085, 107.60464668273926)
          ];
          
          for(i in locations) {
            marker= new google.maps.Marker({
              position: locations[i],
              map: map
            });
          }
          
          var info=new google.maps.InfoWindow({
            content: '',
            size: new google.maps.Size(500,500)
          })
          
          var infoWindow = new google.maps.InfoWindow({
            content: 'Change zoom level',
            position: map.getCenter()
          });
          infoWindow.open(map);
          
          google.maps.event.addListener(map, 'click', function(event){
            
          });
          
          google.maps.event.addListener(marker, 'mouseover', function(){
            info.open(map, marker);
          });
          
          google.maps.event.addListener(map, 'zoom_changed', function(){
            var zoomLevel= map.getZoom();
            infoWindow.setContent('zoom: ' + zoomLevel);
          })
          
          google.maps.event.addListener(marker, 'mouseout', function(){
            setTimeout(function(){info.close(map, marker)}, 3000);
          })
        }
      }
      
      window.onload =function() {
        SITi_map.init();
      }
      
      
      
      
    </script>
    <style type="text/css">
      html {height: 100%}
      body {height:100%; width:100%; margin:0;padding:0}
      #map_canvas {height: 100%}
    </style>
  </head>
  <body>
    <div id="map_canvas" style="width: 100%;height: 100%"></div>
  </body>
</html>