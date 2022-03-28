<?php 
//incluir la conexion de base de datos
require "../configuraciones/Conexion.php";
class Venta{


	//implementamos nuestro constructor
public function __construct(){

}

//metodo insertar registro
public function insertar($idcliente,$idpersonal,$tipo_comprobante,$serie_comprobante,$num_comprobante,$fecha_hora,$impuesto,$total_venta,$tipopago,$formapago,$nroOperacion,$fechaDepostivo,$porcentaje,$totalrecibido,$vuelto,$idproducto,$cantidad,$precio_venta,$descuento,$fechaOperacion,$montoDeuda,$montoPagado){

	$sql="INSERT INTO venta (idcliente,idpersonal,tipo_comprobante,serie_comprobante,num_comprobante,fecha_hora,impuesto,total_venta,ventacredito,formapago,numoperacion,fechadeposito,
	descuento,totalrecibido,vuelto,estado) VALUES 
	('$idcliente','$idpersonal','$tipo_comprobante','$serie_comprobante','$num_comprobante','$fecha_hora','$impuesto','$total_venta','$tipopago','$formapago','$nroOperacion','$fechaDepostivo','$porcentaje','$totalrecibido','$vuelto','Aceptado')";

	 $idventanew=ejecutarConsulta_retornarID($sql);
	 $num_elementos=0;
	 $sw=true;
	 while ($num_elementos < count($idproducto)) {

	 	$sql_detalle="INSERT INTO detalle_venta (idventa,idproducto,cantidad,precio_venta,descuento) VALUES('$idventanew','$idproducto[$num_elementos]','$cantidad[$num_elementos]','$precio_venta[$num_elementos]','$descuento[$num_elementos]')";

	 	ejecutarConsulta($sql_detalle) or $sw=false;

	 	$num_elementos=$num_elementos+1;

	 }

	 if ($tipopago == 'Si') {

	 	$sql2 = "INSERT INTO cuentas_por_cobrar (idventa, fecharegistro, deudatotal, fechavencimiento, abonototal) VALUES ('$idventanew','$fecha_hora','$montoDeuda','$fechaOperacion',0)";

	 	$idcpcnew = ejecutarConsulta_retornarID($sql2);

	 	if ($montoPagado > 0) {

	 		$sql_detalle2 = "INSERT INTO detalle_cuentas_por_cobrar (idcpc, montopagado, observacion) VALUES ('$idcpcnew','$montoPagado', '')";

	 		ejecutarConsulta($sql_detalle2);

	 	}
	 	
	 }

	 return $sw;
}

public function anular($idventa){
	$sql="UPDATE venta SET estado='Anulado' WHERE idventa='$idventa'";
	ejecutarConsulta($sql);

	$sql1="UPDATE cuentas_por_cobrar SET condicion='0' WHERE idventa='$idventa'";
	return ejecutarConsulta($sql1);
}


//implementar un metodopara mostrar los datos de unregistro a modificar
public function mostrar($idventa){
	$sql="SELECT v.idventa,DATE(v.fecha_hora) as fecha,v.idcliente,p.nombre as cliente,u.idpersonal,u.nombre as personal, v.tipo_comprobante,v.serie_comprobante,v.num_comprobante,v.total_venta,v.impuesto,v.formapago, v.numoperacion,v.estado FROM venta v INNER JOIN persona p ON v.idcliente=p.idpersona INNER JOIN personal u ON v.idpersonal=u.idpersonal WHERE idventa='$idventa'";
	return ejecutarConsultaSimpleFila($sql);
}

public function mostrardetalle($idventa){
	$sql="SELECT dv.idventa,dv.idproducto,a.nombre,dv.cantidad,dv.precio_venta,dv.descuento,(dv.cantidad*dv.precio_venta-dv.descuento) as subtotal, v.total_venta, v.impuesto, p.nombre as cliente, v.num_comprobante FROM detalle_venta dv INNER JOIN producto a ON dv.idproducto=a.idproducto INNER JOIN venta v ON v.idventa=dv.idventa INNER JOIN persona p ON v.idcliente=p.idpersona WHERE dv.idventa='$idventa'";
	return ejecutarConsulta($sql);
}

