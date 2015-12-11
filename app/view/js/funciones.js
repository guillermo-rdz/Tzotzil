(function (){
	$(".titulo__contenido").html(sesion_area);
	alert("Su area es de tipo: "+sesion_area);
	/*
	alert("Su usuario es de tipo: "+sesion_rango);
	*/
	$.ajax({
		type: "POST",
		url: "app/model/model.php",
		data: {"tipo":"preguntas_p","area":sesion_area,"tipo_frase":"p"}
	}).done(function (info){
		$(".preguntas_p").html(info);
	});
	$(".btnlogout").on("click", function (event){
		event.preventDefault();
		$.ajax({
			type: "POST",
			url: "app/model/model.php",
			data: {"tipo":"logout"}
		}).done(function (info){
			alert(info);
			window.location = "/tzotzil/";
		});
	});
})();