<?php 
	require_once "conexion.php";

	class model extends conexion{
		//llamamos el constructor de la clase conexion
		public function _construct(){
			parent:: _construct();
		}

		//funciones publicas y privadas...

		//Función para preguntas protocolarias
		public function preguntas_prot(){
			$query = $this->mysqli->query("SELECT frases_esp.frase_esp, frases_tzo.frase_tzo FROM frases_esp, frases_tzo WHERE id_frase_esp = frases_esp_id_frase_esp AND areas_id_area = 1;");


			while ($row = $query->fetch_array()) {
				echo $row['frase_esp']."---------".$row['frase_tzo']."<br>";
			}
		}
	}

	/*
	Para ver si jala XD
	$instance = new model();

	$instance->preguntas_prot();*/

 ?>