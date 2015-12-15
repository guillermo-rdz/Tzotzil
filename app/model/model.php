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
			$usuario = trim(htmlentities($_POST['usuario']));
			$pass = trim(htmlentities($_POST['pass']));
			
			$usuario = $this->mysqli->real_escape_string($usuario);
			$pass = $this->mysqli->real_escape_string($pass);

			$query = $this->mysqli->query("SELECT usuario,pass, area_id_area, area,a.rango AS nombre_rango
									FROM usuarios u, areas a 
									WHERE usuario='$usuario' and pass='$pass' and id_area=area_id_area");
			$row = $query->fetch_array();

			if ($query->num_rows == 1) {
				session_start();
				$_SESSION['nombre_rango']=$row['nombre_rango'];
				$_SESSION['area']=utf8_encode($row['area']);
				$_SESSION['conectado']=true;
				$_SESSION['id_area']=$row['area_id_area'];
				//------------------------------------Aquí-------------------------------y Aquí
				$datos=array("mensaje"=>"Bienvenido: ".utf8_encode($usuario)." del area de: ".utf8_encode($row['area']),"validate"=>"true");
				$datos=json_encode($datos);
				echo $datos;
			} else {
				$datos=array("mensaje"=>"Tu usuario y contraseña no existen","validate"=>"false");
				$datos=json_encode($datos);
				echo $datos;
			}

			$this->mysqli->close();
		}

		public function logout(){
			session_start();
			session_unset();
			session_destroy();

			echo "Desconexión finalizada :(";
		}

		public function preguntas_p(){
			//Dependiendo de la vista mandas el id del area
			$area = utf8_decode($_POST['area']);
			$tipo_frase = $_POST['tipo_frase'];
			//$id_area = 2;
			$datos = array();

			$query = $this->mysqli->query("SELECT frase_esp, frase_tzo FROM frases, areas WHERE tipo_frase='$tipo_frase' 
							AND area='$area' AND id_area=areas_id_area");
			//"SELECT frase_esp, frase_tzo FROM frases WHERE tipo_frase='p' AND areas_id_area='$id_area';"


			echo "<table><tbody>";
			while ($row = $query->fetch_array()) {

				//$datos[] = array("frase_esp"=>$row["frase_esp"],"frase_tzo"=>$row["frase_tzo"]);

				//--------------------------------------------------Dale estilo a la tabla------------------------------------------------
				echo "<tr data-fila>";
				echo "<td>".utf8_encode($row["frase_esp"])."</td>"."<td>".utf8_encode($row["frase_tzo"])."</td>";
				echo "</tr>";
			}
			echo "</tbody></table>";

			$this->mysqli->close();

			/*$datos_json = json_encode($datos);
			var_dump($datos);
			echo $datos_json;*/
		}

		//Agregar areas
		public function agregar_area(){
			//cambiar por el valor que viene de la vista
			$nombre_area = $_POST['nombre_area'];

			if ($this->mysqli->query("INSERT INTO areas VALUES (default, '$nombre_area', 'n')")) {
				echo "Se ingreso el area";
			}
			else{
				echo "Error al ingresar el área";

			}

			$this->mysqli->close();
		}

		public function agregar_usuario(){
			//cambiar por el valor que viene de la vista
			$usuario = $_POST['usuario'];
			$id_area = $_POST['id_area'];
			$pass = $_POST['pass'];

			if ($this->mysqli->query("INSERT INTO usuarios VALUES (default, '$usuario', '$pass', 2, '$id_area')")) {
				echo "Se ingreso el usuario";
			}
			else{
				echo "Error al ingresar el usuario";

			}

			$this->mysqli->close();
		}

		public function listar_areas(){

			$datos = array();
			$query = $this->mysqli->query("SELECT id_area, area FROM areas WHERE rango='n'");

			echo "<table><tbody>";
			while ($row = $query->fetch_array()) {
				echo "<tr data-fila>";
				echo "<td>".utf8_encode($row['area'])."</td>";
				echo "</tr>";

				$datos[]=array("id_area"=>$row["id_area"], "area"=>utf8_encode($row["area"]));
			}
			echo "</tbody></table>";

			$datos = json_encode($datos);
			//echo $datos;
		}

		public function listar_usuarios(){

			$datos = array();
			$query = $this->mysqli->query("SELECT id_usuario, usuario FROM usuarios WHERE rango=2");

			echo "<table><tbody>";
			while ($row = $query->fetch_array()) {
				echo "<tr data-fila>";
				echo "<td>".utf8_encode($row['usuario'])."</td>";
				echo "</tr>";

				$datos[]=array("id_area"=>$row["id_usuario"], "area"=>utf8_encode($row["usuario"]));
			}
			echo "</tbody></table>";

			$datos = json_encode($datos);
			//echo $datos;
		}

		public function listar_areas_select(){

			$datos = array();
			$query = $this->mysqli->query("SELECT id_area, area FROM areas WHERE rango='n'");

			//echo "<table><tbody>";
			//echo "<select id='id_area_select' name='id_area_select'>";
			while ($row = $query->fetch_array()) {
				echo "<option value=".$row['id_area'].">";
				echo utf8_encode($row['area']);
				echo "</option>";
				$datos[]=array("id_area"=>$row["id_area"], "area"=>utf8_encode($row["area"]));
			}
			//echo "</select>";

			$datos = json_encode($datos);
			//echo $datos;
		}


		public function agregar_pregunta(){
			//Cambiar por los valores que vienen de la vista
			$id_area = $_POST['id_area_select'];
			$tipo_frase = $_POST['tipo_frase']; // "p" preguntas protocolarias "a" ausculcación
			$pregunta_esp = $_POST['frase_nueva_esp'];
			$pregunta_tzo = $_POST['frase_nueva_tzo'];

			/*if ($this->mysqli->query("INSERT INTO frases VALUES (default, '$pregunta_esp', '$pregunta_tzo', '$tipo_frase', '$id_area')")) {
				$datos = array("mensaje"=>"Los datos se ingresaron correctamente");
				$datos_json = json_encode($datos);
				echo $datos_json;
			}
			else{
				$datos = array("mensaje"=>"Error al ingresar los datos");
				$datos_array = json_encode($datos);
				echo $datos_array;

			}*/

			if ($this->mysqli->query("INSERT INTO frases VALUES (default, '$pregunta_esp', '$pregunta_tzo', '$tipo_frase', '$id_area', NULL)")) {
				echo "Se ingreso el registro";
			}
			else{
				echo "Error al ingresar el registro";

			}

			$this->mysqli->close();


		}

		public function agregar_multi(){
			//Cambiar por los valores que vienen de la vista
			$id_area = $_POST['id_area_select'];
			$tipo_frase = $_POST['tipo_frase']; // "p" preguntas protocolarias "a" ausculcación
			$pregunta_esp = $_POST['frase_nueva_esp'];
			$pregunta_tzo = $_POST['frase_nueva_tzo'];
			$id_frase = $_POST['id_frase'];

			if ($this->mysqli->query("INSERT INTO frases VALUES (default, '$pregunta_esp', '$pregunta_tzo', '$tipo_frase', '$id_area', '$id_frase')")) {
				echo "Se ingreso el registro";
			}
			else{
				echo "Error al ingresar el registro";

			}

			$this->mysqli->close();


		}


		public function multi1(){
			$tipo_frase = "a";
			//$tipo_frase = $_POST['tipo_frase'];
			//$id_area = 2;
			$id_area = $_POST['id_area'];
			//$id_frase = 7;
			//$id_frase = $_POST['id_frase'];
			$datos=array();

			$query = $this->mysqli->query("SELECT id_frase, frase_esp, frase_tzo FROM frases WHERE tipo_frase='$tipo_frase' AND areas_id_area = '$id_area' AND frases_id_frase IS NULL");
			//$query = $this->mysqli->query("SELECT id_frase, frase_esp, frase_tzo FROM frases");
			
			while ($row = $query->fetch_assoc()) {
				$datos[]=array("id_frase"=>utf8_encode($row["id_frase"]),
							"frase_esp"=>utf8_encode($row["frase_esp"]),"frase_tzo"=>utf8_encode($row["frase_tzo"]));
			}		

			$this->mysqli->close();

			$datos=json_encode($datos);
			echo $datos;
			//var_dump($datos);
		}

		public function multiN(){
			$tipo_frase = "a";
			//$tipo_frase = $_POST['tipo_frase'];
			//$id_area = 2;
			$id_area = $_POST['id_area'];
			//$id_frase = 7;
			$id_frase = $_POST['id_frase'];
			$datos=array();

			$query = $this->mysqli->query("SELECT id_frase, frase_esp, frase_tzo FROM frases WHERE tipo_frase='$tipo_frase' AND areas_id_area = '$id_area' AND frases_id_frase = '$id_frase'");
			//$query = $this->mysqli->query("SELECT id_frase, frase_esp, frase_tzo FROM frases");
			
			while ($row = $query->fetch_assoc()) {
				$datos[]=array("id_frase"=>utf8_encode($row["id_frase"]),
							"frase_esp"=>utf8_encode($row["frase_esp"]), "frase_tzo"=>utf8_encode($row["frase_tzo"]));
			}		

			$datos=json_encode($datos);
			echo $datos;
			//var_dump($datos);
		}

		public function listar_multi1(){
			$tipo_frase = "a";
			//$tipo_frase = $_POST['tipo_frase'];
			//$id_area = 2;
			$id_area = $_POST['id_area'];
			//$id_area = 2;
			//$id_frase = 7;
			//$id_frase = $_POST['id_frase'];
			$datos=array();

			$query = $this->mysqli->query("SELECT id_frase, frase_esp, frase_tzo FROM frases WHERE tipo_frase='$tipo_frase' AND areas_id_area = '$id_area' AND frases_id_frase IS NULL");
			//$query = $this->mysqli->query("SELECT id_frase, frase_esp, frase_tzo FROM frases");
			
			while ($row = $query->fetch_array()) {
				echo "<option value=".$row['id_frase'].">";
				echo utf8_encode($row['frase_esp']);
				echo "</option>";
				//$datos[]=array("id_area"=>$row["id_area"], "area"=>utf8_encode($row["area"]));
			}	
		}

		public function listar_multiN(){
			$tipo_frase = "a";
			//$tipo_frase = $_POST['tipo_frase'];
			//$id_area = 2;
			$id_area = $_POST['id_area'];
			//$id_area = 2;
			//$id_frase = 7;
			$id_frase = $_POST['id_frase'];
			$datos=array();

			$query = $this->mysqli->query("SELECT id_frase, frase_esp, frase_tzo FROM frases WHERE tipo_frase='$tipo_frase' AND areas_id_area = '$id_area' AND frases_id_frase = '$id_frase' ");
			//$query = $this->mysqli->query("SELECT id_frase, frase_esp, frase_tzo FROM frases");
			
			while ($row = $query->fetch_array()) {
				echo "<option value=".$row['id_frase'].">";
				echo utf8_encode($row['frase_esp']);
				echo "</option>";
				//$datos[]=array("id_area"=>$row["id_area"], "area"=>utf8_encode($row["area"]));
			}	
		}
	}

	
	//Para ver si jala XD
	$instance = new model();
	
	if ($_POST['tipo']=="login") {
		$instance->login();
	}
	else if($_POST['tipo']=="preguntas_p") {
		$instance->preguntas_p();
	}

	else if($_POST['tipo']=="listar_areas") {
		$instance->listar_areas();
	}

	else if($_POST['tipo']=="listar_usuarios") {
		$instance->listar_usuarios();
	}

	else if($_POST['tipo']=="listar_areas_select") {
		$instance->listar_areas_select();
	}

	else if($_POST['tipo']=="agregar_area") {
		$instance->agregar_area();
	}

	else if($_POST['tipo']=="agregar_usuario") {
		$instance->agregar_usuario();
	}

	else if($_POST['tipo']=="agregar_pregunta") {
		$instance->agregar_pregunta();
	}

	else if($_POST['tipo']=="agregar_multi") {
		$instance->agregar_multi();
	}

	elseif ($_POST['tipo']=="logout") {
		$instance->logout();
	}

	elseif ($_POST['tipo']=="multi1") {
		$instance->multi1();
	}

	elseif ($_POST['tipo']=="multiN") {
		$instance->multiN();
	}

	elseif ($_POST['tipo']=="listar_multi1") {
		$instance->listar_multi1();
	}

	elseif ($_POST['tipo']=="listar_multiN") {
		$instance->listar_multiN();
	}

	else{
		echo "Error...";
	}

 ?>