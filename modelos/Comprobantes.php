<?php 
//incluir la conexion de base de datos
require "../configuraciones/Conexion.php";
class Comprobantes{

//implementamos nuestro constructor
public function __construct(){

}

public function editar($id_comp_pago,$nombre,$serie_comprobante,$num_comprobante){
	$sql="UPDATE comp_pago SET nombre='$nombre',serie_comprobante='$serie_comprobante',num_comprobante='$num_comprobante' 
	WHERE id_comp_pago='$id_comp_pago'";
	return ejecutarConsulta($sql);
}
public function desactivar($id_comp_pago){
	$sql="UPDATE comp_pago SET condicion='0' WHERE id_comp_pago='$id_comp_pago'";
	return ejecutarConsulta($sql);
}
public function activar($id_comp_pago){
	$sql="UPDATE comp_pago SET condicion='1' WHERE id_comp_pago='$id_comp_pago'";
	return ejecutarConsulta($sql);
}

//metodo para mostrar registros
public function mostrar($id_comp_pago){
	$sql="SELECT * FROM comp_pago WHERE id_comp_pago='$id_comp_pago'";
	return ejecutarConsultaSimpleFila($sql);
}

//listar registros
public function listar(){
	$sql="SELECT * FROM comp_pago";
	return ejecutarConsulta($sql);
}
//listar y mostrar en selct
public function select(){
	$sql="SELECT * FROM comp_pago WHERE condicion=1";
	return ejecutarConsulta($sql);
}
public function mostrar_serie_ticket(){
	$sql="SELECT serie_comprobante, num_comprobante FROM comp_pago WHERE nombre='Nota de Venta'";
	return ejecutarConsulta($sql);
}
public function mostrar_numero_ticket(){
	$sql="SELECT num_comprobante FROM comp_pago WHERE nombre='Nota de Venta'";
	return ejecutarConsulta($sql);
}
public function mostrar_serie_boleta(){
	$sql="SELECT serie_comprobante, num_comprobante FROM comp_pago WHERE nombre='Boleta'";
	return ejecutarConsulta($sql);
}
public function mostrar_numero_boleta(){
	$sql="SELECT num_comprobante FROM comp_pago WHERE nombre='Boleta'";
	return ejecutarConsulta($sql);
}
public function mostrar_serie_factura(){
	$sql="SELECT serie_comprobante, num_comprobante FROM comp_pago WHERE nombre='Factura'";
	return ejecutarConsulta($sql);
}
public function mostrar_numero_factura(){
	$sql="SELECT num_comprobante FROM comp_pago WHERE nombre='Factura'";
	return ejecutarConsulta($sql);
}
}

?>