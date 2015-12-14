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
					"var nombre_area='".$_SESSION["area"]."';".
					"var id_area='".$_SESSION["id_area"]."';".
				"</script>";
			if (isset($_SESSION["conectado"])) {
				include("app/view/contenido.html");
			} else
				header('Location: /tzotzil/');
		}
		public function panel2(){
			session_start();
			echo "<script>".
					"var nombre_area='".$_SESSION["area"]."';".
					"var id_area='".$_SESSION["id_area"]."';".
				"</script>";
			if (isset($_SESSION["conectado"])) {
				include("app/view/auscultacion.html");
			} else
				header('Location: /tzotzil/');
		}
		public function panel3(){
			session_start();
			echo "<script>".
					"var nombre_area='".$_SESSION["area"]."';".
					"var id_area='".$_SESSION["id_area"]."';".
				"</script>";
			if (isset($_SESSION["conectado"])) {
				include("app/view/diagnostico.html");
			} else
				header('Location: /tzotzil/');
		}
		public function panel_admin(){
			session_start();
			echo "<script>".
					"var sesion_rango='".$_SESSION["nombre_rango"]."';".
					"var nombre_area='".$_SESSION["area"]."';".
					"var id_area='".$_SESSION["id_area"]."';".
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