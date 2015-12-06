<?php 
	require "app/controller/controller.php";
	$mvc = new controller();

	if (empty($_GET['action'])) {
		$_GET['action'] = "home";
	}
	} else if ($_GET["action"]=="home") {
		$mvc->home();
	}
	else
		$mvc->error();
?>