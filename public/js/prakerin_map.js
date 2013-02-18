(function($) {
    $.fn.prakerinMap = function(options) {
        // Default settings
        var settings = $.extend({
            dataUrl: this.baseURI,
            mapOptions: {
                center: new google.maps.LatLng(-6.915094541608494, 107.61005401611328),
                mapTypeId: google.maps.MapTypeId.ROADMAP,
                zoom: 14,
                panControl: false,
                zoomControl: true,
                mapTypeControl: false,
                scaleControl: false,
                streetViewControl: false,
                overviewMapControl: false
            }
        }, options);

        return this.each(function() {
            new PrakerinMap(this, settings);
        });
    }

    function PrakerinMap(e, o) {
        var _this = this;
        this.options = o;
        this.markers = new Array();
        this.map = new google.maps.Map(e, o.mapOptions);
        this.infoWindow = new google.maps.InfoWindow();
        this.addFilterControl();
        this.loadData();
    }

    PrakerinMap.prototype.addFilterControl = function() {
        var _this = this;
        var div = document.createElement('div');
        var filter = document.createElement('select');
        div.style.marginTop = '5px';
        div.style.marginRight = '5px';
        filter.setAttribute('multiple', true);
        filter.setAttribute('class', 'filter-category');

        var options = new Array();
        options['RPL'] = 'Rekayasa Perangkat Lunak';
        options['TKJ'] = 'Teknik Komputer Jaringan';
        options['MM'] = 'Multimedia';
        options['TOI'] = 'Teknik Otomasi Industri';
        options['TITL'] = 'Teknik Instalasi Tenaga Listrik';
        options['AV'] = 'Teknik Audio Video';

        for (var i in options) {
            var option = document.createElement('option');
            option.value = i;
            option.text = options[i];
            filter.appendChild(option);
        }

        div.appendChild(filter);

        $(filter).multiselect({
            checkAllText: 'Pilih semua',
            uncheckAllText: 'Hapus centang',
            noneSelectedText: 'Pilih Kategori Jurusan',
            selectedText: '# dipilih',
            minWidth: 325
        }).change(function() {
            _this.loadData('category=' + $(this).val());
        });
        this.map.controls[google.maps.ControlPosition.TOP_RIGHT].push(div);
    }

    PrakerinMap.prototype.clearMarkers = function() {
        $(this.markers).each(function() {
            this.setMap(null);
        });
    }

    PrakerinMap.prototype.loadData = function(filter) {
        this.clearMarkers();
        var _this = this;
        $.ajax({
            url: this.options.dataUrl,
            contentType: 'application/json',
            type: 'GET',
            async: false,
            data: filter,
            dataType: 'json',
            success: function(data, textStatus, xhr) {
                $(data).each(function() {
                    var _data = this;
                    var position = new google.maps.LatLng(this.lat, this.lng);
                    var marker = _this.addMarker(position, this);
                    _this.markers.push(marker);
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
