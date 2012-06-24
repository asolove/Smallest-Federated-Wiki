(function() {
  window.plugins.map = {
    bind: function(div, item) {},
    emit: function(div, item) {
      var mapEl;
      $("head").append('<link rel="stylesheet" href="/plugins/map/lib/leaflet/dist/leaflet.css" /><!--[if lte IE 8]><link rel="stylesheet" href="/plugins/map/lib/leaflet/dist/leaflet.ie.css" /><![endif]-->');
      mapEl = $("<div id='map-box'>").css({
        overflow: "hidden",
        width: 430,
        height: 200
      }).appendTo(div);
      return wiki.getScript('/plugins/map/lib/leaflet/dist/leaflet.js', function() {
        return wiki.getScript('/plugins/map/lib/wax/dist/wax.leaf.min.js', function() {
          var map, url;
          url = 'http://a.tiles.mapbox.com/v3/smallest-federated-wiki.map-rtj6uf9e.jsonp';
          map = new L.Map('map-box');
          map.setView(new L.LatLng(38.9, -77.035), 15);
          wax.tilejson(url, function(tilejson) {
            return map.addLayer(new wax.leaf.connector(tilejson));
          });
          return div.addClass("ui-sort-disabled");
        });
      });
    }
  };
}).call(this);
