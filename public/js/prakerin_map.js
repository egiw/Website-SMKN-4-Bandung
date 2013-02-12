(function($) {
  $.fn.prakerinMap = function(options) {
    // Default settings
    var settings  = $.extend({
      dataUrl: this.baseURI,
      mapOptions: {
        center: new google.maps.LatLng(-6.915094541608494, 107.61005401611328),
        mapTypeId: google.maps.MapTypeId.ROADMAP,
        zoom: 14
      }
    }, options);
    
    return this.each(function(){
      new PrakerinMap(this, settings);
    })
  }
  
  function PrakerinMap(e, o) {
    this.options = o;
    this.map = new google.maps.Map(e, o.mapOptions);
    this.infoWindow = new google.maps.InfoWindow();
    this.loadData();
  }
  
  PrakerinMap.prototype.loadData = function() {
    var _this = this;
    $.ajax({
      url: this.options.dataUrl,
      contentType: 'application/json',
      type: 'GET',
      dataType: 'json',
      success: function(data, textStatus, xhr) {
        $(data).each(function(){
          var _data = this;
          var position = new google.maps.LatLng(this.lat, this.lng);
          var marker = _this.addMarker(position, this);
          marker.labelContent = this.name;
          google.maps.event.addListener(marker, 'click', function() {
            _this.displayInfo(this, _data);
          });
        });
      }
    });
  }
  
  PrakerinMap.prototype.addMarker = function(position, data) {
    var image = 'all.png';
    if('RPL,TKJ,MM' == data.category) {
      image = 'rpl_tkj_mm.png';
    }else if('RPL,MM' == data.category) {
      image = 'rpl_mm.png';
    }
    
    var image = new google.maps.MarkerImage(
      '/js/prakerin/markers/' + image,
      new google.maps.Size(30,29),
      new google.maps.Point(0,0),
      new google.maps.Point(15,29)
      );

    var shadow = new google.maps.MarkerImage(
      '/js/prakerin/markers/shadow.png',
      new google.maps.Size(48,29),
      new google.maps.Point(0,0),
      new google.maps.Point(15,29)
      );

    var shape = {
      coord: [29,0,29,1,29,2,29,3,29,4,29,5,29,6,29,7,29,8,29,9,29,10,29,11,29,12,
      29,13,29,14,29,15,29,16,29,17,29,18,29,19,29,20,29,21,29,22,29,23,29,24,29,
      25,29,26,29,27,29,28,0,28,0,27,0,26,0,25,0,24,0,23,0,22,0,21,0,20,0,19,0,18,
      0,17,0,16,0,15,0,14,0,13,0,12,0,11,0,10,0,9,0,8,0,7,0,6,0,5,0,4,0,3,0,2,0,1,
      0,0,29,0],
      type: 'poly'
    };
    
    return new MarkerWithLabel({
      position: position,
      map: this.map,
      draggable: false,
      raiseOnDrag: false,
      labelAnchor: new google.maps.Point(50, 55),
      labelClass: "label label-info label-mini",
      labelInBackground: false
    //      icon: image,
    //      shadow: shadow,
    //      shape: shape
    });
  }
  
  PrakerinMap.prototype.displayInfo = function(marker, data) {
    var category = {
      'RPL' : 'Rekayasa Perangkat Lunak',
      'TKJ' : 'Teknik Komputer Jaringan',
      'MM' : 'Multimedia',
      'TOI' : 'Teknik Otomasi Industri',
      'TITL' : 'Teknik Instalasi Tenaga Listrik',
      'AV': 'Teknik Audio dan Video'
    };
    
    var category_list = '<ul class="list_a">';
    var categories = data.category.split(',');
    for(i in categories) {
      category_list += '<li>'+category[categories[i]]+'</li>';
    }
    category_list += '</ul>';
        
    var content = '<address>';
    content += '<strong>'+data.name+'</strong><br />';
    content += '<a href="'+data.website+'" target="_blank">'+data.website+'</a><br />';
    content += data.address + '<br />';
    content += data.contact + '<br /><br />';
    content += '<strong>Kategori jurusan:</strong> <br />';
    content += category_list;
    content += '</address>';
    
    this.infoWindow.setContent(content);
    this.infoWindow.open(this.map, marker);
  }
})(jQuery);
