(function (){

	$.ajaxSetup({"cache": false });

	$(".btnP").on("click", function (event){
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

	
	var area_nueva = $("#area_nueva");
	var frase_nueva = $("#frase_nueva");
	var id_area_select = $("#id_area_select");
	//var id_area_select = 2;
	var frase_nueva_esp = $("#frase_nueva_esp");
	var frase_nueva_tzo = $("#frase_nueva_tzo");

	var frase_nueva_esp_aus2 = $("#frase_nueva_esp_aus2");
	var frase_nueva_tzo_aus2 = $("#frase_nueva_tzo_aus2");

	var frase_nueva_esp_aus3 = $("#frase_nueva_esp_aus3");
	var frase_nueva_tzo_aus3 = $("#frase_nueva_tzo_aus3");

	var id_area_usuario = $("#id_area_usuario");
	var usuario_nuevo = $("#usuario_nuevo");
	var usuario_pass = $("#usuario_pass");

	//-------------------------------------------------------------------

	var id_area_select_aus = $("#id_area_select_aus");
	var id_area_select_aus2 = $("#id_area_select_aus2");
	var id_area_select_aus3 = $("#id_area_select_aus3");
	var id_aus1 = $("#id_aus1");
	var id_aus2 = $("#id_aus2");
	var id_aus3 = $("#id_aus3");
	//var id_area_select = 2;
	var frase_nueva_esp_aus = $("#frase_nueva_esp_aus");
	var frase_nueva_tzo_aus = $("#frase_nueva_tzo_aus");

	//console.log(id_area_select.val());


/*var elminar_registros = function() {
		alert("YOLO");
	}*/

//--------------------------   Listar áreas --------------------------------------
function listar_areas_js () {
	$.ajax({
	type: "POST",
	url: "app/model/model.php",
	data: {"tipo":"listar_areas"}
	}).done(function (info){
	//console.log(info);
	$(".lista_areas").html(info);
	});
}

function listar_usuarios_js () {
	$.ajax({
	type: "POST",
	url: "app/model/model.php",
	data: {"tipo":"listar_usuarios"}
	}).done(function (info){
	//console.log(info);
	$(".lista_usuarios").html(info);
	});
}

function listar_preguntas_js () {
	$.ajax({
	type: "POST",
	url: "app/model/model.php",
	//url: '../../correos/app/model.php',
	data: {"tipo":"listar_frases", "tipo_frase": "p", "id_area": id_area_select.val()}
	}).done(function (info){
	console.log(info);
	$("#listar_preguntas").html(info);
	});
}

function listar_aus_js () {
	$.ajax({
	type: "POST",
	url: "app/model/model.php",
	//url: '../../correos/app/model.php',
	data: {"tipo":"listar_frases", "tipo_frase": "a", "id_area": id_area_select_aus.val()}
	}).done(function (info){
	console.log(info);
	$("#listar_aus").html(info);
	});
}

function listar_aus_M_js () {
	$.ajax({
	type: "POST",
	url: "app/model/model.php",
	//url: '../../correos/app/model.php',
	data: {"tipo":"listar_frasesM", "tipo_frase": "a", "id_area": id_area_select_aus2.val(), "frases_id": id_aus1.val()}
	}).done(function (info){
	console.log(info);
	$("#listar_aus2").html(info);
	});
}

function listar_aus_M3_js () {
	$.ajax({
	type: "POST",
	url: "app/model/model.php",
	//url: '../../correos/app/model.php',
	data: {"tipo":"listar_frasesM", "tipo_frase": "a", "id_area": id_area_select_aus3.val(), "frases_id": id_aus3.val()}
	}).done(function (info){
	console.log(info);
	$("#listar_aus3").html(info);
	});
}

	listar_areas_js();
	listar_preguntas_js();
	listar_usuarios_js();

$("#id_area_select").change(function(event) {
	listar_preguntas_js();
});

$("#id_area_select_aus").change(function(event) {
	listar_aus_js();
});

$("#id_aus1").change(function(event) {
	listar_aus_M_js();
});

$("#id_aus3").change(function(event) {
	listar_aus_M3_js();
});

//------------------------------- Listar auscultación nivel 1 ---------------------------

	$("#id_area_select_aus2").change(function(event) {
		$.ajax({
		url: 'app/model/model.php',
		//url: '../../correos/app/model.php',
		type: 'POST',
		data: {"tipo": 'listar_multi1', "id_area": id_area_select_aus2.val()},
		})
		.done(function( info ) {
			//console.log("success");
			console.log(info);
			$("#id_aus1").html(info);
		});

	});

	$("#id_area_select_aus3").change(function(event) {
		$.ajax({
		url: 'app/model/model.php',
		//url: '../../correos/app/model.php',
		type: 'POST',
		data: {"tipo": 'listar_multi1', "id_area": id_area_select_aus3.val()},
		})
		.done(function( info ) {
			//console.log("success");
			console.log(info);
			$("#id_aus2").html(info);
		});

	});

	$("#id_aus2").change(function(event) {
		$.ajax({
		url: 'app/model/model.php',
		//url: '../../correos/app/model.php',
		type: 'POST',
		data: {"tipo": 'listar_multiN', "id_area": id_area_select_aus3.val(), "id_frase": id_aus2.val()},
		})
		.done(function( info ) {
			//console.log("success");
			console.log(info);
			$("#id_aus3").html(info);
		});

	});

	/*$("#id_aus3").change(function(event) {
		$.ajax({
		url: 'app/model/model.php',
		//url: '../../correos/app/model.php',
		type: 'POST',
		data: {"tipo": 'listar_multiN', "id_area": id_area_select_aus3.val(), "id_frase": id_aus3.val()},
		})
		.done(function( info ) {
			//console.log("success");
			console.log(info);
			$("#id_aus3").html(info);
		});

	});*/




	//setInterval("listar_areas()", 2000);

//------------------------------------- Listar áreas en el select ------------------------------
$.ajax({
		type: "POST",
		url: "app/model/model.php",
		data: {"tipo":"listar_areas_select"}
	}).done(function (info){
		//console.log(info);
		$("#id_area_select").html(info);
		$("#id_area_select_aus").html(info);
		$("#id_area_select_aus2").html(info);
		$("#id_area_select_aus3").html(info);
		$("#id_area_usuario").html(info);
	});

//------------------------------------ Agregar nueva área ---------------------------------------

	$("#btnareanueva").on("click", function (event){
		event.preventDefault();
		$.ajax({
			type: "POST",
			url: "app/model/model.php",
			data: {"tipo":"agregar_area","nombre_area":area_nueva.val()}
		}).done(function (info){
			alert(info);
			$("#area_nueva").val("");
			//window.location = "/tzotzil/";
			listar_areas_js();
		});
	});


//------------------------------------ Agregar nuevo usuario ---------------------------------------

	$("#btnusuarionuevo").on("click", function (event){
		event.preventDefault();
		$.ajax({
			type: "POST",
			url: "app/model/model.php",
			data: {"tipo":"agregar_usuario","usuario":usuario_nuevo.val(), "pass":usuario_pass.val(), "id_area": id_area_usuario.val()}
		}).done(function (info){
			alert(info);
			$("#usuario_nuevo").val("");
			$("#usuario_pass").val("");
			listar_usuarios_js();
			//window.location = "/tzotzil/";
		});
	});

//---------------------------------- Agregar nueva pregunta protocolarias -----------------------------
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
			listar_preguntas_js();
			//console.log(info);
			//window.location = "/tzotzil/";
		});
	});

