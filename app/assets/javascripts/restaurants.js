function getRestaurants(params,callback){
	$.getJSON("/restaurants?search="+params, callback);
}
var markersArray = [];

function clearOverlays() {
  for (var i = 0; i < markersArray.length; i++ ) {
    markersArray[i].setMap(null);
  }
  markersArray.length = 0;
}
function placeRestaurants(list){
	var allRestos = list;
	var theGood = [];
	var theBad = [];
	var theUgly = [];
	var locGood = [];
	var locBad = [];
	var locUgly= [];

	_.each(allRestos, function(resto){
		if(resto.score <= 16){
			theGood.push(resto)
		}else if(resto.score > 16 && resto.score <=28){
			theBad.push(resto)
		}else{
			theUgly.push(resto)
		}
	});

	var resto = $("div.restaurants");
	var pushGood = $("button.good");
	var pushBad = $("button.bad");
	var pushUgly = $("button.ugly");
	var list = $("ul.restaurant-list");
	var buttons = $("div.choices");
	pushGood.click(function(event){
		clearOverlays();
		event.preventDefault();
		list.empty();
		console.log(_.uniq(theGood));
		_.each(theGood, function(item){

			var listItem = $("<li class='each-one'>");
			var linker = $("<a class='links'>");
			var named = $("<p>").text(item.name.toLowerCase());
			var	addy = $("<h4 class='rest'>").text(item.building + " " + item.street.toLowerCase());
			linker.attr("href","/restaurants/"+item.id);
			linker.append(named).append(addy);
			listItem.append(linker).appendTo(list);

	 		var latLng = new google.maps.LatLng(item.lat,item.long);
	 		var marker = new google.maps.Marker({
	 			position: latLng,
	 			title: item.name,
	 			icon: 'http://png-1.findicons.com/files/icons/2360/spirit20/20/bullet_green.png'
	 		})
	 		marker.setMap(map)
	 		markersArray.push(marker)
	 	})
	})
	pushBad.click(function(event){
		event.preventDefault();
		list.empty();
		clearOverlays();
		_.each(theBad, function(item){
			var listItem = $("<li class='each-one'>");
			var linker = $("<a class='links'>");
			var named = $("<p>").text(item.name.toLowerCase());
			var	addy = $("<h4 class='rest'>").text(item.building + " " + item.street.toLowerCase());
			linker.attr("href","/restaurants/"+item.id);
			linker.append(named).append(addy);
			listItem.append(linker).appendTo(list);
			var latLng = new google.maps.LatLng(item.lat,item.long);
			var marker = new google.maps.Marker({
				position: latLng,
				title: item.name,
				icon: 'https://www.hrapply.com/boydgaming/images/required.gif'
			});
			marker.setMap(map);
			markersArray.push(marker)
		})
	})
	pushUgly.click(function(event){
		event.preventDefault();
		list.empty();
		clearOverlays();
		_.each(theUgly, function(item){
			var listItem = $("<li class='each-one'>");
			var linker = $("<a class='links'>");
			var named = $("<p>").text(item.name.toLowerCase());
			var	addy = $("<h4 class='rest'>").text(item.building + " " + item.street.toLowerCase());
			linker.attr("href","/restaurants/"+item.id);
			linker.append(named).append(addy);
			listItem.append(linker).appendTo(list);

			var latLng = new google.maps.LatLng(item.lat,item.long);
			var marker = new google.maps.Marker({
				position: latLng,
				title: item.name,
				icon: 'http://dinera.net/images/redskull.gif'
			})
			marker.setMap(map);	
			markersArray.push(marker); 		
		})
	})
	pushGood.click();

}
