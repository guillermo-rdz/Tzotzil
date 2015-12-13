(function (){
	$(".titulo__contenido").html(nombre_area);
	/*

	function oculta(elemento){
		string={};
		string.item1 = "#item1";
		string.item2 = "#item2";
		string.item3 = "#item3";
		
		var item=$(elemento);
		if($(item).hasClass('visible')){
			$(item).removeClass('visible');
			$(item).addClass('invisible');
			$(item).slideUp('fast');
		} else {
			$(item).removeClass('invisible');
			$(item).addClass('visible');
			$(item).slideDown('fast');
		}
	}
	*/


	$.ajax({
		type: "POST",
		url: "app/model/model.php",
		data: {"tipo":"preguntas_p","area":nombre_area,"tipo_frase":"p"}
	}).done(function (info){
		//console.log(info);
		$(".preguntas_p").html(info);
	});


	/*
	//primer contenido	
	$.ajax({
		type: "POST",
		url: "app/model/model.php",
		data: {"tipo":"preguntas_p","area":nombre_area,"tipo_frase":"p"}
	}).done(function (info){
		$(".preguntas_p").html(info);
	});
	//segundo contenido
	$.ajax({
		type: "POST",
		url: "app/model/model.php",
		data: {"tipo":"preguntas_p","area":sesion_area,"tipo_frase":"p"}
	}).done(function (info){
		$(".preguntas_p").html(info);
	});
	//tercer contenido
	$.ajax({
		type: "POST",
		url: "app/model/model.php",
		data: {"tipo":"preguntas_p","area":sesion_area,"tipo_frase":"p"}
	}).done(function (info){
		$(".preguntas_p").html(info);
	});
	*/

	//Boton desconectar
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