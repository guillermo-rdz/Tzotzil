(function (){
	$(".titulo__contenido").html(sesion_area);
	/*
	alert("Su area es de tipo: "+sesion_area);
	alert("Su usuario es de tipo: "+sesion_rango);
	$("a[data='link1']").on("click",function (event){
		event.preventDefault();
		var valor = $("a[data='link1']").attr("href");
		oculta(valor);
	});
	$("a[data='link2']").on("click",function (event){
		event.preventDefault();
		var valor = $("a[data='link2']").attr("href");
		oculta(valor);
	});
	$("a[data='link3']").on("click",function (event){
		event.preventDefault();
		var valor = $("a[data='link2']").attr("href");
		oculta(valor);
	});

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