public function listarDetalle($idventa){
	$sql="SELECT dv.idventa,dv.idproducto,a.nombre,dv.cantidad,dv.precio_venta,dv.descuento,(dv.cantidad*dv.precio_venta-dv.descuento) as subtotal, v.total_venta, v.impuesto FROM detalle_venta dv INNER JOIN producto a ON dv.idproducto=a.idproducto INNER JOIN venta v ON v.idventa=dv.idventa WHERE dv.idventa='$idventa'";
	return ejecutarConsulta($sql);
}

//listar registros
public function listar(){
	$sql="SELECT v.idventa,DATE(v.fecha_hora) as fecha,v.idcliente,p.nombre as cliente,u.idpersonal,u.nombre as personal, v.tipo_comprobante,v.serie_comprobante,v.num_comprobante,v.total_venta,v.ventacredito,v.impuesto,v.estado FROM venta v INNER JOIN persona p ON v.idcliente=p.idpersona INNER JOIN personal u ON v.idpersonal=u.idpersonal ORDER BY v.idventa DESC";
	return ejecutarConsulta($sql);
}


public function ventacabecera($idventa){
	$sql= "SELECT v.idventa, v.idcliente, p.nombre AS cliente, p.direccion, p.tipo_documento, p.num_documento, p.email, p.telefono, v.idpersonal, u.nombre AS personal, v.tipo_comprobante, v.serie_comprobante, v.num_comprobante, DATE(v.fecha_hora) AS fecha, v.impuesto, v.total_venta FROM venta v INNER JOIN persona p ON v.idcliente=p.idpersona INNER JOIN personal u ON v.idpersonal=u.idpersonal WHERE v.idventa='$idventa'";
	return ejecutarConsulta($sql);
}

public function ventadetalle($idventa){
	$sql="SELECT a.nombre AS producto, a.codigo, d.cantidad, d.precio_venta, d.descuento, (d.cantidad*d.precio_venta-d.descuento) AS subtotal FROM detalle_venta d INNER JOIN producto a ON d.idproducto=a.idproducto WHERE d.idventa='$idventa'";
         return ejecutarConsulta($sql);
}

//funcion para selecciolnar el numero de factura
public function numero_venta(){
		 
		    $sql="SELECT num_comprobante FROM venta WHERE tipo_comprobante='Factura' ORDER BY idventa DESC limit 1 ";
 			return ejecutarConsulta($sql);
		  
}

//funcion para seleccionar la serie de la factura
public function numero_serie(){
		 
		    $sql="SELECT serie_comprobante ,num_comprobante FROM venta WHERE tipo_comprobante='Factura' ORDER BY idventa DESC limit 1";

return ejecutarConsulta($sql);
}

//funcion para selecciolnar el numero de boleta
public function numero_venta_boleta(){
		 
		    $sql="SELECT num_comprobante FROM venta WHERE tipo_comprobante='Boleta' ORDER BY idventa DESC limit 1 ";
 			return ejecutarConsulta($sql);
		  
}
//funcion para seleccionar la serie de la boleta
public function numero_serie_boleta(){
		 
		    $sql="SELECT serie_comprobante ,num_comprobante FROM venta WHERE tipo_comprobante='Boleta' ORDER BY idventa DESC limit 1";

return ejecutarConsulta($sql);
}

//funcion para selecciolnar el numero de ticket
public function numero_venta_ticket(){
		 
		    $sql="SELECT num_comprobante FROM venta WHERE tipo_comprobante='Ticket' ORDER BY idventa DESC limit 1 ";
 			return ejecutarConsulta($sql);
		  
}
//funcion para seleccionar la serie de la ticket
public function numero_serie_ticket(){
		 
		    $sql="SELECT serie_comprobante ,num_comprobante FROM venta WHERE tipo_comprobante='Ticket' ORDER BY idventa DESC limit 1";

return ejecutarConsulta($sql);
}

public function buscarProducto($codigo)
{
	$sql="SELECT * FROM producto WHERE codigo='$codigo'";
	return ejecutarConsultaSimpleFila($sql);
}


}

 ?>
