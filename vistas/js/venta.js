var tabla;

//funcion que se ejecuta al inicio
function init(){
   mostrar_impuesto();
   mostrarform(false);
   listar();

   $("#formulario").on("submit",function(e){
   	guardaryeditar(e);
   });

   //cargamos los items al select cliente
   $.post("../controladores/venta.php?op=selectCliente", function(r){
   	$("#idcliente").html(r);
   	$('#idcliente').selectpicker('refresh');
   });

   //cargamos los items al celect comprobantes
   $.post("../controladores/venta.php?op=selectComprobante", function(c){ 
   	$("#tipo_comprobante").html(c);
   	$("#tipo_comprobante").selectpicker('refresh');
   });

	$('#navVentasV').addClass("treeview active");
    $('#navVentasLi').addClass("active");

	  $('form').keypress(function(e){   
	    if(e == 13){
	      return false;
	    }
	  });

	  $('input').keypress(function(e){
	    if(e.which == 13){
	      return false;
	    }
	  });

}

//funcion limpiar
function limpiar(){

	$("#idventa").val("");
	$("#idcliente").val("");
	$("#cliente").val("");
	$("#serie_comprobante").val("");
	$("#num_comprobante").val("");
	// $("#impuesto").val("");
	articuloAdd="";
	no_aplica=18;

	$("#total_venta").val("");
	$(".filas").remove();
	$("#total").html("0");

	$("#most_total").html("0");
	$("#most_imp").html("0");

	//obtenemos la fecha actual
	var now = new Date();
	var day =("0"+now.getDate()).slice(-2);
	var month=("0"+(now.getMonth()+1)).slice(-2);
	var today=now.getFullYear()+"-"+(month)+"-"+(day);
	$("#fecha_hora").val(today);

	//marcamos el primer tipo_documento

	$("#tipo_comprobante").val('Boleta');

	



	$("#tipo_comprobante").selectpicker('refresh');


}
//__________________________________________________________________________
//mostramos el num_comprobante de la fatura
function numFactura(){
$.ajax({
url: '../controladores/venta.php?op=mostrarf',
type:'get',
dataType:'json',
success: function(d){
		 iva=d;
$("#num_comprobante").val( ('0000000' + iva).slice(-7) ); // "0001"
$("#nFacturas").html( ('0000000' + iva).slice(-7) ); // "0001"
}
	});}
//mostramos la serie_comprobante de la factura
function numSerie(){
$.ajax({
url: '../controladores/venta.php?op=mostrars',
type:'get',
dataType:'json',
success: function(s){
	 series=s;
$("#numeros").html( ('000' + series).slice(-3) ); // "0001"
$("#serie_comprobante").val( ('000' + series).slice(-3) ); // "0001"
}
	});}
//mostramos el num_comprobante de la boleta
function numBoleta(){
$.ajax({
url: '../controladores/venta.php?op=mostrar_num_boleta',
type:'get',
dataType:'json',
success: function(d){
		 iva=d;
$("#num_comprobante").val( ('0000000' + iva).slice(-7) ); // "0001"
$("#nFacturas").html( ('0000000' + iva).slice(-7) ); // "0001"
}
	});}
//mostramos la serie_comprobante de la boleta
function numSerieBoleta(){
$.ajax({
url: '../controladores/venta.php?op=mostrar_serie_boleta',
type:'get',
dataType:'json',
success: function(s){
	 series=s;
$("#numeros").html( ('000' + series).slice(-3) ); // "0001"
$("#serie_comprobante").val( ('000' + series).slice(-3) ); // "0001"
}
	});}

	//mostramos el num_comprobante del ticket
	function numTicket(){
	$.ajax({
	url: '../controladores/venta.php?op=mostrar_num_ticket',
	type:'get',
	dataType:'json',
	success: function(d){
			 iva=d;
	$("#num_comprobante").val( ('0000000' + iva).slice(-7) ); // "0001"
	$("#nFacturas").html( ('0000000' + iva).slice(-7) ); // "0001"
	}
		});}
	//mostramos la serie_comprobante de la ticket
	function numSerieTicket(){
	$.ajax({
	url: '../controladores/venta.php?op=mostrar_s_ticket',
	type:'get',
	dataType:'json',
	success: function(s){
		 series=s;
	$("#numeros").html( ('000' + series).slice(-3) ); // "0001"
	$("#serie_comprobante").val( ('000' + series).slice(-3) ); // "0001"
	}

	});}
//_______________________________________________________________________________________________

