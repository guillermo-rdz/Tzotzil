<?php 

	require_once "app/model/model.php";

	class controller{
		// Views
		public function home(){
			include("app/view/home.html");
		}
		//vista para lo errores u horrores
		public function error(){
			//include("app/view/error404.html");
		}
	}
 ?>