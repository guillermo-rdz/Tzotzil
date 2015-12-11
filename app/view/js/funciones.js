(function (){
	var name_area = '<?php echo $_SESSION[\"area\"] ?>';
	alert(name_area);

	/*
	$.ajax({
		type: "POST",
		url: "app/model/model.php",
		data: {"tipo":"preguntas_p","id_area":2}
	}).done(function (info){
		$(".preguntas_p").html(info);
	});
	*/
})();