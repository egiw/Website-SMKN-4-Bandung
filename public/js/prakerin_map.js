(function($) {
    $.fn.prakerinMap = function(options) {
        // Default settings
        var settings = $.extend({
            dataUrl: this.baseURI,
            mapOptions: {
                center: new google.maps.LatLng(-6.915094541608494, 107.61005401611328),
                mapTypeId: google.maps.MapTypeId.ROADMAP,
                zoom: 14
            }
        }, options);

        return this.each(function() {
            new PrakerinMap(this, settings);
        })
    }

    function PrakerinMap(e, o) {
        this.options = o;
        this.map = new google.maps.Map(e, o.mapOptions);
        this.infoWindow = new google.maps.InfoWindow();
        this.loadData('category=&name=Sangkuriang');
    }

    PrakerinMap.prototype.loadData = function(filter) {
        var _this = this;
        $.ajax({
            url: this.options.dataUrl,
            contentType: 'application/json',
            type: 'GET',
            data: filter,
            dataType: 'json',
            success: function(data, textStatus, xhr) {
                $(data).each(function() {
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
        return new MarkerWithLabel({
            position: position,
            map: this.map,
            draggable: false,
            raiseOnDrag: false,
            labelAnchor: new google.maps.Point(50, 55),
            labelClass: "label label-info label-mini",
            labelInBackground: false
        });
    }

    PrakerinMap.prototype.displayInfo = function(marker, data) {
        var category = {
            'RPL': 'Rekayasa Perangkat Lunak',
            'TKJ': 'Teknik Komputer Jaringan',
            'MM': 'Multimedia',
            'TOI': 'Teknik Otomasi Industri',
            'TITL': 'Teknik Instalasi Tenaga Listrik',
            'AV': 'Teknik Audio dan Video'
        };

        var category_list = '<ul class="list_a">';
        var categories = data.category.split(',');
        for (i in categories) {
            category_list += '<li>' + category[categories[i]] + '</li>';
        }
        category_list += '</ul>';

        var content = '<address>';
        content += '<strong>' + data.name + '</strong><br />';
        content += '<a href="' + data.website + '" target="_blank">' + data.website + '</a><br />';
        content += data.address + '<br />';
        content += data.contact + '<br /><br />';
        content += '<strong>Kategori jurusan:</strong> <br />';
        content += category_list;
        content += '</address>';

        this.infoWindow.setContent(content);
        this.infoWindow.open(this.map, marker);
    }
})(jQuery);
