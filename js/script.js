var map = L.map('mapid').on('load', onMapLoad).setView([41.400, 2.206], 9);
	
var tiles = L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {}).addTo(map);

var markers = L.markerClusterGroup();


async function onMapLoad() {

    /*
	FASE 3.1
		1) Relleno el data_markers con una petición a la api
		2) Añado de forma dinámica en el select los posibles tipos de restaurantes
		3) Llamo a la función para --> render_to_map(data_markers, 'all'); <-- para mostrar restaurantes en el mapa
	*/
	
	let response = await fetch("http://localhost/mapa/api/apiRestaurants.php");
	data_markers = await response.json();
	console.log(data_markers);

	for (item of data_markers) {
		markers.addLayer(L.marker([item.lat, item.lng])
		.bindPopup("<b>"+ item.name + "</b><br>" + item.address + "<br>" + item.kind_food));	
	}
	map.addLayer(markers);


	//junta todos los kind_food en un array multidimensional
	var arrayKindFood = [];
	for (let i=0; i<data_markers.length; i++) {
		var splitArray = data_markers[i].kind_food.split(',');
		arrayKindFood.push(splitArray);
	}

	//transforma el array multidimensional en uno de una dimensión
	var newArray = [];
	for(var i = 0; i < arrayKindFood.length; i++) {
		newArray = newArray.concat(arrayKindFood[i]);
	}

	//con SET elimino los kind_food repetidos
	var arrayToSet = new Set(newArray);
	var finalKindFood = Array.from(arrayToSet);
	finalKindFood.sort();
	finalKindFood.unshift("Todos");

	//para cada elemento creo un option para el select
	for (let i=0; i<finalKindFood.length; i++) {
		$("#kind_food_selector").append("<option>" + finalKindFood[i] + "</option>");
		}
} 

//onMapLoad


	
	/*
    FASE 3.2
		1) Limpio todos los marcadores
		2) Realizo un bucle para decidir que marcadores cumplen el filtro, y los agregamos al mapa
    */
		

$('#kind_food_selector').on('change', function() {
  console.log(this.value); 
  markers.clearLayers();  //limpio marcadores
  render_to_map(data_markers, this.value);
});


function render_to_map(data_markers,filter) {

	for (item of data_markers) {
		
		if (item.kind_food.includes(filter)) {
			markers.addLayer(L.marker([item.lat, item.lng])
				.bindPopup("<b>"+ item.name + "</b><br>" + item.address + "<br>" + item.kind_food));
		} else if (filter == "Todos") {
			markers.addLayer(L.marker([item.lat, item.lng])
				.bindPopup("<b>"+ item.name + "</b><br>" + item.address + "<br>" + item.kind_food));
		}
	}//for	
	map.addLayer(markers);   	
} //render_to_map