var tabla;

//Función que se ejecuta al inicio
function init(){
	mostrarform(false);
	listar();
	limpiar();

	$("#myModal").on("submit",function(e)
	{
		guardaryeditar(e);	
	})

	//Mostramos los permisos
	$.post("../controladores/usuario.php?op=permisos&id=",function(r){
	        $("#permisos").html(r);
	});

	//Cargamos los items al select categoria
	$.post("../controladores/usuario.php?op=selectEmpleado", function(r){
	            $("#idpersonal").html(r);
	            $('#idpersonal').selectpicker('refresh');

	});

	$('#navPersonal').addClass("treeview active");
    $('#navUsuarioLi').addClass("active");

}

init();