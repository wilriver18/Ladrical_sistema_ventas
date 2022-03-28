var tabla;

//Función que se ejecuta al inicio
function init(){ 
	listarp();

    $('#navInicio').addClass("treeview active");

    // StocksBajos();
	
}


//Función Listar
function listarp()
{
	tabla=$('#tbllistado').dataTable(
	{
		"aProcessing": true,//Activamos el procesamiento del datatables
	    "aServerSide": true,//Paginación y filtrado realizados por el servidor
	    "processing": true,
	    "language": 
		{          
		"processing": "<img style='width:80px; height:80px;' src='../files/plantilla/loading-page.gif' />",
		},
	    dom: 'Bfrtip',//Definimos los elementos del control de tabla
	    lengthMenu: [
            [5,10, 25, 50, 100, -1],
            ['5 filas','10 filas', '25 filas', '50 filas','100 filas', 'Mostrar todo']
        ],
        buttons: ['pageLength','copy','excel', 'pdf'],
		"ajax":
				{
					url: '../controladores/consultas.php?op=listarp',
					type : "get",
					dataType : "json",						
					error: function(e){
						console.log(e.responseText);	
					}
				},
		"bDestroy": true,
		"iDisplayLength": 5,//Paginación
	    "order": [[ 0, "desc" ]]//Ordenar (columna,orden)
	}).DataTable();
}

// function StocksBajos(){

// 	$.post("../controladores/consultas.php?op=totalStocksBajos", function(data,status)
// 	{

// 		data=JSON.parse(data);

// 		if(data.totalstocksbajos != 0){

// 			var label=document.querySelector('#totalstockbajo');
// 			label.textContent=data.totalstocksbajos;

// 		}else{
// 			var label=document.querySelector('#totalstockbajo');
// 			label.textContent=null;
// 		}

// 	});

// 	$.post("../controladores/consultas.php?op=listarStocksBajos", function(r){

// 	    $("#StocksBajos").html(r);

// 	});

// }

init();