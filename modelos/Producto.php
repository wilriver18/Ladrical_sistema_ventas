<?php 
//Incluímos inicialmente la conexión a la base de datos
require "../configuraciones/Conexion.php";

Class Producto
{
	//Implementamos nuestro constructor
	public function __construct()
	{

	}

	//Implementamos un método para insertar registros
	public function insertar($idcategoria,$codigo,$nombre,$stock,$precio,$fecha,$descripcion,$imagen,$modelo,$nserie)
	{
		$sql="INSERT INTO producto (idcategoria,codigo,nombre,stock,precio,fecha,descripcion,imagen,modelo,numserie,condicion)
		VALUES ('$idcategoria','$codigo','$nombre','$stock','$precio','$fecha','$descripcion','$imagen','$modelo','$nserie','1')";
		return ejecutarConsulta($sql);
	}

	//Implementamos un método para editar registros
	public function editar($idproducto,$idcategoria,$codigo,$nombre,$stock,$precio,$fecha,$descripcion,$imagen,$modelo,$nserie)
	{
		$sql="UPDATE producto SET idcategoria='$idcategoria',codigo='$codigo',nombre='$nombre',stock='$stock',precio='$precio',fecha='$fecha',descripcion='$descripcion', modelo='$modelo', numserie='$nserie',imagen='$imagen' WHERE idproducto='$idproducto'";
		return ejecutarConsulta($sql);
	}

	//Implementamos un método para desactivar registros
	public function desactivar($idproducto)
	{
		$sql="UPDATE producto SET condicion='0' WHERE idproducto='$idproducto'";
		return ejecutarConsulta($sql);
	}

	//Implementamos un método para activar registros
	public function activar($idproducto)
	{
		$sql="UPDATE producto SET condicion='1' WHERE idproducto='$idproducto'";
		return ejecutarConsulta($sql);
	}

	//Implementar un método para mostrar los datos de un registro a modificar
	public function mostrar($idproducto)
	{
		$sql="SELECT * FROM producto WHERE idproducto='$idproducto'";
		return ejecutarConsultaSimpleFila($sql);
	}

	//Implementar un método para listar los registros
	public function listar()
	{
		$sql="SELECT a.idproducto,a.idcategoria,a.fecha,c.nombre as categoria,a.codigo,a.nombre,a.stock, a.numserie,a.descripcion,a.imagen,a.condicion FROM producto a INNER JOIN categoria c ON a.idcategoria=c.idcategoria ORDER BY a.idproducto DESC";
		return ejecutarConsulta($sql);		
	}

	//Implementar un método para listar los registros activos
	public function listarActivos()
	{
		$sql="SELECT a.idproducto,a.idcategoria,c.nombre as categoria,a.codigo,a.nombre,a.stock,a.descripcion,a.imagen,a.condicion FROM producto a INNER JOIN categoria c ON a.idcategoria=c.idcategoria WHERE a.condicion='1'";
		return ejecutarConsulta($sql);		
	}

	//Implementar un método para listar los registros activos, su último precio y el stock (vamos a unir con el último registro de la tabla detalle_ingreso)
	public function listarActivosVenta()
	{
		// $sql="SELECT a.idproducto,a.idcategoria,c.nombre as categoria,a.codigo, a.nombre,a.stock,(SELECT precio_venta FROM detalle_compra WHERE idproducto=a.idproducto ORDER BY iddetalle_compra DESC LIMIT 0,1) AS precio_venta,a.descripcion,a.imagen,a.condicion FROM producto a INNER JOIN Categoria c ON a.idcategoria=c.idcategoria WHERE a.condicion='1'";
		$sql="SELECT a.idproducto,a.idcategoria,c.nombre as categoria,a.codigo, a.nombre,a.stock,a.precio as precio_venta,a.descripcion,a.imagen,a.condicion FROM producto a INNER JOIN categoria c ON a.idcategoria=c.idcategoria WHERE a.condicion='1'";
		return ejecutarConsulta($sql);		
	}
}

?>