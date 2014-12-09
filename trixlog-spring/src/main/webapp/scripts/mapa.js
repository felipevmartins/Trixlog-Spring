var latLng;
var marker;
var ende;
var idLocation;
var tags = "";

function initialize(lat, lon, z, plotar) {
	tag = " ";
	var geocoder = new google.maps.Geocoder();

	var mapOptions = {
		center : new google.maps.LatLng(lat, lon),
		zoom : z,
		mapTypeId : google.maps.MapTypeId.ROADMAP
	};
	var map = new google.maps.Map(document.getElementById("map_canvas"),
			mapOptions);
	latLng = new google.maps.LatLng(lat, lon);

	if (plotar) {
		marker = new google.maps.Marker({
			position : latLng,
			title : '' + latLng,
			map : map,
		});

		google.maps.event.addDomListener(marker, 'click', function() {
			var infowindow = new google.maps.InfoWindow();

			geocoder.geocode({
				'latLng' : latLng
			}, function(results, status) {
				if (status == google.maps.GeocoderStatus.OK) {
					if (results[1]) {
						infowindow.setContent("<div>"
								+ results[0].formatted_address
								+ "</div><br><br>" + tags);
					} else {
						alert('No results found');
					}
				} else {
					alert('Geocoder failed due to: ' + status);
				}
			});
			infowindow.open(map, marker);
		});
	}
}

function clicaItemLista(id) {
	$.get( "buscar/" + id, function(data) {
			var coordenadas= {"lat": data.latitude, "lon": data.longitude};
			var mapa = coordenadas.map;
			var latitude = data.latitude;
			var longitude = data.longitude;
			if (latitude != null && longitude != null) {
				initialize(latitude, longitude, 18, true);
			}
			$.ajax({
				url : '../tag/tags/'+id,
				contentType: 'application/json',
				success : function(tag) {
					if (tag != null) {
						tags = "";
						for (i = 0; i < tag.length; i++) {
							tags += "<div>" + tag[i] + "</div><br>";
						}
					}
				}
			});
	});
}
