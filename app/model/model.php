<?php 
	require_once "conexion.php";

	class model extends conexion{
		//llamamos el constructor de la clase conexion
		public function _construct(){
			parent:: _construct();
		}

		//funciones publicas y privadas...

		//Función para preguntas protocolarias
		public function preguntas_p(){
			$datos = array();

			$query = $this->mysqli->query("SELECT frase_tzo, frase_esp FROM frases;");


			while ($row = $query->fetch_array()) {
				/*$frase_esp = $row['frase_esp'];
				$frase_tzo = $row['frase_tzo'];*/

				$datos[] = array("frase_esp"=>$row["frase_esp"], "frase_tzo"=>$row["frase_tzo"]);
				echo $row["frase_esp"]."<br>";
			}

			$this->mysqli->close();

			$datos_json = json_encode($datos);
			var_dump($datos);
			echo $datos_json;
		}
	}

	
	//Para ver si jala XD
	/*$instance = new model();

	$instance->preguntas_p();*/

 ?>