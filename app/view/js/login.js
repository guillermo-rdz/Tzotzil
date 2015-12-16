(function (){
	/*
	$(".formulario").hide();
	$("#login").on("click", function (){
		$(".formulario").show();
	});
	*/

	$.ajaxSetup({"cache": false });

	var btnSubmit = $("#btningresar");
	var user = $("#user");
	var pass = $("#pass");

	$( btnSubmit ).on("click", comprobar);

	function comprobar(event){

		event.preventDefault();
		$.ajax({
			type: "POST",
			url: "app/model/model.php",
			dataType: "json",
			data: {"tipo":"login","usuario":user.val(), "pass":pass.val()}
		}).done(function (info){
			//console.log(info);
			var parte1="<div id='mensaje_error' class='alert alert-warning alert-dismissible' role='alert'>";
			var parte2="<button type='button' class='close' data-dismiss='alert' aria-label='Close'>";
			var parte3="<span aria-hidden='true'>&times;</span></button><strong>"+info.mensaje+"</strong></div>";
			if (info.validate == "true") {
				$(".error").html(parte1+parte2+parte3).fadeIn();
				user.val("");
				pass.val("");
				if(info.rango=="a"){
					setTimeout(function (){window.location = "panel";},1500);
				} else{
					setTimeout(function (){window.location = "contenido";},2000);
				}
			} else {
				$(".error").html(parte1+parte2+parte3).fadeIn();
				user.val("");
				pass.val("");
			}

		});
	}


})();