(function (){
	$(".titulo__contenido").html(nombre_area);
	/*
	alert(id_area);
	alert(nombre_area);

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
		$(".preguntas_p").html(info);
	});


	//Primer contenido	
	$.ajax({
		type: "POST",
		url: "app/model/model.php",
		dataType: "json",
		data: {"tipo":"multi1","id_area":id_area}
	}).done(function (info){
		for(i=0;i<info.length;i++){
			$(".lista__panel1").append("<li class='item-"+info[i].id_frase+"-li_"+(i+1)+"'></li>");
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
				evento.preventDefault();
		    	segundoPanel(this);
		    });
		}
	});
	// Termina primer contenido
	
	//Segundo contenido
	function segundoPanel(valor){
		$(".panel_b").fadeIn(2000);
		var obtener=$(valor).attr("class"),id=obtener.split("-");
		$.ajax({
			type:"POST",
			url:"app/model/model.php",
			dataType: "json",
			data: {"tipo":"multiN","id_area":id_area,"id_frase":id[1]}
		}).done(function (info){
			for(i=0;i<info.length;i++){
				$(".lista__panel2").append("<li class='item2-"+info[i].id_frase+"-li_"+(i+1)+"'></li>");
				$(".item2-"+info[i].id_frase+"-li_"+(i+1)).append("<div class=\"row f_esp\">"+info[i].frase_esp+"</div>");
				$(".item2-"+info[i].id_frase+"-li_"+(i+1)).append("<div class=\"row f_tzo\">"+info[i].frase_tzo+"</div>");
				//estilos
				$(".item2-"+info[i].id_frase+"-li_"+(i+1)).css("padding","10px 40px");
				$(".item2-"+info[i].id_frase+"-li_"+(i+1)).hover(function(){
			        $(this).css({"background-color":"#eee","transition":".7s"});
			        }, function(){
			        $(this).css({"background-color":"white","transition":".7s"});
			    });
				//evento
			    $(".item2-"+info[i].id_frase+"-li_"+(i+1)).on("click",function(evento){
					evento.preventDefault();
			    	tercerPanel(this);
			    });
			}
			/*
			*/
		});
	}
	//Termina segundo contenido

	//Tercer contenido
	function tercerPanel(data){
		$(".panel_c").fadeIn(2000);
		var obtener=$(data).attr("class"),id=obtener.split("-");
		$.ajax({
			type:"POST",
			url:"app/model/model.php",
			dataType: "json",
			data: {"tipo":"multiN","id_area":id_area,"id_frase":id[1]}
		}).done(function (info){
			for(i=0;i<info.length;i++){
				$(".lista__panel3").append("<li class='item3-"+info[i].id_frase+"-li_"+(i+1)+"'></li>");
				$(".item3-"+info[i].id_frase+"-li_"+(i+1)).append("<div class=\"row f_esp\">"+info[i].frase_esp+"</div>");
				$(".item3-"+info[i].id_frase+"-li_"+(i+1)).append("<div class=\"row f_tzo\">"+info[i].frase_tzo+"</div>");
				//estilos
				$(".item3-"+info[i].id_frase+"-li_"+(i+1)).css("padding","10px 40px");
				$(".item3-"+info[i].id_frase+"-li_"+(i+1)).hover(function(){
			        $(this).css({"background-color":"#eee","transition":".7s"});
			        }, function(){
			        $(this).css({"background-color":"white","transition":".7s"});
			    });
			}
			/*
			*/
		});
	}
	//Termina tercer contenido


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