//funcion mostrar formulario
function mostrarform(flag){
	limpiar();
	numBoleta();
	numSerieBoleta();
	if(flag){
		$("#listadoregistros").hide();
		$("#formularioregistros").show();
		//$("#btnGuardar").prop("disabled",false);
		$("#btnagregar").hide();
		listarArticulos();

		$("#btnGuardar").hide();
		$("#btnCancelar").show();
		detalles=0;
		$("#btnAgregarArt").show();


	}else{
		$("#listadoregistros").show();
		$("#formularioregistros").hide();
		$("#btnagregar").show();
	}
}

//cancelar form
function cancelarform(){
	limpiar();
	mostrarform(false);
}

//funcion listar
function listar(){
	tabla=$('#tbllistado').dataTable({
		"aProcessing": true,//activamos el procedimiento del datatable
		"aServerSide": true,//paginacion y filrado realizados por el server
		"processing": true,
		"language": 
		{          
		"processing": "<img style='width:80px; height:80px;' src='../files/plantilla/loading-page.gif' />",
		},
		dom: 'Bfrtip',//definimos los elementos del control de la tabla
		lengthMenu: [
            [5,10, 25, 50, 100, -1],
            ['5 filas','10 filas', '25 filas', '50 filas','100 filas', 'Mostrar todo']
        ],
        buttons: ['pageLength','copy','excel', 'pdf'],
		"ajax":
		{
			url:'../controladores/venta.php?op=listar',
			type: "get",
			dataType : "json",
			error:function(e){
				console.log(e.responseText);
			}
		},
		"bDestroy":true,
		"iDisplayLength":5,//paginacion
		"order":[[0,"desc"]]//ordenar (columna, orden)
	}).DataTable();
}

function listarArticulos(){
	tabla=$('#tblarticulos').dataTable({
		"aProcessing": true,//activamos el procedimiento del datatable
		"aServerSide": true,//paginacion y filrado realizados por el server
		dom: 'Bfrtip',//definimos los elementos del control de la tabla
		buttons: [

		],
		"ajax":
		{
			url:'../controladores/venta.php?op=listarArticulos',
			type: "get",
			dataType : "json",
			error:function(e){
				console.log(e.responseText);
			}
		},
		"bDestroy":true,
		"iDisplayLength":5,//paginacion
		"order":[[0,"desc"]]//ordenar (columna, orden)
	}).DataTable();
}
//funcion para guardaryeditar
function guardaryeditar(e){
     e.preventDefault();//no se activara la accion predeterminada 
     //$("#btnGuardar").prop("disabled",true);
     var formData=new FormData($("#formulario")[0]);

     $.ajax({
     	url: "../controladores/venta.php?op=guardaryeditar",
     	type: "POST",
     	data: formData,
     	contentType: false,
     	processData: false,

     	success: function(datos){
     		swal({
				  title: 'venta',
				  type: 'success',
					text:datos
				});
     		mostrarform(false);
     		listar();
     	}
     });

     limpiar();
}

function mostrar(idventa){
	$("#getCodeModal").modal('show');
	$.post("../controladores/venta.php?op=mostrar",{idventa : idventa}, function(data,status)
		{
			data=JSON.parse(data);
			//mostrarform(true);

			$("#cliente").val(data.cliente);
			$("#tipo_comprobantem").val(data.tipo_comprobante);
			$("#serie_comprobantem").val(data.serie_comprobante);
			$("#num_comprobantem").val(data.num_comprobante);
			$("#fecha_horam").val(data.fecha);
			$("#impuestom").val(data.impuesto);
			$("#formapagom").val(data.formapago);
			$("#nrooperacionm").val(data.numoperacion);
			$("#fechadeposito").val(data.fechadeposito);
			$("#idventam").val(data.idventa);
		});
		
		$.post("../controladores/venta.php?op=listarDetalle&id="+idventa,function(r){
		$("#detallesm").html(r);


	});

}

function Enviar(idventa){
		
		$.post("../controladores/venta.php?op=mostrardetalle&id="+idventa,function(r){
			window.open("https://api.whatsapp.com/send?phone=51952761400&text="+r+"");
		});

}


