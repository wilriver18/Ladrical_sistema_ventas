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
if ($_SESSION['almacen']==1)
{
?>
<!--Contenido-->
      <!-- Content Wrapper. Contains page content -->
      <div class="content-wrapper">
        
      <section class="content-header">
      <br>
        <ol class="breadcrumb">
      
        <li><a href="inicio.php"><i class="fa fa-dashboard"></i> Inicio</a></li>
      
        <li class="active">Administrar Productos</li>
    
        </ol>
       </section>        
        <!-- Main content -->
        <section class="content">
        <div class="panel panel-default" style="border-color: #666; border-width: 3px; border-style: double;">

          <div class="panel-heading">
            <div class="box-header with-border" >
                <h1 class="box-title">Productos</h1>
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
        <a href="../reportes/rptproductos.php" target="_blank"><button class="btn btn-danger"><i class="fa fa-file"></i> Reporte</button></a>
        <br><br>
        <table id="tbllistado" class="table table-striped table-bordered table-condensed table-hover" width="100%">
              <thead>
                <th>Nombre</th>
                <th>Categoría</th>
                <th>Código</th>
                <th>Stock</th>
                <th>N° Serie</th>
                <th>Imagen</th>
                <th>Estado</th>
                <th>Acciones</th>
              </thead>
              <tbody>                            
              </tbody>
              <tfoot>
                <th>Nombre</th>
                <th>Categoría</th>
                <th>Código</th>
                <th>Stock</th>
                <th>N° Serie</th>
                <th>Imagen</th>
                <th>Estado</th>
                <th>Acciones</th>
              </tfoot>
            </table>
      </div>
    </div>
  </section>

    </div><!-- /.content-wrapper -->
  <!--Fin-Contenido-->

  <!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog">

  <div class="modal-dialog">

    <div class="modal-content">
      <!-- form -->
      <form class="form-horizontal" role="form" name="formulario" id="formulario" method="POST">

        <div class="modal-header" style="background:#3c8dbc; color:white">
          <button type="button" class="close" data-dismiss="modal" aria-hidden="true" onclick="cancelarform()">&times;</button>
          <h4 class="modal-title">
          Productos</h4>
        </div>

        <div class="modal-body">

          <div class="form-group">
            <label for="name" class="col-sm-2 control-label">Nombre:</label>
            <div class="col-sm-4">
              <input type="hidden" name="idproducto" id="idproducto">
              <input type="text" class="form-control" name="nombre" id="nombre" maxlength="100" placeholder="Nombre" required>
            </div>


            <label for="name" class="col-sm-2 control-label">Categoría: </label>
            <div class="col-sm-4"> 
              <select id="idcategoria" name="idcategoria" class="form-control selectpicker" data-live-search="true" title="Seleccione Categoría" required></select>
            </div>
          </div>

          <div class="form-group">
            <label for="name" class="col-sm-2 control-label">Stock:</label>
            <div class="col-sm-4">
              <input type="number" class="form-control" name="stock" id="stock" required>
            </div>

            <label for="name" class="col-sm-2 control-label">Descripción: </label>
            <div class="col-sm-4"> 
              <input type="text" class="form-control" name="descripcion" id="descripcion" maxlength="256" placeholder="Descripción">
            </div>
          </div>

          <div class="form-group">
            <label for="name" class="col-sm-2 control-label">Imagen:</label>
            <div class="col-sm-7">
              <input type="file" class="form-control" name="imagen" id="imagen">
              <input type="hidden" name="imagenactual" id="imagenactual">
              <!-- <img src="" width="150px" height="120px" > -->
              <img src="" class="img-thumbnail" id="imagenmuestra" width="100px">
            </div>
          </div>

          <div class="form-group">
            <label for="name" class="col-sm-2 control-label">Código:</label>
            <div class="col-sm-7">
              <input type="text" class="form-control" name="codigo" id="codigo" placeholder="Código Barras">
                <button class="btn btn-success" type="button" onclick="generarbarcode()">Generar</button>
                <button class="btn btn-info" type="button" onclick="imprimir()"><i class="fa fa-print"></i></button>
                <div id="print">
                  <svg id="barcode"></svg>
                </div>
            </div>
          </div>

          <div class="form-group col-12">
            <label for="name" class="col-sm-2 control-label">Precio de Venta:</label>
            <div class="col-sm-4">
              <input type="number" class="form-control" name="precio" id="precio" required>
            </div>

            <label for="name" class="col-sm-2 control-label">Fecha de Vencimiento:</label>
            <div class="col-sm-4">
              <input style="border-color: #99C0E7; text-align:center" class="form-control pull-right" type="date" name="fecha_hora" id="fecha_hora">
            </div>

          </div>

          <div class="form-group col-12">

            <label for="name" class="col-sm-2 control-label">Modelo:</label>
            <div class="col-sm-4">
              <input type="text" class="form-control" name="modelo" id="modelo" placeholder="Ingrese Modelo">
            </div>

            <label for="name" class="col-sm-2 control-label">N° Serie:</label>
            <div class="col-sm-4">
              <input type="text" class="form-control" name="nserie" id="nserie" placeholder="Ingrese N° serie">
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
<script type="text/javascript" src="../public/js/JsBarcode.all.min.js"></script>
<script type="text/javascript" src="../public/js/jquery.PrintArea.js"></script>
<script type="text/javascript" src="js/producto.js"></script>
<script type="text/javascript" src="js/stocksbajos.js"></script>
<?php 
}
ob_end_flush();
?>