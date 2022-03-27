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
      
        <li class="active">Administrar Personal</li>
    
        </ol>
       </section>        
        <!-- Main content -->
        <section class="content">
        <div class="panel panel-default" style="border-color: #666; border-width: 3px; border-style: double;">
          <div class="panel-heading">
          <div class="box-header with-border" >
              <h1 class="box-title">Personal</h1>

              <!--esta opcion inabihita las opciones de minimizar y de la x de salir en la pantalla principal-->
              <!-- <div class="box-tools pull-right">
                <button class="btn btn-box-tool" data-widget="collapse">
                <i class="fa fa-minus"></i>
                </button>
                <button class="btn btn-box-tool" data-widget="remove">
                <i class="fa fa-times"></i>
                </button>
              </div> -->

          </div>
        </div>

          <div class="panel-body table-responsive" class="box-body" id="listadoregistros">
            <button class="btn btn-primary" data-toggle="modal" data-target="#myModal"><i class="fa fa-plus"> Nuevo</i>
            </button>
            <a href="../reportes/rptusuarios.php" target="_blank"><button class="btn btn-danger"><i class="fa fa-file"></i> Reporte</button></a>
            <br><br>
        <table id="tbllistado" class="table table-striped table-bordered table-condensed table-hover" width="100%">
              <thead>
                <th>Nombre</th>
                <th>Documento</th>
                <th>Número</th>
                <th>Teléfono</th>
                <th>Email</th>
                <th>Foto</th>
                <th>Estado</th>
                <th>Acciones</th>
              </thead>
              <tbody>                            
              </tbody>
              <tfoot>
                <th>Nombre</th>
                <th>Documento</th>
                <th>Número</th>
                <th>Teléfono</th>
                <th>Email</th>
                <th>Foto</th>
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

        <div class="modal-header" style="background:#F7B035; color:white">
          <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
          <h4 class="modal-title">
          Personal</h4>
        </div>

        <div class="modal-body">

          <div class="form-group">
            <label for="name" class="col-sm-2 control-label">Nombre:</label>
            <div class="col-sm-6">
              <input type="hidden" name="idpersonal" id="idpersonal">
              <input type="text" class="form-control" name="nombre" id="nombre" maxlength="100" placeholder="Nombre" required>
            </div>
            
          </div>

          <div class="form-group">

            <label for="name" class="col-sm-2 control-label">Tipo Documento: </label>
            <div class="col-sm-4"> 
              <select class="form-control select-picker" name="tipo_documento" id="tipo_documento" required>
              <option value="CI">CI</option>
            </select>
            </div>


            <label for="name" class="col-sm-2 control-label">Número de identidad:</label>
            <div class="col-sm-4">
              <input type="text" class="form-control" name="num_documento" id="num_documento" maxlength="20" placeholder="Documento" required>
            </div>
          </div>

          <div class="form-group">

            <label for="name" class="col-sm-2 control-label">Dirección: </label>
            <div class="col-sm-4"> 
              <input type="text" class="form-control" name="direccion" id="direccion" placeholder="Dirección" maxlength="70">
            </div>
            <label for="name" class="col-sm-2 control-label">Teléfono:</label>
            <div class="col-sm-4">
              <input type="text" class="form-control" name="telefono" id="telefono" maxlength="20" placeholder="Teléfono">
            </div>
          </div>

          <div class="form-group">

            <label for="name" class="col-sm-2 control-label">Email: </label>
            <div class="col-sm-4"> 
              <input type="email" class="form-control" name="email" id="email" maxlength="50" placeholder="Email">
            </div>

            <label for="name" class="col-sm-2 control-label">Cargo:</label>
            <div class="col-sm-4">
              <input type="text" class="form-control" name="cargo" id="cargo" maxlength="20" placeholder="Cargo">
            </div>
          </div>

          <div class="form-group">
            <label for="name" class="col-sm-2 control-label">Imagen:</label>
            <div class="col-sm-6">
              <input type="file" class="form-control" name="imagen" id="imagen">
            <input type="hidden" name="imagenactual" id="imagenactual">
            <img src="" width="150px" height="120px" id="imagenmuestra">
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
<script type="text/javascript" src="js/empleado.js"></script>
<script type="text/javascript" src="js/stocksbajos.js"></script>
<?php 
}
ob_end_flush();
?>