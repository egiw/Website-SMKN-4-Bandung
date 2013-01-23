$(function(){
  prakerin_index.multiselect.init("#filter-category");
  prakerin_index.map.init("#map_canvas");
});
  
prakerin_index = {
  multiselect: {
    init: function(id) {
      $(id).multiselect({
        checkAllText: 'Pilih semua',
        uncheckAllText: 'Hapus centang',
        noneSelectedText: 'Pilih Kategori Jurusan',
        selectedText: '# dipilih',
        minWidth: 240
      });
    }
  },
  map: {
    mapDiv: null,
    map: null,
    init: function(id) {
      prakerin_index.map.mapDiv = $(id)[0];
      prakerin_index.map.create();
      prakerin_index.map.populate();
    },
    create: function() {
      var bandung = new google.maps.LatLng(-6.915094541608494, 107.61005401611328);
      var mapDiv = prakerin_index.map.mapDiv;
      var mapOptions = {
        center: bandung,
        mapTypeId: google.maps.MapTypeId.ROADMAP,
        zoom: 14
      }
      prakerin_index.map.map = new google.maps.Map(mapDiv, mapOptions);
    },
    populate: function() {
      $.ajax({
        url: 'prakerin/data',
        type: 'GET',
        dataType: 'json',
        processData: true,
        contentType: 'application/json',
        success: function(data, textStatus,jqXHR) {
          alert(data);
        }
      });
    }
  }
}