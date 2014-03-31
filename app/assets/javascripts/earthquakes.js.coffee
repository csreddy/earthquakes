# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/


map = L.mapbox.map('map', 'sudhakarsjce.hlfg5pke').setView([45.52086, -122.679523], 14)

	
	markerLayer = $.ajax
	  dataType: 'text'
	 url: '/earthquakes.json'
	  success: (data) ->
	    geojson = $.parseJSON(data)
	    map.markerLayer.setGeoJSON(geojson)
		