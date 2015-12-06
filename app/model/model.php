<?php 
	require_once "conexion.php";

	class model extends conexion{
		//llamamos el constructor de la clase conexion
		public function _construct(){
			parent:: _construct();
		}

		//funciones publicas y privadas...
		public function login(){
			//ejemplo de llamar al objeto del constructor que extiende de la clase conexion
			// $this->$mysqli->query("consulta");
		}
	}

 ?>