(function (){
	/*
	$.ajax({
		type: "POST",
		url: "app/model/model.php",
		data: {"tipo":"preguntas_p","id_area":2}
	}).done(function (info){
		$(".preguntas_p").html(info);
	});
	*/
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