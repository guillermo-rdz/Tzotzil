(function (){

	$.ajaxSetup({"cache": false });
	
	var area_nueva = $("#area_nueva");
	var frase_nueva = $("#frase_nueva");
	var id_area_select = $("#id_area_select");
	//var id_area_select = 2;
	var frase_nueva_esp = $("#frase_nueva_esp");
	var frase_nueva_tzo = $("#frase_nueva_tzo");

	//-------------------------------------------------------------------

	var id_area_select_aus = $("#id_area_select_aus");
	//var id_area_select = 2;
	var frase_nueva_esp_aus = $("#frase_nueva_esp_aus");
	var frase_nueva_tzo_aus = $("#frase_nueva_tzo_aus");

	//console.log(id_area_select.val());

$.ajax({
	type: "POST",
	url: "app/model/model.php",
	data: {"tipo":"listar_areas"}
	}).done(function (info){
	//console.log(info);
	$(".lista_areas").html(info);
	});


	//setInterval("listar_areas()", 2000);


$.ajax({
		type: "POST",
		url: "app/model/model.php",
		data: {"tipo":"listar_areas_select"}
	}).done(function (info){
		//console.log(info);
		$("#id_area_select").html(info);
		$("#id_area_select_aus").html(info);
		$("#id_area_select_aus2").html(info);
	});

	$("#btnareanueva").on("click", function (event){
		event.preventDefault();
		alert("click");
		$.ajax({
			type: "POST",
			url: "app/model/model.php",
			data: {"tipo":"agregar_area","nombre_area":area_nueva.val()}
		}).done(function (info){
			alert(info);
			$("#area_nueva").val("");
			//window.location = "/tzotzil/";
		});
	});

	$("#btnbtnuevap").on("click", function (event){
		event.preventDefault();
		$.ajax({
			type: "POST",
			url: "app/model/model.php",
			data: {"tipo":"agregar_pregunta", "id_area_select":id_area_select.val(),"frase_nueva_esp":frase_nueva_esp.val(),"frase_nueva_tzo":frase_nueva_tzo.val(), "tipo_frase":"p"}
		}).done(function (info){
			alert(info);
			$("#frase_nueva_esp").val("");
			$("#frase_nueva_tzo").val("");
			//console.log(info);
			//window.location = "/tzotzil/";
		});
	});

	$("#btnbtnuevaa").on("click", function (event){
		event.preventDefault();
		$.ajax({
			type: "POST",
			url: "app/model/model.php",
			data: {"tipo":"agregar_pregunta", "id_area_select":id_area_select_aus.val(),"frase_nueva_esp":frase_nueva_esp_aus.val(),"frase_nueva_tzo":frase_nueva_tzo_aus.val(), "tipo_frase":"a"}
		}).done(function (info){
			alert(info);
			$("#frase_nueva_esp_aus").val("");
			$("#frase_nueva_tzo_aus").val("");
			//console.log(info);
			//window.location = "/tzotzil/";
		});
	});

	

})();