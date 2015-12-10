<?php 

	//require_once "app/model/model.php";

	class controller{
		// Views
		public function home(){
			include("app/view/home.html");
		}
		public function pageLogin(){
			include("app/view/login.html");
		}
		public function content(){
			include("app/view/contenido.html");
		}
		//vista para lo errores u horrores
		public function error(){
			include("app/view/404.shtml");
		}
	}
 ?>