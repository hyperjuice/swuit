// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

//= require moment
//= require bootstrap-datetimepicker
//= require pickers

$(function() {

	$.getJSON('/mapdata', function(data) {

		L.mapbox.accessToken = 'pk.eyJ1IjoiaHlwZXJqdWljZSIsImEiOiIwNmNmYjFmYzY2MjIyMjBkYTFjYWJiZWQ3NGZhZjkxMyJ9.nkuZ1eUGDblRS7pm8IAy-A';
			var map = L.mapbox.map('map', 'hyperjuice.mbd96bic')
	    .setView([37.865626, -122.280749], 12);

	    var features = [];
	    for (i =0; i < data.length; i++) {

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
		        'marker-size': 'large',
		        'marker-color': '#000',
		        'marker-symbol': 'park'
		    }
		    	});
		    }
		    L.mapbox.featureLayer(features).addTo(map);
	});
});