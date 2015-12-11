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
			session_start();
			echo $_SESSION["area"];
			if (isset($_SESSION["conectado"])) {
				include("app/view/contenido.html");
			} else
				header('Location: /tzotzil/');
		}
		//vista para lo errores u horrores
		public function error(){
			session_start();
			if (isset($_SESSION["conectado"])) {
				include("app/view/404.shtml");
			} else
				header('Location: /tzotzil/');
		}
	}
 ?>