//--------------------------------- Agregar nueva auscultación nivel 1 ---------------------------------------

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
			listar_aus_js();
			//console.log(info);
			//window.location = "/tzotzil/";
		});
	});

	
	//--------------------------------- Agregar nueva auscultación nivel 2 ---------------------------------------

	$("#btnbtnuevaa2").on("click", function (event){
		event.preventDefault();
		$.ajax({
			type: "POST",
			url: "app/model/model.php",
			data: {"tipo":"agregar_multi", "id_area_select":id_area_select_aus2.val(),"frase_nueva_esp":frase_nueva_esp_aus2.val(),"frase_nueva_tzo":frase_nueva_tzo_aus2.val(), "tipo_frase":"a", "id_frase": id_aus1.val()}
		}).done(function (info){
			alert(info);
			console.log(info);
			$("#frase_nueva_esp_aus2").val("");
			$("#frase_nueva_tzo_aus2").val("");
			
			//console.log(info);
			//window.location = "/tzotzil/";
		});
	});

	//--------------------------------- Agregar nueva auscultación nivel 3 ---------------------------------------

	$("#btnbtnuevaa3").on("click", function (event){
		event.preventDefault();
		$.ajax({
			type: "POST",
			url: "app/model/model.php",
			data: {"tipo":"agregar_multi", "id_area_select":id_area_select_aus3.val(),"frase_nueva_esp":frase_nueva_esp_aus3.val(),"frase_nueva_tzo":frase_nueva_tzo_aus3.val(), "tipo_frase":"a", "id_frase": id_aus3.val()}
		}).done(function (info){
			alert(info);
			console.log(info);
			$("#frase_nueva_esp_aus3").val("");
			$("#frase_nueva_tzo_aus3").val("");
			
			//console.log(info);
			//window.location = "/tzotzil/";
		});
	});


})();