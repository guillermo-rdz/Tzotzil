<?php 
	require "app/controller/controller.php";
	$mvc = new controller();

	if (empty($_GET['action'])) {
		$_GET['action'] = "home";
		$mvc->welcome();
	}
<<<<<<< HEAD
	if ($_GET["action"]=="home") {
=======
	
	else if ($_GET["action"]=="home") {
>>>>>>> origin/master
		$mvc->home();
	}
	else
		$mvc->error();
?>