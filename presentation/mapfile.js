// Sets map

var map = L.map( 'map', {
    center: [40.7613292,-73.9834088],
    zoom: 16
});

L.tileLayer( 'http://{s}.tiles.mapbox.com/v4/rcastellanes.d1bd2cf7/{z}/{x}/{y}.png?access_token=pk.eyJ1IjoicmNhc3RlbGxhbmVzIiwiYSI6IkVRd0dDaVEifQ.EsWXaa4BxE2qtGQ658rXqQ', {
    attribution: 'Map data &copy; <a href="http://openstreetmap.org">OpenStreetMap</a> contributors, <a href="http://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, Imagery © <a href="http://mapbox.com">MapBox</a>'
}).addTo( map );

// 
var legendControl = new L.Control.Legend();
legendControl.addTo(map);

// Pulls data from the CSV
$.get('http://rcastellanes.github.io/data/newcentroidfile.csv', function(data) {
    mapData(data);
});

function mapData(data) {
    var dataset = $.csv.toObjects(data);
    var datasetLength = dataset.length;
    var marker;
    for (var i = 0; i < datasetLength; i++) {
	var currentDataPoint = dataset[i];

	// removes null variables

	if (!currentDataPoint.BlockHeight || !currentDataPoint.RoadbedDist ||
	    !currentDataPoint.XCoord || !currentDataPoint.YCoord) {
	    continue;
	}

	// sets data points
	var options = {
	    data: {
		'BlockHeight': currentDataPoint.BlockHeight,
		'RoadBedDist': currentDataPoint.RoadbedDist
	    },
	    chartOptions: {
		'BlockHeight': {
		    fillColor: '#5DA5DA',
		    gradient: false,
		    minValue: 0,
		    maxValue: 160,
		    maxHeight: 160,
		    displayText: function (value) {
			return value.toFixed(0);
		    }
		},
		'RoadBedDist': {
		    fillColor: '#F15854',
		    gradient: false,
		    minValue: 0,
		    maxValue: 30,
		    maxHeight: 30,
		    displayText: function (value) {
			return value.toFixed(0);
		    }
		}
	    },
	    weight: 1,
	    color: '#000000'
	}

	// sets data points to block centers
	marker = new L.BarChartMarker(new L.LatLng(currentDataPoint.YCoord,currentDataPoint.XCoord), options);
	map.addLayer(marker);
    }
}
