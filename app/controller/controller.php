<?php 


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
			echo "<script>".
					"var sesion_rango='".$_SESSION["nombre_rango"]."';".
					"var sesion_area='".$_SESSION["area"]."';".
				"</script>";
			if (isset($_SESSION["conectado"])) {
				include("app/view/contenido.html");
			} else
				header('Location: /tzotzil/');
		}
		public function panel_admin(){
			session_start();
			echo "<script>".
					"var sesion_rango='".$_SESSION["nombre_rango"]."';".
					"var sesion_area='".$_SESSION["area"]."';".
				"</script>";
			if((isset($_SESSION["conectado"])) && ($_SESSION['nombre_rango']=="a")){
				include("app/view/panel_admin.html");
			} else {
				include("app/view/no_admin.html");
			}
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