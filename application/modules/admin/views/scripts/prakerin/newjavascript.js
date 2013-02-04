
      function initialize() {
        var mapOptions = {
          center: new google.maps.LatLng(-33.8688, 151.2195),
          zoom: 13,
          mapTypeId: google.maps.MapTypeId.ROADMAP
        };
        var map = new google.maps.Map(document.getElementById('map_canvas'),
          mapOptions);

        var input = document.getElementById('searchTextField');
        var autocomplete = new google.maps.places.Autocomplete(input);

        autocomplete.bindTo('bounds', map);

        var infowindow = new google.maps.InfoWindow();
        var marker = new google.maps.Marker({
          map: map
        });

        google.maps.event.addListener(autocomplete, 'place_changed', function() {
          infowindow.close();
          marker.setVisible(false);
          input.className = '';
          var place = autocomplete.getPlace();
          if (!place.geometry) {
            // Inform the user that the place was not found and return.
            input.className = 'notfound';
            return;
          }

          // If the place has a geometry, then present it on a map.
          if (place.geometry.viewport) {
            map.fitBounds(place.geometry.viewport);
          } else {
            map.setCenter(place.geometry.location);
            map.setZoom(17);  // Why 17? Because it looks good.
          }
          var image = new google.maps.MarkerImage(
              place.icon,
              new google.maps.Size(71, 71),
              new google.maps.Point(0, 0),
              new google.maps.Point(17, 34),
              new google.maps.Size(35, 35));
          marker.setIcon(image);
          marker.setPosition(place.geometry.location);

          var address = '';
          if (place.address_components) {
            address = [
              (place.address_components[0] && place.address_components[0].short_name || ''),
              (place.address_components[1] && place.address_components[1].short_name || ''),
              (place.address_components[2] && place.address_components[2].short_name || '')
            ].join(' ');
          }

          infowindow.setContent('<div><strong>' + place.name + '</strong><br>' + address);
          infowindow.open(map, marker);
        });

        // Sets a listener on a radio button to change the filter type on Places
        // Autocomplete.
        function setupClickListener(id, types) {
          var radioButton = document.getElementById(id);
          google.maps.event.addDomListener(radioButton, 'click', function() {
            autocomplete.setTypes(types);
          });
        }

        setupClickListener('changetype-all', []);
        setupClickListener('changetype-establishment', ['establishment']);
        setupClickListener('changetype-geocode', ['geocode']);
      }
      google.maps.event.addDomListener(window, 'load', initialize);
    
    
    SITi_map = {
    map: null,
    autocomplete:null,
    init: function() {
      SITi_map.initMap();
      SITi_map.initAutoComplete();
    },
    initMap: function() {
      var bandung = new google.maps.LatLng(-6.915094541608494, 107.61005401611328);
      var mapDiv = document.getElementById('map-canvas');
      var mapOptions = {
        center: bandung,
        zoom: 14,
        mapTypeId: google.maps.MapTypeId.ROADMAP
      }
      SITi_map.map = new google.maps.Map(mapDiv, mapOptions);
      
      google.maps.event.addListener(SITi_map.map, 'click', function(event){
        console.log(event.latLng);
      })
    },
    initAutoComplete: function() {
      var inputField = document.getElementById('search-input');
      var sw = new google.maps.LatLng(-6.972434909746541, 107.52422332763672);
      var ne = new google.maps.LatLng(-6.864734925101462, 107.71339416503906);
      var bounds = new google.maps.LatLngBounds(sw, ne);
      
      var autocompleteOptions = {
        types: ['establishment'],
        bounds: bounds
      }
      
      SITi_map.autocomplete = new google.maps.places.Autocomplete(inputField, autocompleteOptions);
      SITi_map.autocomplete.bindTo('bounds', SITi_map.map);
      
      google.maps.event.addListener(SITi_map.autocomplete, 'place_changed', function(){
        var place = SITi_mapautocomplete.getPlace();
      })
    }
  }
  google.maps.event.addDomListener(window, 'load', SITi_map.init);