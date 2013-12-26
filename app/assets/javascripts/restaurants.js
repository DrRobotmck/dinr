function getRestaurants(callback){
	 $.getJSON("/restaurants", callback);
}

function placeRestaurants(list){
	 var allRestos = list;
	 var theGood = [];
	 var theBad = [];
	 var theUgly = [];

	 _.each(allRestos, function(resto){
	 		if(resto.points <= 16){
	 			theGood.push(resto)
	 		}else if(resto.points > 16 && resto.points <=28){
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
	 	event.preventDefault();
	 	// resto.removeClass("bad").removeClass("ugly").addClass("good");
	 	// buttons.removeClass("bad").removeClass("ugly").addClass("good");
	 	list.empty();
	 	_.each(theGood, function(item){
	 		var listItem = $("<li class='each-one'>");
	 		var linker = $("<a class='links'>");
	 		linker.attr("href","/restaurants/"+item.id);
	 		linker.text(item.camis);
	 		listItem.append(linker).appendTo(list);
	 	})
	 })
	 pushBad.click(function(event){
	 	event.preventDefault();
	 	// resto.removeClass("good").removeClass("ugly").addClass("bad");
	 	// buttons.removeClass("good").removeClass("ugly").addClass("bad");
	 	list.empty();
	 	_.each(theBad, function(item){
	 		var listItem = $("<li class='each-one'>");
	 		var linker = $("<a class='links'>");
	 		linker.attr("href","/restaurants/"+item.id);
	 		linker.text(item.camis);
	 		listItem.append(linker).appendTo(list);
	 	})
	 })
	 pushUgly.click(function(event){
	 	event.preventDefault();
	 	// resto.removeClass("good").removeClass("bad").addClass("ugly");
	 	// buttons.removeClass("good").removeClass("bad").addClass("ugly");
	 	list.empty();
	 	_.each(theUgly, function(item){
	 		var listItem = $("<li class='each-one'>");
	 		var linker = $("<a class='links'>");
	 		linker.attr("href","/restaurants/"+item.id);
	 		linker.text(item.camis);
	 		listItem.append(linker).appendTo(list);
	 	})
	 })
	 pushGood.click();
}
$(function(){
	getRestaurants(placeRestaurants);
})