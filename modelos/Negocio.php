<?php 
//incluir la conexion de base de datos
require "../configuraciones/Conexion.php";
class Negocio{


	//implementamos nuestro constructor
public function __construct(){

}



//listar registros
public function listar(){
	$sql="SELECT * FROM datos_negocio";
	return ejecutarConsulta($sql);
}



}

 ?>
