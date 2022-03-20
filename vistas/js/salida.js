var tabla;

//Función que se ejecuta al inicio
function init(){
	mostrarform(false);
	listar();

	$("#myModal").on("submit",function(e)
	{
		guardaryeditar(e);	
	})

	$("#imagenmuestra").hide();

	$('#navPersonal').addClass("treeview active");
    $('#navPersonalLi').addClass("active");
    
}

init();