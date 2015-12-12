<?php 
	require "app/controller/controller.php";
	$mvc = new controller();

	if (empty($_GET['action'])) {
		$_GET['action'] = "home";
	}
	if ($_GET["action"]=="home") {
		$mvc->home();
	}
	elseif($_GET['action']=="login"){
		$mvc->pageLogin();
	}
	elseif($_GET['action']=="contenido"){
		$mvc->content();
	}
	elseif($_GET['action']=="auscultacion"){
		$mvc->panel2();
	}
	elseif($_GET['action']=="diagnostico"){
		$mvc->panel3();
	}
	elseif($_GET['action']=="panel"){
		$mvc->panel_admin();
	}
	else
		$mvc->error();
?>