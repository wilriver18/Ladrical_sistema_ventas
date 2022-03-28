<?php 
//Incluímos inicialmente la conexión a la base de datos
require "../configuraciones/Conexion.php";

Class Consultas
{
	//Implementamos nuestro constructor
	public function __construct()
	{

	}
	public function comprasfecha($fecha_inicio,$fecha_fin)
	{
		$sql="SELECT DATE(i.fecha_hora) as fecha,u.nombre as personal, p.nombre as proveedor,i.tipo_comprobante,i.serie_comprobante,i.num_comprobante,i.total_compra,i.impuesto,i.estado FROM compra i INNER JOIN persona p ON i.idproveedor=p.idpersona INNER JOIN personal u ON i.idpersonal=u.idpersonal WHERE DATE(i.fecha_hora)>='$fecha_inicio' AND DATE(i.fecha_hora)<='$fecha_fin'";
		return ejecutarConsulta($sql);		
	}
	public function ventasfechacliente($fecha_inicio,$fecha_fin,$idcliente)
	{
		$sql="SELECT DATE(v.fecha_hora) as fecha,u.nombre as personal, p.nombre as cliente,v.tipo_comprobante,v.serie_comprobante,v.num_comprobante,v.total_venta,v.impuesto,v.estado FROM venta v INNER JOIN persona p ON v.idcliente=p.idpersona INNER JOIN personal u ON v.idpersonal=u.idpersonal WHERE DATE(v.fecha_hora)>='$fecha_inicio' AND DATE(v.fecha_hora)<='$fecha_fin' AND v.idcliente='$idcliente'";
		return ejecutarConsulta($sql);		
	}

	public function ventasfechavendedor($fecha_inicio,$fecha_fin,$idcliente)
	{
		$sql="SELECT DATE(v.fecha_hora) as fecha,u.nombre as personal, p.nombre as cliente,v.tipo_comprobante,v.serie_comprobante,v.num_comprobante,v.total_venta,v.impuesto,v.estado FROM venta v INNER JOIN persona p ON v.idcliente=p.idpersona INNER JOIN personal u ON v.idpersonal=u.idpersonal WHERE DATE(v.fecha_hora)>='$fecha_inicio' AND DATE(v.fecha_hora)<='$fecha_fin' AND u.idpersonal='$idcliente'";
		return ejecutarConsulta($sql);		
	}

	public function totalcomprahoy()
	{
		$sql="SELECT IFNULL(SUM(total_compra),0) as total_compra FROM compra WHERE DATE(fecha_hora)=curdate()";
		return ejecutarConsulta($sql);
	}

	public function totalventahoy()
	{
		$sql="SELECT IFNULL(SUM(total_venta),0) as total_venta FROM venta WHERE DATE(fecha_hora)=curdate() AND ventacredito = 'No'";
		return ejecutarConsulta($sql);
	}

	public function totalcuentasporcobrar()
	{
		$sql="SELECT IFNULL(SUM(deudatotal - abonototal),0) as totaldeuda FROM cuentas_por_cobrar where condicion=1";
		return ejecutarConsulta($sql);
	}

	public function totalventachoy()
	{
		$sql="SELECT IFNULL(SUM(total_venta),0) as total_ventac FROM venta WHERE DATE(fecha_hora)=curdate() AND ventacredito = 'Si' AND estado != 'Anulado'";
		return ejecutarConsulta($sql);
	}

	public function totalusuariosr()
	{
		$sql="SELECT IFNULL(count(idpersonal),0) as idpersonal FROM personal";
		return ejecutarConsulta($sql);
	}

	public function totalproveedoresr()
	{
		$sql="SELECT IFNULL(count(idpersona),0) as idpersona FROM persona WHERE tipo_persona='Proveedor'";
		return ejecutarConsulta($sql);
	}

	public function comprasultimos_10dias()
	{
		$sql="SELECT CONCAT(DAY(fecha_hora),'-',DATE_FORMAT(fecha_hora,'%M')) as fecha,SUM(total_compra) as total FROM compra GROUP by fecha_hora ORDER BY fecha_hora DESC limit 0,10";
		return ejecutarConsulta($sql);
	}

	public function ventasultimos_12meses()
	{
		//Date format -> convertir fecha y hora en un formato de mes
		$sql="SELECT DATE_FORMAT(fecha_hora,'%M') as fecha,SUM(total_venta) as total FROM venta WHERE estado='Aceptado' GROUP by MONTH(fecha_hora) ORDER BY fecha_hora DESC limit 0,12";
		return ejecutarConsulta($sql);
	}

	public function productosmasvendidos()
	{
		//Date format -> convertir fecha y hora en un formato de mes
		$sql="SELECT dv.idproducto,p.nombre as nombre, SUM(dv.cantidad) AS cantidad
		FROM venta v
		inner JOIN detalle_venta dv
		on v.idventa=dv.idventa
		inner join producto p
		on dv.idproducto=p.idproducto
		GROUP BY dv.idproducto
		ORDER BY SUM(dv.cantidad) DESC
		LIMIT 0 , 3";
		return ejecutarConsulta($sql);
	}

	public function stockproductosmasbajos(){
		$sql="SELECT p.idproducto,p.nombre,c.nombre as categoria,p.stock
		FROM producto p
        INNER JOIN categoria c
        on p.idcategoria=c.idcategoria
        WHERE stock<=5
		GROUP BY idproducto
		LIMIT 0 , 5";
		return ejecutarConsulta($sql);
	}

	public function cantidadarticulos(){
	$sql="SELECT COUNT(*) totalar FROM producto WHERE condicion=1";
	return ejecutarConsulta($sql);
	}
	public function totalstock(){
		$sql="SELECT SUM(stock) AS totalstock FROM producto";
		return ejecutarConsulta($sql);
	}

	public function cantidadcategorias(){
		$sql="SELECT COUNT(*) totalca FROM categoria WHERE condicion=1";
		return ejecutarConsulta($sql);
	}

	public function mostrarTotalBoletasCaja($fecha_inicio,$fecha_fin)
	{

		$sql="SELECT IFNULL( (SELECT sum(total_venta) as total_venta FROM venta WHERE DATE(fecha_hora)>='$fecha_inicio' AND DATE(fecha_hora)<='$fecha_fin' AND formapago = 'Efectivo' AND tipo_comprobante = 'Boleta' AND ventacredito= 'no'), 0) as total_venta";

		return ejecutarConsultaSimpleFila($sql);

	}

	public function mostrarTotalBoletasTCaja($fecha_inicio,$fecha_fin)
	{

		$sql="SELECT IFNULL( (select sum(total_venta) as total_venta FROM venta WHERE DATE(fecha_hora)>='$fecha_inicio' AND DATE(fecha_hora)<='$fecha_fin' AND formapago != 'Efectivo' AND tipo_comprobante = 'Boleta' AND ventacredito= 'no'), 0) as total_venta";
		return ejecutarConsultaSimpleFila($sql);

	}

	public function mostrarTotalFacturasCaja($fecha_inicio,$fecha_fin)
	{

		$sql="SELECT IFNULL( (SELECT sum(total_venta) as total_venta FROM venta WHERE DATE(fecha_hora)>='$fecha_inicio' AND DATE(fecha_hora)<='$fecha_fin' AND formapago = 'Efectivo' AND tipo_comprobante = 'Factura' AND ventacredito= 'no'), 0) as total_venta";
		
		return ejecutarConsultaSimpleFila($sql);

	}

	public function mostrarTotalFacturasTCaja($fecha_inicio,$fecha_fin)
	{

		$sql="SELECT IFNULL( (select sum(total_venta) as total_venta FROM venta WHERE DATE(fecha_hora)>='$fecha_inicio' AND DATE(fecha_hora)<='$fecha_fin' AND formapago != 'Efectivo' AND tipo_comprobante = 'Factura' AND ventacredito= 'no'), 0) as total_venta";
		return ejecutarConsultaSimpleFila($sql);

	}

	public function mostrarTotalNotasVentaCaja($fecha_inicio,$fecha_fin)
	{

		$sql="SELECT IFNULL( (SELECT sum(total_venta) as total_venta FROM venta WHERE DATE(fecha_hora)>='$fecha_inicio' AND DATE(fecha_hora)<='$fecha_fin' AND formapago = 'Efectivo' AND tipo_comprobante = 'Nota' AND ventacredito= 'no'), 0) as total_venta";
		
		return ejecutarConsultaSimpleFila($sql);

	}

	public function mostrarTotalNotasVetnaTCaja($fecha_inicio,$fecha_fin)
	{

		$sql="SELECT IFNULL( (select sum(total_venta) as total_venta FROM venta WHERE DATE(fecha_hora)>='$fecha_inicio' AND DATE(fecha_hora)<='$fecha_fin' AND formapago != 'Efectivo' AND tipo_comprobante = 'Nota' AND ventacredito= 'no'), 0) as total_venta";
		return ejecutarConsultaSimpleFila($sql);

	}

	public function mostrarTotalCuentasCobrarVentaCaja($fecha_inicio,$fecha_fin)
	{

		$sql="SELECT IFNULL( (SELECT sum(dcc.montopagado) as total_venta FROM detalle_cuentas_por_cobrar dcc INNER JOIN cuentas_por_cobrar cc ON cc.idcpc = dcc.idcpc WHERE DATE(dcc.fechapago)>='$fecha_inicio' AND DATE(dcc.fechapago)<='$fecha_fin' AND dcc.formapago = 'Efectivo' AND cc.condicion = 1), 0) as total_venta";
		
		return ejecutarConsultaSimpleFila($sql);

	}

	public function mostrarTotalCuentasCobrarVentaTCaja($fecha_inicio,$fecha_fin)
	{

		$sql="SELECT IFNULL( (SELECT sum(dcc.montopagado) as total_venta FROM detalle_cuentas_por_cobrar dcc INNER JOIN cuentas_por_cobrar cc ON cc.idcpc = dcc.idcpc WHERE DATE(dcc.fechapago)>='$fecha_inicio' AND DATE(dcc.fechapago)<='$fecha_fin' AND dcc.formapago != 'Efectivo' AND cc.condicion = 1), 0) as total_venta";
		return ejecutarConsultaSimpleFila($sql);

	}

	public function totalEfectivo($fecha_inicio,$fecha_fin){

		$sql = "SELECT ((select ifnull(sum(total_venta),0) from venta WHERE DATE(fecha_hora)>='$fecha_inicio' AND DATE(fecha_hora)<='$fecha_fin' AND formapago = 'Efectivo' AND tipo_comprobante = 'Boleta' AND ventacredito= 'no') + 
        (select ifnull(sum(total_venta),0) from venta WHERE DATE(fecha_hora)>='$fecha_inicio' AND DATE(fecha_hora)<='$fecha_fin' AND formapago = 'Efectivo' AND tipo_comprobante = 'Factura' AND ventacredito= 'no') +
       (select ifnull(sum(total_venta),0) from venta WHERE DATE(fecha_hora)>='$fecha_inicio' AND DATE(fecha_hora)<='$fecha_fin' AND formapago = 'Efectivo' AND tipo_comprobante = 'Nota' AND ventacredito= 'no') +
       (select ifnull(sum(dcc.montopagado),0) from detalle_cuentas_por_cobrar dcc INNER JOIN cuentas_por_cobrar cc ON cc.idcpc = dcc.idcpc WHERE DATE(fechapago)>='$fecha_inicio' AND DATE(fechapago)<='$fecha_fin' AND formapago = 'Efectivo' AND cc.condicion = 1)
       ) AS total_venta";
		return ejecutarConsultaSimpleFila($sql);

	}

	public function mostrarTotalTransferencia($fecha_inicio,$fecha_fin){

		$sql = "SELECT ((select ifnull(sum(total_venta),0) from venta WHERE DATE(fecha_hora)>='$fecha_inicio' AND DATE(fecha_hora)<='$fecha_fin' AND formapago != 'Efectivo' AND tipo_comprobante = 'Boleta' AND ventacredito= 'no') + 
        (select ifnull(sum(total_venta),0) from venta WHERE DATE(fecha_hora)>='$fecha_inicio' AND DATE(fecha_hora)<='$fecha_fin' AND formapago != 'Efectivo' AND tipo_comprobante = 'Factura' AND ventacredito= 'no') +
       (select ifnull(sum(total_venta),0) from venta WHERE DATE(fecha_hora)>='$fecha_inicio' AND DATE(fecha_hora)<='$fecha_fin' AND formapago != 'Efectivo' AND tipo_comprobante = 'Nota' AND ventacredito= 'no') +
       (select ifnull(sum(montopagado),0) from detalle_cuentas_por_cobrar WHERE DATE(fechapago)>='$fecha_inicio' AND DATE(fechapago)<='$fecha_fin' AND formapago != 'Efectivo')
       ) AS total_venta";
		return ejecutarConsultaSimpleFila($sql);

	}

	public function mostrarTotalIngresos($fecha_inicio,$fecha_fin)
	{

		$sql="SELECT IFNULL( (SELECT sum(monto) as totalIngresos FROM movimiento WHERE DATE(fecha)>='$fecha_inicio' AND DATE(fecha)<='$fecha_fin' AND tipo = 'Ingresos'), 0) as totalIngresos";
		return ejecutarConsultaSimpleFila($sql);

	}

	public function mostrarTotalEgresos($fecha_inicio,$fecha_fin)
	{

		$sql="SELECT IFNULL( (SELECT sum(monto) as totalIngresos FROM movimiento WHERE DATE(fecha)>='$fecha_inicio' AND DATE(fecha)<='$fecha_fin' AND tipo = 'Egresos'), 0) as totalEgresos";
		return ejecutarConsultaSimpleFila($sql);

	}

	public function totalFacturas($fecha_inicio,$fecha_fin){

		$sql="SELECT IFNULL(count(idventa),0) as totalcuentaventa FROM venta WHERE DATE(fecha_hora)>='$fecha_inicio' AND DATE(fecha_hora)<='$fecha_fin' AND tipo_comprobante = 'Factura'";
		return ejecutarConsultaSimpleFila($sql);

	}

	public function totalBoletas($fecha_inicio,$fecha_fin){

		$sql="SELECT IFNULL(count(idventa),0) as totalcuentaventa FROM venta WHERE DATE(fecha_hora)>='$fecha_inicio' AND DATE(fecha_hora)<='$fecha_fin' AND tipo_comprobante = 'Boleta'";
		return ejecutarConsultaSimpleFila($sql);

	}

	public function totalNotas($fecha_inicio,$fecha_fin){

		$sql="SELECT IFNULL(count(idventa),0) as totalcuentaventa FROM venta WHERE DATE(fecha_hora)>='$fecha_inicio' AND DATE(fecha_hora)<='$fecha_fin' AND tipo_comprobante = 'Nota'";
		return ejecutarConsultaSimpleFila($sql);

	}

	public function totalCuentas($fecha_inicio,$fecha_fin){

		$sql="SELECT IFNULL(count(idcpc),0) as totalcuentacobrar FROM cuentas_por_cobrar WHERE DATE(fecharegistro)>='$fecha_inicio' AND DATE(fecharegistro)<='$fecha_fin'";
		return ejecutarConsultaSimpleFila($sql);

	}

	public function totalStocksBajos(){

		$sql="SELECT IFNULL(count(idproducto),0) as totalstocksbajos FROM producto WHERE stock>=0 AND stock<='5'";
		return ejecutarConsultaSimpleFila($sql);

	}

	public function totalCreditoPendientes(){

		$sql="SELECT IFNULL(count(idcpc),0) as totalcreditospendientes FROM cuentas_por_cobrar WHERE deudatotal != abonototal AND condicion=1";
		return ejecutarConsultaSimpleFila($sql);

	}

	public function listarCreditosPendientes(){
		$sql="SELECT cc.idcpc,DATE(cc.fecharegistro) as fecharegistro, v.tipo_comprobante, c.nombre, c.num_documento, v.serie_comprobante, v.num_comprobante, cc.deudatotal, cc.abonototal, cc.fechavencimiento 
				FROM venta v 
				INNER JOIN cuentas_por_cobrar cc
		        ON v.idventa = cc.idventa
		        INNER JOIN persona c
		        ON c.idpersona = v.idcliente
                WHERE cc.deudatotal != cc.abonototal AND condicion=1
                ORDER BY cc.idcpc desc";
		return ejecutarConsulta($sql);
	}

}

?>