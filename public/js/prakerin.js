$(function() {
  prakerin.map.init();
  prakerin.autocomplete.init();
  prakerin.multiselect.init();
});
  
prakerin = {
  marker: null,
  infoWindow: null,
  map: {
    map: null,
    init: function() {
      var bandung = new google.maps.LatLng(-6.915094541608494, 107.61005401611328);
      var mapDiv = document.getElementById('map-canvas');
      var mapOptions = {
        center: bandung,
        zoom: 14,
        mapTypeId: google.maps.MapTypeId.ROADMAP
      }
        
      prakerin.map.map = new google.maps.Map(mapDiv, mapOptions);
        
      prakerin.marker = new google.maps.Marker({
        map: prakerin.map.map
      });
        
      prakerin.infoWindow = new google.maps.InfoWindow({
        maxWidth: 350,
        disableAutoPan: false
      });
        
      google.maps.event.addListener(prakerin.map.map, 'click', function(event) {
        prakerin.infoWindow.close();
        prakerin.marker.setPosition(event.latLng);
        prakerin.map.map.panTo(prakerin.marker.getPosition());
        document.getElementById('lat').value = event.latLng.lat();
        document.getElementById('lng').value = event.latLng.lng();
      })
      
      prakerin.map.update();
    },
    update: function() {
      if((lat = $("#lat").val()) && (lng = $("#lng").val())) {
        var location = new google.maps.LatLng(lat, lng);
        prakerin.marker.setPosition(location);
        prakerin.map.map.panTo(prakerin.marker.getPosition());
      }
    }
  },
  autocomplete: {
    init: function() {
      var inputField = document.getElementById('search-input');
      var sw = new google.maps.LatLng(-6.972434909746541, 107.52422332763672);
      var ne = new google.maps.LatLng(-6.864734925101462, 107.71339416503906);
      var bounds = new google.maps.LatLngBounds(sw, ne);
        
        
      var autocompleteOptions = {
        types: ['establishment'],
        bounds: bounds
      }
      
      autocomplete = new google.maps.places.Autocomplete(inputField,autocompleteOptions);
        
      google.maps.event.addListener(autocomplete, 'place_changed', function(){
        document.getElementById('prakerin-form').reset();
        var place = autocomplete.getPlace();
        var content = '';
        console.log(place);
          
        prakerin.infoWindow.close();
          
        if(geo = place.geometry) {
          prakerin.marker.setPosition(geo.location);
          prakerin.map.map.panTo(geo.location);
          document.getElementById('lat').value = geo.location.lat();
          document.getElementById('lng').value = geo.location.lng();
        }
          
        if(name = place.name) {
          document.getElementById('name').value = name;
          content += '<h4>'+name+'</h4>';
        }
          
        if(url = place.url) {
          content += '<a href="'+url+'" target="_blank">Info selengkapnya »</a>';
        }
          
        if(address = place.formatted_address) {
          document.getElementById('address').value = address;
          content += '<address>'+address+'<br />'+place.formatted_phone_number+'</address>';
        }
          
        if(phone = place.formatted_phone_number) {
          document.getElementById('contact').value = phone;
        }
          
        if(website = place.website) {
          document.getElementById('website').value = website;
          content += '<a href="'+website+'" target="_blank">'+website+'</a>';
        }
          
        prakerin.infoWindow.setContent(content);
        prakerin.infoWindow.open(prakerin.map.map, prakerin.marker);
          
      });
    }
  },
  multiselect: {
    init: function() {
      $("#category").multiselect({
        checkAllText: 'Pilih semua',
        uncheckAllText: 'Hapus centang',
        noneSelectedText: 'Pilih Kategori Jurusan',
        selectedText: '# dipilih',
        minWidth: 285,
        position: {
          my: 'left bottom',
          at: 'left top'
        }
      });
    }
  }
}