//Función que se ejecuta al inicio
function init(){

    StocksBajos();
    CreditosPendientes();
	
}

function StocksBajos(){

	$.post("../controladores/consultas.php?op=totalStocksBajos", function(data,status)
	{

		data=JSON.parse(data);

		var label=document.querySelector('#totalstockbajo');
		label.textContent=data.totalstocksbajos;

		var label=document.querySelector('#totalstockbajo2');
		label.textContent=data.totalstocksbajos;

	});

	$.post("../controladores/consultas.php?op=listarStocksBajos", function(r){

		$("#StocksBajos").html(r);

	});

}

function CreditosPendientes(){

	$.post("../controladores/consultas.php?op=totalCreditoPendientes", function(data,status)
	{

		data=JSON.parse(data);

		var label=document.querySelector('#creditop');
		label.textContent=data.totalcreditospendientes;

		var label=document.querySelector('#creditosp2');
		label.textContent=data.totalcreditospendientes;

	});

	$.post("../controladores/consultas.php?op=listarCreditosPendientes", function(r){

		$("#CreditosPendientes").html(r);

	});

}

init();