<!DOCTYPE HTML>
<html lang="en-US">
  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no"/>
    <title>Map Canvas</title>
    <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCTNj8ia2gmUviCAL5Beyrip_OQSI_hJdw&sensor=false&language=id&region=ES"></script>
    <script type="text/javascript">
      
      SITi_prakerin_map = {
        init: function() {
          var bandung = new google.maps.LatLng(-6.915094541608494, 107.61005401611328);
          var mapDiv = document.getElementById('map_canvas');
          var mapOptions = {
            center: bandung,
            mapTypeId: google.maps.MapTypeId.ROADMAP,
            zoom: 14,
            disableDefaultUI: true
          }
          map = new google.maps.Map(mapDiv, mapOptions);
        
        
          map.controls[google.maps.ControlPosition.TOP_CENTER].push(new SITi_prakerin_map.HomeControl(map, bandung));
        },
        HomeControl : function(map, home) {
          _this = this;
          this.map = map;
          this.home = home;
        
          // create element named div to wrap our controls UI
          controlDiv = document.createElement('div');
        
          // create a button that used to return to home
          var goHomeUI = document.createElement('button');
          goHomeUI.innerHTML = 'Go Home';
          controlDiv.appendChild(goHomeUI);
        
          // create a button that used to set home to current position
          var setHomeUI = document.createElement('button');
          setHomeUI.innerHTML = 'Set Home';
          controlDiv.appendChild(setHomeUI);
        
          // when user click on the goHomeUI it will bring to current saved position
          google.maps.event.addDomListener(goHomeUI, 'click', function(){
            map.setCenter(_this.getHome());
          });
        
          // when user click on the setHomeUI it will set current position as home
          google.maps.event.addDomListener(setHomeUI, 'click', function(){
            _this.setHome(map.getCenter());
          })
        
          return controlDiv;
        }
      }
      
      SITi_prakerin_map.HomeControl.prototype.getHome = function() {
        return this.home;
      }
      
      SITi_prakerin_map.HomeControl.prototype.setHome = function(home){
        this.home = home;
      }
      
      
      
      window.onload = function(){
        SITi_prakerin_map.init();
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

<!--center: new google.maps.LatLng(-6.915094541608494, 107.61005401611328),-->