//funcion para desactivar
function anular(idventa){
	swal({
						    title: "¿Anular?",
						    text: "¿Está seguro Que Desea anular la Venta?",
						    type: "warning",
						    showCancelButton: true,
								cancelButtonText: "No",
								cancelButtonColor: '#FF0000',
						    confirmButtonText: "Si",
						    confirmButtonColor: "#0004FA",
						    closeOnConfirm: false,
						    closeOnCancel: false,
						    showLoaderOnConfirm: true
						    },function(isConfirm){
						    if (isConfirm){
									$.post("../controladores/venta.php?op=anular", {idventa : idventa}, function(e){
										swal(
											'!!! Anulado !!!',e,'success')
					            tabla.ajax.reload();
				        	});
						    }else {
						    swal("! Cancelado ¡", "Se Cancelo la anulación de la Venta", "error");
							 }
							});
}

var articuloAdd="";
//declaramos variables necesarias para trabajar con las compras y sus detalles
var cont=0;
var detalles=0;

function mostrar_impuesto(){

	$.ajax({
		url: '../controladores/negocio.php?op=mostrar_impuesto',
		type:'get',
		dataType:'json',
		success: function(i){

			 impuesto=i;
			 console.log("impuesto", impuesto);

			 $("#impuesto").val(impuesto);

		}

	});

}

var no_aplica=0;

$("#btnGuardar").hide();
$("#tipo_comprobante").change(marcarImpuesto);


function marcarImpuesto()
  {
  	var tipo_comprobante=$("#tipo_comprobante option:selected").text();
    if (tipo_comprobante=='Factura') {
		// $("#impuesto").val(impuesto);
		mostrar_impuesto(); 
        no_aplica=impuesto;
        numFactura();
		numSerie();
	}else if(tipo_comprobante=='Boleta'){
		// $("#impuesto").val(impuesto);
		mostrar_impuesto();
        no_aplica=impuesto;
        numBoleta();
		numSerieBoleta();
	}
	else{
		$("#impuesto").val("0");
        no_aplica=0;
        numTicket();
		numSerieTicket();
	}
  }

  // Buscar producto por código
function buscarProductoCod(e, codigo)
{

	if (e.keyCode === 13) {

		if (codigo.length > 0) {

			$.post("../controladores/venta.php?op=buscarProducto",{codigo : codigo}, function(data,status)
			{

				data=JSON.parse(data);

				agregarDetalle(data.idproducto, data.nombre, data.precio, data.stock);		

			});

		}

	}

}

function agregarDetalle(idproducto,producto,precio_venta,stock){
	//aquí preguntamos si el idarticulo ya fue agregado
    if(articuloAdd.indexOf(idproducto)!= -1)
    { //reporta -1 cuando no existe
     // swal( producto +" ya se agrego");

     let cant = document.getElementsByName("cantidad[]");

     let id = document.getElementsByName("idproducto[]");

     for (var i = 0; i < cant.length; i++) {

     	if(id[i].value == idproducto){
     		console.log("idproducto: ", idproducto);
     		console.log("id[i].value: ", id[i].value);

     		let total = Number(cant[i].value) + 1;
     		console.log("total: ", total);

     		document.getElementsByName("cantidad[]")[i].value=total;

     		modificarSubtotales();

     	}

     }

    }
    else
    {
	var cantidad=1;
	var descuento=0;

	if (idproducto!="") {
		var subtotal=cantidad*precio_venta;
		var fila='<tr class="filas" id="fila'+cont+'">'+
        '<td><input style="text-align:center" type="hidden" name="idproducto[]" value="'+idproducto+'">'+producto+'</td>'+
        '<td><input style="text-align:center" type="number" min="1" step="1" onkeyup="modificarSubtotales()" name="cantidad[]" id="cantidad[]" value="'+cantidad+'"></td>'+
        '<td><input style="text-align:center" type="number" step="0.01" onkeyup="modificarSubtotales()" name="precio_venta[]" id="precio_venta[]" value="'+precio_venta+'"></td>'+
        '<td><input style="text-align:center" type="number" step="0.01" onkeyup="modificarSubtotales()" name="descuento[]" value="'+descuento+'"></td>'+    
        '<td><input style="text-align:center" type="text" readonly="readonly" name="stock[]" value="'+stock+'"></td>'+
        '<td><span style="text-align:center" id="subtotal'+cont+'" name="subtotal">'+subtotal+'</span></td>'+
        '<td><center><button type="button" class="btn btn-danger" onclick="eliminarDetalle('+cont+')"><i class="fa fa-trash"></i></button></center></td>'+
		'</tr>';
		cont++;
		detalles=detalles+1;
		articuloAdd= articuloAdd + idproducto + "-"; //aca concatemanos los idarticulos xvg: 1-2-5-12-20
		$('#detalles').append(fila);
		modificarSubtotales();

	}else{
		alert("error al ingresar el detalle, revisar las datos del articulo ");
	}
	}
}

