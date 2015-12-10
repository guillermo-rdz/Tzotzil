<?php 
	require_once "conexion.php";

	class model extends conexion{
		//llamamos el constructor de la clase conexion
		public function _construct(){
			parent:: _construct();
		}

		//funciones publicas y privadas...

		//Función para preguntas protocolarias

		public function login(){
			$usuario = $_POST['usuario'];
			$pass = $_POST['pass'];

			$query = $this->mysqli->query("SELECT usuario, pass FROM usuarios WHERE usuario='$usuario', '$pass'");
			//para que no te confundas
			$area_id = $this->mysqli->query("SELECT area_id_area FROM usuarios WHERE usuario='$usuario', '$pass'");
			if ($query->num_rows()>0) {
				$_SESSION['area_id']=$area_id;
				$_SESSION['usuario']=$usuario;
			//supongo que te va a servir XD
				header(string);
			}
		}

		public function preguntas_p(){
			//Dependiendo de la vista mandas el id del area
			$id_area = $_POST['id_area'];
			//$id_area = 2;
			$datos = array();

			$query = $this->mysqli->query("SELECT frase_esp, frase_tzo FROM frases WHERE tipo_frase='p' AND areas_id_area='$id_area'");
			//"SELECT frase_esp, frase_tzo FROM frases WHERE tipo_frase='p' AND areas_id_area='$id_area';"


			echo "<table><tbody>";
			while ($row = $query->fetch_array()) {

				//$datos[] = array("frase_esp"=>$row["frase_esp"],"frase_tzo"=>$row["frase_tzo"]);

				//--------------------------------------------------Dale estilo a la tabla------------------------------------------------
				echo "<tr data-fila>";
				echo "<td>".$row["frase_esp"]."</td>"."<td>".$row["frase_tzo"]."</td>";
				echo "</tr>";
			}
			echo "</tbody></table>";

			$this->mysqli->close();

			/*$datos_json = json_encode($datos);
			var_dump($datos);
			echo $datos_json;*/
		}

		//Agregar areas
		public function agregar_areas(){
			//cambiar por el valor que viene de la vista
			$nombre_area = $_POST['nombre_area'];

			if ($this->mysqli->query("INSERT INTO areas VALUES (default, '$area', 'n')")) {
				echo "Se ingreso el área";
			}
			else{
				echo "Error al ingresar el área";

			}

			$this->mysqli->close();
		}

		public function listar_areas(){
			$id_area = $_POST['id_area'];
			$datos = array();

			$query = $this->mysqli->query("SELECT area FROM areas WHERE rango='n' AND id_area='$id_area'");

			while ($row = $query->fetch_array()) {
				echo $row['area']."<br>";
			}
		}

		public function agregar_preguntas(){
			//Cambiar por los valores que vienen de la vista
			$id_area = 2;
			$tipo = ""; // "p" preguntas protocolarias "a" ausculcación
			$frase_esp = "";
			$frase_tzo = "";

			if ($this->mysqli->query("INSERT INTO frases VALUES (default, '$frase_esp', '$frase_tzo', 'p', '$id_area')")) {
				$datos = array("mensaje"=>"Los datos se ingresaron correctamente");
				$datos_json = json_encode($datos);
				echo $datos_json;
			}
			else{
				$datos = array("mensaje"=>"Error al ingresar los datos");
				$datos_array = json_encode($datos);
				echo $datos_array;

			}

			$this->mysqli->close();

		}

		public function agregar_auscultacion_2_3(){
			//Cambiar por los valores que vienen de la vista
			$id_area = 2;
			$frase_esp = "";
			$frase_tzo = "";
			$id_frase = 4; //El id de la frase a la que se relaciona

			if ($this->mysqli->query("INSERT INTO frases VALUES (default, '$frase_esp', '$frase_tzo', 'a', '$id_area')")) {
				$datos = array("mensaje"=>"Los datos se ingresaron correctamente");
				$datos_json = json_encode($datos);
				echo $datos_json;
			}
			else{
				$datos = array("mensaje"=>"Error al ingresar los datos");
				$datos_array = json_encode($datos);
				echo $datos_array;

			}

			$this->mysqli->close();
		}
	}

	
	//Para ver si jala XD
	$instance = new model();

	if ($_POST['tipo']=="preguntas_p") {
		$instance->preguntas_p();

	}
	else{
		echo "Error...";
	}

 ?>