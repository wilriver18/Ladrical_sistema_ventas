<?php
ob_start();
session_start();
//si la ariable de sesion no existe
if (!isset($_SESSION["idpersonal"]))
{
  header("Location: login.html");
}
else
{
require 'modulos/header.php';
//Usuario revisa el contenido
if ($_SESSION['personal']==1)
{
?>

<!--Contenido-->
      <!-- Content Wrapper. Contains page content -->
      <div class="content-wrapper">
      <section class="content-header">
      <br>
        <ol class="breadcrumb">
      
        <li><a href="inicio.php"><i class="fa fa-dashboard"></i> Inicio</a></li>
      
        <li class="active">Administrar LISTA FELCN</li>
    
        </ol>
       </section>        
        <!-- Main content -->
        <section class="content">
        <div class="panel panel-default" style="border-ci: #666; border-width: 3px; border-style: double;">
          <div class="panel-heading">
          <div class="box-header with-border" >
              <h1 class="box-title">LISTA FELCN</h1>
              <div class="box-tools pull-right">
                <button class="btn btn-box-tool" data-widget="collapse">
                <i class="fa fa-minus"></i>
                </button>
                <button class="btn btn-box-tool" data-widget="remove">
                <i class="fa fa-times"></i>
                </button>
              </div>


          </div>
        </div>

          <div class="panel-body table-responsive" class="box-body" id="listadoregistros">
            <button class="btn btn-primary" data-toggle="modal" data-target="#myModal"><i class="fa fa-plus"> Nuevo</i>
            </button>
            
            <br><br>



        <table id="tbllistado" class="table table-striped table-bordered table-condensed table-hover" width="100%">
              <thead>
                <th>Nº</th>
                <th>Grado</th>
                <th>Apellido</th>
                <th>Nombre</th>
                <th>CI</th>
                <th>Cargo</th>
                <th>Distrito</th>
                <th>Curso Garras</th>
                <th>Antecedentes Disciplinarios</th>
                <th>Poligrafia</th>
                <th>Estado</th>
                <th>Acciones</th>
              </thead>
              <tbody> 
                
              
              </tbody>
              <tfoot>
                <th>Nº</th>
                <th>Grado</th>
                <th>Apellido</th>
                <th>Nombre</th>
                <th>CI</th>
                <th>Cargo</th>
                <th>Distrito</th>
                <th>Curso Garras</th>
                <th>Antecedentes Disciplinarios</th>
                <th>Poligrafia</th>
                <th>Estado</th>
                <th>Acciones</th>
              </tfoot>
            </table>
      </div>
    </div>
  </section>

</div>

<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog">

  <div class="modal-dialog">

    <div class="modal-content">
      <!-- form -->
      <form class="form-horizontal" role="form" name="formulario" id="formulario" method="POST">

        <div class="modal-header" style="background:#3c8dbc; ci:white">
          <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
          <h4 class="modal-title">
          Lista FELCN</h4>
        </div>

        <div class="modal-body">

          <div class="form-group">
            <label for="name" class="col-sm-2 control-label">Grado:</label>
            <div class="col-sm-6">
              <input type="hidden" name="id_bus" id="id_bus">
              <input type="text" class="form-control" name="grado" id="grado" maxlength="100" placeholder="grado" required>
            </div>
          </div>

          <div class="form-group">
            <label for="name" class="col-sm-2 control-label">Nombre:</label>

            <div class="col-sm-4">
              <input type="text" class="form-control" name="nombre" id="nombre" maxlength="20" placeholder="nombre" >
            </div>
          </div>

          <div class="form-group">

            <label for="name" class="col-sm-2 control-label">Apellido:</label>
            <div class="col-sm-4">
              <input type="text" class="form-control" name="apellido" id="apellido" maxlength="20" placeholder="apellido">
             </div>

            <label for="name" class="col-sm-2 control-label">CI: </label>
            <div class="col-sm-4"> 
              <input type="text" class="form-control" name="ci" id="ci" placeholder="ci" maxlength="70">
            </div>
          </div>


          <div class="form-group">

            <label for="name" class="col-sm-2 control-label">Cargo:</label>
            <div class="col-sm-4">
              <input type="text" class="form-control" name="cargo" id="cargo" maxlength="20" placeholder="cargo">
            </div>
            <label for="name" class="col-sm-2 control-label">Distrito: </label>
            <div class="col-sm-4"> 
              <input type="text" class="form-control" name="distrito" id="ci" placeholder="distrito" maxlength="70">
            </div>
          </div>


          <div class="form-group">

            <label for="name" class="col-sm-2 control-label">Departamento:</label>
            <div class="col-sm-4">
              <input type="text" class="form-control" name="departamento" id="departamento" maxlength="20" placeholder="departamento">
            </div>

          </div>

        </div>
         
     
                    
        <div class="modal-footer">
          <button type="button" onclick="cancelarform()" class="btn btn-danger pull-left" data-dismiss="modal"><i class="fa fa-times"></i> Cerrar</button>
          <button class="btn btn-primary" type="submit" id="btnGuardar"><i class="fa fa-save"></i> Guardar</button>
        </div>
      </form>        
    </div>
  </div>
</div> 
<!-- Fin modal -->

<?php
}
else
{
  require 'noacceso.php';
}
require 'modulos/footer.php';
?>
<script type="text/javascript" src="js/lista_felcn.js"></script>
<script type="text/javascript" src="js/stocksbajos.js"></script>
<?php 
}
ob_end_flush();
?>