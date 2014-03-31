// Superhero
// Bootswatch
//= require jquery
//= require jquery_ujs
//= require superhero/loader
//= require superhero/bootswatch
//= require mapbox

console.log("from superhero.js")

map = L.mapbox.map('map', 'sudhakarsjce.hlfg5pke');
 
var featureLayer = L.mapbox.featureLayer()
    .loadURL('/earthquakes.json')
    .addTo(map);
	
	featureLayer.on('ready', function() {
	    // featureLayer.getBounds() returns the corners of the furthest-out markers,
	    // and map.fitBounds() makes sure that the map contains these.
	    map.fitBounds(featureLayer.getBounds());
	});
	
	
	$(function() {
	    $('#start').datetimepicker({
	      language: 'en',
	    }).on('changeDate', function(ev){
			console.log(ev.date.toString());
	     // $(this).datetimepicker('hide');
	  });
	  });
	  
	  
	  $("#start").blur(function(e) { $(this).datetimepicker("hide"); });
	  
	  
  	$(function() {
  	    $('#end').datetimepicker({
  	      language: 'en',
  	    }).on('changeDate', function(ev){
  			console.log(ev.date.toString());
  	   //   $(this).datetimepicker('hide');
  	  });
  	  });
	  
	   $("#end").blur(function(e) { $(this).datetimepicker("hide"); });
	  
	  
 
	   $(document).ajaxSend(function(r, s) {
	       $("#wait").show();
	       $('#myModal').modal('show');  
	   	});

	   $(document).ajaxStop(function(r, s) {
	       $("#wait").fadeOut("fast");
	      $('#myModal').modal('hide');
	   });
	  
	  
	  
	/*
 var  geojson;
	
	markerLayer = $.ajax({
  	  	dataType: 'text',
  	 	url: '/earthquakes.json',
 		}).done(function(data){
			console.log($.parseJSON(data));
	   geojson = $.parseJSON(data)
	  });
	  console.log(geojson);
	  map.markerLayer.setGeoJSON(geojson)
	  */