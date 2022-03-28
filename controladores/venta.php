<?php 
require_once "../modelos/Venta.php";
if (strlen(session_id())<1) 
	session_start();

$venta = new Venta();

$idventa=isset($_POST["idventa"])? limpiarCadena($_POST["idventa"]):"";
$idcliente=isset($_POST["idcliente"])? limpiarCadena($_POST["idcliente"]):"";
$idpersonal=$_SESSION["idpersonal"];
$tipo_comprobante=isset($_POST["tipo_comprobante"])? limpiarCadena($_POST["tipo_comprobante"]):"";
$serie_comprobante=isset($_POST["serie_comprobante"])? limpiarCadena($_POST["serie_comprobante"]):"";
$num_comprobante=isset($_POST["num_comprobante"])? limpiarCadena($_POST["num_comprobante"]):"";
$fecha_hora=isset($_POST["fecha_hora"])? limpiarCadena($_POST["fecha_hora"]):"";
$impuesto=isset($_POST["impuesto"])? limpiarCadena($_POST["impuesto"]):"";
$total_venta=isset($_POST["total_venta"])? limpiarCadena($_POST["total_venta"]):"";

$tipopago=isset($_POST["tipopago"])? limpiarCadena($_POST["tipopago"]):"";
$formapago=isset($_POST["formapago"])? limpiarCadena($_POST["formapago"]):"";
$nroOperacion=isset($_POST["nroOperacion"])? limpiarCadena($_POST["nroOperacion"]):"";
$fechaDepostivo=isset($_POST["fechaDepostivo"])? limpiarCadena($_POST["fechaDepostivo"]):"";
$porcentaje=isset($_POST["porcentaje"])? limpiarCadena($_POST["porcentaje"]):"";
$totalrecibido=isset($_POST["totalrecibido"])? limpiarCadena($_POST["totalrecibido"]):"";
$vuelto=isset($_POST["vuelto"])? limpiarCadena($_POST["vuelto"]):"";

$fechaOperacion=isset($_POST["fechaOperacion"])? limpiarCadena($_POST["fechaOperacion"]):"";
$montoDeuda=isset($_POST["montoDeuda"])? limpiarCadena($_POST["montoDeuda"]):"";
$montoPagado=isset($_POST["montoPagado"])? limpiarCadena($_POST["montoPagado"]):"";

$numeroCelular = "51952761400";

$detalle = "";

