<?php 
		$servidor = "localhost";
		$usuario = "root";
		$pass = "Php1038";
		$bd = "base_tr";

		$conexion = new mysqli($servidor, $usuario, $pass, $bd);

		if($conexion->connect_error){
            echo "Error al conectarse {$conexion->connect_error}";
        }
 ?>