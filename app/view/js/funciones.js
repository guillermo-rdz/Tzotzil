(function (){
	//$(document).on("ready", function (){
		$.ajax({
			type: "POST",
			url: "app/model/model.php",
			data: {"tipo":"preguntas_p","id_area":2}
		}).done(function (info){
			$(".contenido").html(info);
		});
	//});
})();