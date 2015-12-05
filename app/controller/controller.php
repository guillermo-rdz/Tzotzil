<?php 

	require_once "app/model/model.php";

	class controller{
		// Views
		public function home(){
			include("app/views/XXX.html");
		}

		public function welcome(){
			include("app/views/welcome.html");	
		}
		//vista para lo errores u horrores
		public function error(){
			include("app/vista/error404.html");
		}
	}
 ?>