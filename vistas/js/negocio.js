var tabla;

//funcion que se ejecuta al inicio
function init(){
   mostrarform(false);
   listar();
   mostrar_registros();

   $("#formulario").on("submit",function(e){
   	guardaryeditar(e);
   })

    $("#imagenmuestra").show();
	$("#imagenmuestra").attr("src","../files/productos/anonymous.png");
	$("#imagenactual").val("anonymous.png");

   $('#navConfiguracion').addClass("treeview active");
   $('#navConfiguracionLi').addClass("active");
}


init();