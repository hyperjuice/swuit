$(function() {

$.getJSON('/mapdata', function(data) {

    L.mapbox.accessToken = 'pk.eyJ1IjoiaHlwZXJqdWljZSIsImEiOiIwNmNmYjFmYzY2MjIyMjBkYTFjYWJiZWQ3NGZhZjkxMyJ9.nkuZ1eUGDblRS7pm8IAy-A';
      var map = L.mapbox.map('map', 'hyperjuice.mbd96bic')
      .setView([37.865626, -122.280749], 12);

      var features = [];
      for (i = 0; i < data.length; i++) {

        features.push( {

        type: 'Feature',
        geometry: {
          type: 'Point',
          // coordinates here are in longitude, latitude order because
          // x, y is the standard for GeoJSON and many formats
          coordinates: [
             data[i].longitude, data[i].latitude
          ]
        },
        properties: {
            title: ''+data[i].kind,
            description: ''+data[i].description,
            'marker-size': 'large',
            'marker-color': '#000',
            'marker-symbol': 'park'
        }
          });
        }
        L.mapbox.featureLayer(features).addTo(map);
  });
});