<?php 
class conexion{
	protected $mysqli;
	public function __construct(){
		$this->mysqli = new mysqli("localhost","root","Php1038","base_tr");
		//$this->mysqli = new mysqli("nombre_host","usuario_host","password_host","nombre_de_BD");

		if ($this->mysqli->connect_errno) {
			echo "Falló conexión con servidor MySQL, llamar a su proveedor de base de datos ".
			$this->mysqli->connect_error;
			return;
		}

		$this->mysqli->set_charset("utf-8");
	}
}
 ?>