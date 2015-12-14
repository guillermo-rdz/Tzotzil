(function (){
	$(".titulo__contenido").html(nombre_area);
	//alert(id_area);
	//alert(nombre_area);
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


	//Primer contenido	
	$.ajax({
		type: "POST",
		url: "app/model/model.php",
		dataType: "json",
		data: {"tipo":"multi1","id_area":id_area}
	}).done(function (info){
		//console.log(info);
		for(i=0;i<info.length;i++){
			$(".lista__panel1").append("<li class='item-"+info[i].id_frase+"-li_"+(i+1)+" col-md-12'></li>");
			$(".item-"+info[i].id_frase+"-li_"+(i+1)).append("<div class=\"row f_esp\">"+info[i].frase_esp+"</div>");
			$(".item-"+info[i].id_frase+"-li_"+(i+1)).append("<div class=\"row f_tzo\">"+info[i].frase_tzo+"</div>");
			//estilos
			$(".item-"+info[i].id_frase+"-li_"+(i+1)).css("padding","10px 40px");
			$(".item-"+info[i].id_frase+"-li_"+(i+1)).hover(function(){
		        $(this).css({"background-color":"#eee","transition":".7s"});
		        }, function(){
		        $(this).css({"background-color":"white","transition":".7s"});
		    });
			//evento
		    $(".item-"+info[i].id_frase+"-li_"+(i+1)).on("click",function(evento){
		    	console.log(this);
		    	segundoPanel(this, evento);
		    });
		}
	});
	// Termina primer contenido
	function segundoPanel(valor,evento){
		evento.preventDefault();
	}
	//Segundo contenido

	//Termina segundo contenido
	/*
	$("poner boton aqui").click(function(){
        $("div").animate({
            width: 'toggle'
        });
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