function nostock(){
  	swal("Sin Stock");
  }

function modificarSubtotales(e)
{
	var cant = document.getElementsByName("cantidad[]");
    var prec = document.getElementsByName("precio_venta[]");
    var desc = document.getElementsByName("descuento[]");
    var sub = document.getElementsByName("subtotal");
    var Stoc =document.getElementsByName("stock[]");


	for (var i = 0; i < cant.length; i++) {
		var inpC=cant[i];
    	var inpP=prec[i];
    	var inpD=desc[i];
    	var inpS=sub[i];
        var inpSt=Stoc[i];


		var subtl =inpS.value=(inpC.value * inpP.value)-inpD.value;
        var subfinal= subtl.toFixed(2);
        

        if(Number(inpC.value) > Number(inpSt.value)){
            
            swal("No hay suficiente stock!");
             inpC.style.backgroundColor="#00CC00";
             inpSt.style.backgroundColor="#CC0000";
           $("#btnGuardar").hide(); 
            e.preventDefault();
        
        }
        else{
        
             inpC.style.backgroundColor="#FFFFFF";
             inpSt.style.backgroundColor="#FFFFFF";
		document.getElementsByName("subtotal")[i].innerHTML=subfinal;
	}
	}

	calcularTotales();
}

function calcularTotales(){

	var sub = document.getElementsByName("subtotal");
	var total=0.0;
  	var total_monto=0.0;
  	var igv_dec =0.0;

	for (var i = 0; i < sub.length; i++) {
		total += document.getElementsByName("subtotal")[i].value;
		var igv=total*(no_aplica)/(no_aplica+100);
		var total_monto=(total-(igv)).toFixed(2);
		var igv_dec=igv.toFixed(2);

	}

	$.ajax({
	url: '../controladores/negocio.php?op=mostrar_simbolo',
	type:'get',
	dataType:'json',
	success: function(sim){

		simbolo=sim;

		$("#total").html(simbolo + total.toFixed(2));
		$("#total_venta").val(total.toFixed(2));
		$("#most_total2").val(total.toFixed(2));
		$("#most_total").html(total.toFixed(2));

		$("#montoDeuda").val(total);

		$("#most_imp").html(igv_dec);
		evaluar();


		}

	});
	
}

$("#formapago").change(function(){

	if($("#formapago").val() == "Efectivo"){

		document.getElementById("n1").style.display = "none";
		document.getElementById("f1").style.display = "none";

		$("#n1").hide();
		$("#n1").hide();

	}else{

		$('#n1').show();
		$('#f1').show();

	}

});

$("#tipopago").change(function(){

	if($("#tipopago").val() == "Si"){

		document.getElementById("formapagoocultar").style.display = "none";

		$("#formapagoocultar").hide();

		$('#fp1').show();

		$('#nd1').show();

		$('#fp2').show();

		document.getElementById("n1").style.display = "none";
		document.getElementById("f1").style.display = "none";

		$("#n1").hide();
		$("#n1").hide();

	}else{

		$("#formapagoocultar").show();

		document.getElementById("fp1").style.display = "none";

		document.getElementById("nd1").style.display = "none";

		document.getElementById("fp2").style.display = "none";

		$('#fp1').hide();

		$('#nd1').hide();

		$('#fp2').hide();

	}

});

function calcularPorcentaje(){
	total=$("#most_total2").val();

	porcentaje=$("#porcentaje").val();

	tp= porcentaje / 100;

	tp1 = total - (total * tp);

	$("#total").html("$/. " + tp1.toFixed(2));

	$("#total_venta").val(tp1.toFixed(2));

	$("#montoDeuda").val(tp1.toFixed(2));

	if(porcentaje=='0'){

		calcularTotales();

	}
	
}

function calcularVuelto(){

	let totalrecibido = $('#totalrecibido').val();

	let total = $('#total_venta').val();
	console.log("total", total);

		let vuelto = totalrecibido - total;

		if (vuelto > 0) {

		$('#vuelto').val(vuelto);	

		}else{

			$('#vuelto').val("0.00");

		}

}

function evaluar(){

	if (detalles>0) 
	{
		$("#btnGuardar").show();
	}
	else
	{
		$("#btnGuardar").hide();
		cont=0;
	}
}

function eliminarDetalle(indice){
$("#fila"+indice).remove();
calcularTotales();
detalles=detalles-1;
evaluar();
articuloAdd="";
}

init();