switch ($_GET["op"]) {

	case 'guardaryeditar':

	if (empty($idventa)) {
		$rspta=$venta->insertar($idcliente,$idpersonal,$tipo_comprobante,$serie_comprobante,$num_comprobante,$fecha_hora,$impuesto,$total_venta,$tipopago,$formapago,$nroOperacion,$fechaDepostivo,$porcentaje,$totalrecibido,$vuelto,$_POST["idproducto"],$_POST["cantidad"],$_POST["precio_venta"],$_POST["descuento"],$fechaOperacion,$montoDeuda,$montoPagado); 
		echo $rspta ? "Datos registrados correctamente" : "No se pudo registrar los datos";
	}else{
        
	}
	
	break;
	

	case 'anular':
		$rspta=$venta->anular($idventa);
		echo $rspta ? "Ingreso anulado correctamente" : "No se pudo anular el ingreso";
		break;
	
	case 'mostrar':
		$rspta=$venta->mostrar($idventa);
		echo json_encode($rspta);
		break;

		case 'mostrardetalle':

		//recibimos el idventa
		$id=$_GET['id'];

		$rspta=$venta->mostrardetalle($id);
		$total=0;
		$c=1;
		while ($reg=$rspta->fetch_object()) {

			if($c == 1){

				echo 'Pedido N° ';

				echo $reg->num_comprobante;

				echo ', CLIENTE: ';

				echo $reg->cliente;

				echo ',  LISTA DE PEDIDO: ';

			}

			echo '('.$c.')';
			echo '. '.$reg->nombre. ',  CANTIDAD:  ' .$reg->cantidad. '     ';
			$c=$c+1;
		}

		break;

		//_______________________________________________________________________________________________________
	//opcion para mostrar la numeracion y la serie_comprobante de la factura
	case 'mostrarf':
	//mostrando el numero de factura de la tabla comprobantes
	require_once "../modelos/Comprobantes.php";
			$comprobantes=new Comprobantes();

			$rspta=$comprobantes->mostrar_numero_factura();
			$data=Array();
			while ($reg=$rspta->fetch_object()) {
				$data[]=array(
            	$num_comp=$reg->num_comprobante
              	);
				}
				$numero_fac_comp = (int)$num_comp;
//fin de mostrar numero de factura de la tabla comprobantes

			$rspta=$venta->numero_venta();
			$data=Array();
			$numerof=$numero_fac_comp;
			while ($reg=$rspta->fetch_object()) {
				$data[]=array(
            	$numerof=$reg->num_comprobante
              	);
				}
				$numero_factura = (int)$numerof;
				$new_factura='';

		if($numero_factura==9999999 or empty($numerof)){
			$new_factura='0000001';
			$numero_nuevo = (int)$new_factura;
			echo json_encode($numero_nuevo);
		}elseif($numerof==9999999){
			$new_factura='0000001';
			$numero_nuevo = (int)$new_factura;
			echo json_encode($numero_nuevo);

		}else{
			$sumafact=$numero_factura+1;
			echo json_encode($sumafact);
		} 
		//$num = (int)$numerof; 
		//echo json_encode($numerof);
		break;

	case 'mostrars':

	//mostrando el numero de factura de la tabla comprobantes
	require_once "../modelos/Comprobantes.php";
			$comprobantes=new Comprobantes();

			$rspta=$comprobantes->mostrar_serie_factura();
			$data=Array();
			while ($reg=$rspta->fetch_object()) {
				$data[]=array(
				$serie_comp=$reg->serie_comprobante,
				$num_comp=$reg->num_comprobante
              	);
				}
				$serie_fac_comp = (int)$serie_comp;
				$num_fac_comp = (int)$num_comp;
//fin de mostrar numero de factura de la tabla comprobantes
				$rspta=$venta->numero_serie(); 
				$data=Array();
				$numeros=$serie_fac_comp;
				$numerofa=$num_fac_comp;

		while ($reg=$rspta->fetch_object()) {
			$data[]=array(
            $numeros=$reg->serie_comprobante,
            $numerofa=$reg->num_comprobante
              );
		}
		$nums = (int)$numeros;
		$nuew_serie=0;
		$numf = (int)$numerofa;
		if($numf==9999999 or empty($numerofa)){
			$nuew_serie=$nums+1;
			echo json_encode($nuew_serie);
		}else{
			echo json_encode($nums);
		} 
		break;//opcion para mostrar la numeracion y la serie_comprobante de la factura

		//opcion para mostrar la numeracion y la serie_comprobante de la boleta
		case 'mostrar_num_boleta':
		//mostrando el numero de boleta de la tabla comprobantes
			require_once "../modelos/Comprobantes.php";
			$comprobantes=new Comprobantes();

			$rspta=$comprobantes->mostrar_numero_boleta();
			$data=Array();
			while ($reg=$rspta->fetch_object()) {
				$data[]=array(
            	$num_comp=$reg->num_comprobante
              	);
				}
				$numero_bol_comp = (int)$num_comp;
		//fin de mostrar numero de boleta de la tabla comprobantes

		$rspta=$venta->numero_venta_boleta();
		$data=Array();
		$numerob=$numero_bol_comp;

		while ($reg=$rspta->fetch_object()) {
			$data[]=array(
            $numerob=$reg->num_comprobante
              );
		}
		$numero_boleta = (int)$numerob;
		$new_boleta='';

		if($numero_boleta==9999999 or empty($numerob)){
			$new_boleta='0000001';
			echo json_encode($new_boleta);
		}elseif($numerob==9999999){
			$new_boleta='0000001';
			echo json_encode($new_boleta);

		}else{
			$sumabol=$numero_boleta+1;
			echo json_encode($sumabol);
		} 
		//$num = (int)$numerof; 
		//echo json_encode($numerof);
		break;
		case 'mostrar_serie_boleta':
		//mostrando el numero de factura de la tabla comprobantes
	require_once "../modelos/Comprobantes.php";
			$comprobantes=new Comprobantes();

			$rspta=$comprobantes->mostrar_serie_boleta();
			$data=Array();
			while ($reg=$rspta->fetch_object()) {
				$data[]=array(
				$serie_comp_bol=$reg->serie_comprobante,
				$num_comp_bol=$reg->num_comprobante
              	);
				}
				$serie_bol_comp = (int)$serie_comp_bol;
				$num_bol_comp = (int)$num_comp_bol;
//fin de mostrar numero de factura de la tabla comprobantes
		$rspta=$venta->numero_serie_boleta();
		$data=Array();
		$numero_s_bol=$serie_bol_comp;
		$numero_bol=$num_bol_comp;

		while ($reg=$rspta->fetch_object()) {
			$data[]=array(
            $numero_s_bol=$reg->serie_comprobante,
            $numero_bol=$reg->num_comprobante
              );
		}
		$nums_bol = (int)$numero_s_bol;
		$nuew_serie_bol=0;
		$numb = (int)$numero_bol;
		if($numb==9999999 or empty($numero_s_bol)){
			$nuew_serie_bol=$nums_bol+1;
			echo json_encode($nuew_serie_bol);
		}else{
			echo json_encode($nums_bol);
		} 
		break;//fin de opcion de mostrar num_comprobante y serie_comprobante de boleta

		//opcion para mostrar la numeracion y la serie_comprobante de la ticket
		case 'mostrar_num_ticket':
		//mostrando el numero de boleta de la tabla comprobantes
			require_once "../modelos/Comprobantes.php";
			$comprobantes=new Comprobantes();

			$rspta=$comprobantes->mostrar_numero_ticket();
			$data=Array();
			while ($reg=$rspta->fetch_object()) {
				$data[]=array(
            	$num_comp_tic=$reg->num_comprobante
              	);
				}
				$numero_tic_comp = (int)$num_comp_tic;
		//fin de mostrar numero de boleta de la tabla comprobantes
		$rspta=$venta->numero_venta_ticket();
		$data=Array();
		$numerot=$numero_tic_comp;

		while ($reg=$rspta->fetch_object()) {
			$data[]=array(
            $numerot=$reg->num_comprobante
              );
		}
		$numero_ticket = (int)$numerot;
		$new_ticket='';

		if($numero_ticket==9999999 or empty($numerot)){
			$new_ticket='0000001';
			echo json_encode($new_ticket);
		}elseif($numerot==9999999){
			$new_ticket='0000001';
			echo json_encode($new_ticket);

		}else{
			$sumatic=$numero_ticket+1;
			echo json_encode($sumatic);
		} 
		//$num = (int)$numerof; 
		//echo json_encode($numerof);
		break;
	case 'mostrar_s_ticket':
	//mostrando el numero de factura de la tabla comprobantes
	require_once "../modelos/Comprobantes.php";
			$comprobantes=new Comprobantes();

			$rspta=$comprobantes->mostrar_serie_ticket();
			$data=Array();
			while ($reg=$rspta->fetch_object()) {
				$data[]=array(
				$serie_comp_tic=$reg->serie_comprobante,
				$num_comp_tic=$reg->num_comprobante
              	);
				}
				$serie_tic_comp = (int)$serie_comp_tic;
				$num_tic_comp = (int)$num_comp_tic;
//fin de mostrar numero de factura de la tabla comprobantes
		$rspta=$venta->numero_serie_ticket();
		$data=Array();
		$numero_s_tic=$serie_tic_comp;
		$numero_bolet=$num_tic_comp;

		while ($reg=$rspta->fetch_object()) {
			$data[]=array(
            $numero_s_tic=$reg->serie_comprobante,
            $numero_bolet=$reg->num_comprobante
              );
		}
		$num_s_ticket = (int)$numero_s_tic;
		$nuew_serie_ticket=0;
		$numbo = (int)$numero_bolet;
		if($numbo==9999999 or empty($numero_s_tic)){
			$nuew_serie_ticket=$num_s_ticket+1;
			echo json_encode($nuew_serie_ticket);
		}else{
			echo json_encode($num_s_ticket);
		} 
		break;//fin de opcion de mostrar num_comprobante y serie_comprobante del ticket
		
		//______________________________________________________________________________________________


	case 'listarDetalle':

		require_once "../modelos/Negocio.php";
		  $cnegocio = new Negocio();
		  $rsptan = $cnegocio->listar();
		  $regn=$rsptan->fetch_object();
		  if (empty($regn)) {
		    $smoneda='Simbolo de moneda';
		  }else{
		    $smoneda=$regn->simbolo;
		    $nom_imp=$regn->nombre_impuesto;
		};

		//recibimos el idventa
		$id=$_GET['id'];

		$rspta=$venta->listarDetalle($id);
		$total=0;
		echo ' <thead style="background-color:#A9D0F5">
        <th>Opciones</th>
        <th>Producto</th>
        <th>Cantidad</th>
        <th>Precio Venta</th>
        <th>Descuento</th>
        <th>Subtotal</th>
       </thead>';
		while ($reg=$rspta->fetch_object()) {
			echo '<tr class="filas">
			<td></td>
			<td>'.$reg->nombre.'</td>
			<td>'.$reg->cantidad.'</td>
			<td>'.$reg->precio_venta.'</td>
			<td>'.$reg->descuento.'</td>
			<td>'.$reg->subtotal.'</td></tr>';
			$total=$reg->total_venta;
			$detalle=$reg->nombre;

		}

		echo '<tfoot>
         <th></th>
         <th></th>
         <th></th>
         <th></th>
         <th>TOTAL</th>
         <th><h4 id="total">'.$smoneda.' '.$total.'</h4><input type="hidden" name="total_venta" id="total_venta"></th>
       </tfoot>';

		break;

    case 'listar':

		$rspta=$venta->listar();
		$data=Array();

		while ($reg=$rspta->fetch_object()) {
                 	$url1='../reportes/exTicket.php?id=';
                    $url2='../reportes/exFactura.php?id=';

			$data[]=array(
            "0"=>$reg->fecha,
            "1"=>$reg->cliente,
            "2"=>$reg->personal,
            "3"=>$reg->tipo_comprobante,
            "4"=>$reg->serie_comprobante. '-' .$reg->num_comprobante,
            "5"=>$reg->total_venta,
            "6"=>($reg->ventacredito=='Si')?'<center><span class="badge bg-red">Crédito</span></center>':'<center><span class="badge bg-primary">Contado</span></center>',
            "7"=>($reg->estado=='Aceptado')?'<span class="badge bg-green">ACEPTADO</span>':'<span class="badge bg-red">ANULADO</span>',
            "8"=>(($reg->estado=='Aceptado')?'<button class="btn btn-warning btn-xs" onclick="mostrar('.$reg->idventa.')"><i class="fa fa-eye"></i></button>'.' '.'<button class="btn btn-danger btn-xs" onclick="anular('.$reg->idventa.')"><i class="fa fa-close"></i></button>':'<button class="btn btn-warning btn-xs" onclick="mostrar('.$reg->idventa.')"><i class="fa fa-eye"></i></button>').
            '<a target="_blank" href="'.$url2.$reg->idventa.'" data-toggle="tooltip" title="" target="blanck" data-original-title="PDF"> <button class="btn btn-info btn-xs"><i class="fa fa-file"></i></button></a>'.
            '<a target="_blank" href="'.$url1.$reg->idventa.'" data-toggle="tooltip" title="" target="blanck" data-original-title="Ticket"> <button class="btn btn-primary btn-xs"><i class="fa fa-file-text"></i></button></a>'.
            '<a target="_blank" data-toggle="tooltip" title="" target="blanck" data-original-title="Enviar"> <button class="btn btn-success btn-xs" onclick="Enviar('.$reg->idventa.')"><i class="fa fa-whatsapp"></i></button></a>'
              );
		}
		$results=array(
             "sEcho"=>1,//info para datatables
             "iTotalRecords"=>count($data),//enviamos el total de registros al datatable
             "iTotalDisplayRecords"=>count($data),//enviamos el total de registros a visualizar
             "aaData"=>$data); 
		echo json_encode($results);
		break;

		case 'selectCliente':
			require_once "../modelos/Persona.php";
			$persona = new Persona();

			$rspta = $persona->listarc();

			while ($reg = $rspta->fetch_object()) {
				echo '<option value='.$reg->idpersona.'>'.$reg->nombre. ' - ' .$reg->num_documento.'</option>';
			}
		break;

		case 'selectVendedor':
			require_once "../modelos/Persona.php";
			$persona = new Persona();

			$rspta = $persona->listarv();

			while ($reg = $rspta->fetch_object()) {
				echo '<option value='.$reg->idpersonal.'>'.$reg->nombre. ' - ' .$reg->num_documento.'</option>';
			}
		break;

			case 'listarArticulos':
			require_once "../modelos/Producto.php";
			$producto=new Producto();

				$rspta=$producto->listarActivosVenta();
		$data=Array();

		while ($reg=$rspta->fetch_object()) {
			$data[]=array(
            "0"=>(($reg->stock==0)?'<button class="btn btn-danger" onclick="nostock()"> <span class="fa fa-shopping-cart"></span></button>':'<button class="btn btn-success" onclick="agregarDetalle('.$reg->idproducto.',\''.$reg->nombre.'\',\''.$reg->precio_venta.'\',\''.$reg->stock.'\')"><span class="fa fa-shopping-cart"></span></button>'),
            "1"=>$reg->nombre,
            "2"=>$reg->categoria,
            "3"=>$reg->codigo,
            "4"=>$reg->stock,
            "5"=>$reg->precio_venta,
            "6"=>"<img src='../files/productos/".$reg->imagen."' height='50px' width='50px'>"
          
              );
		}
		$results=array(
             "sEcho"=>1,//info para datatables
             "iTotalRecords"=>count($data),//enviamos el total de registros al datatable
             "iTotalDisplayRecords"=>count($data),//enviamos el total de registros a visualizar
             "aaData"=>$data); 
		echo json_encode($results);

				break;

	case 'selectComprobante':
			require_once "../modelos/Comprobantes.php";
			$comprobantes=new Comprobantes();

			$rspta=$comprobantes->select();

			while ($reg=$rspta->fetch_object()) {
				echo '<option value=' . $reg->nombre.'>'.$reg->nombre.'</option>';
			}
			break;	

	case 'buscarProducto':

		$codigo=$_REQUEST["codigo"];

		$rspta=$venta->buscarProducto($codigo);
 		//Codificar el resultado utilizando json
 		echo json_encode($rspta);

	break;
}
 ?>