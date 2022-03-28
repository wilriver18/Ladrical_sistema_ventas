<?php
//Activamos el almacenamiento en el buffer
ob_start();
session_start();

if (!isset($_SESSION["nombre"]))
{
  header("Location: login.html");
}
else
{
require 'modulos/header.php';

if ($_SESSION['ventas']==1)
{
?>
<!--Contenido-->
      <!-- Content Wrapper. Contains page content -->
      <div class="content-wrapper">        
        <!-- Main content -->
        <section class="content-header">
    <br>
    <ol class="breadcrumb">
      
      <li><a href="inicio.php"><i class="fa fa-dashboard"></i> Inicio</a></li>
      
      <li class="active">Administrar ventas</li>
    
    </ol>
  </section>
        <section class="content">
            <div class="row">
              <div class="col-md-12">
                  <div class="panel panel-default" style="border-color: #666; border-width: 3px; border-style: double;">

                <div class="panel-heading">
                    <div class="box-header with-border" >
                        <h1 class="box-title">Ventas</h1>
                        <!--<div class="box-tools pull-right">
                          <button class="btn btn-box-tool" data-widget="collapse">
                          <i class="fa fa-minus"></i>
                          </button>
                          <button class="btn btn-box-tool" data-widget="remove">
                          <i class="fa fa-times"></i>
                          </button>
                        </div>-->

                    </div>
                  </div>

                    <!-- /.box-header -->
                    <!-- centro -->
                    <div class="panel-body table-responsive" id="listadoregistros">
                        <button class="btn btn-primary" id="btnagregar" onclick="mostrarform(true)"><i class="fa fa-plus"> Nuevo</i></button>
                        <a href="../reportes/rptventas.php" target="_blank"><button class="btn btn-danger"><i class="fa fa-file"></i> Reporte</button></a>
                        <br><br>
                        <table id="tbllistado" class="table table-striped table-bordered table-condensed table-hover dataTable" cellpadding="0" cellspacing="0" aria-describedby="tblIngresos_info" width="100%" role="grid" style="width: 100%;">
                          <thead>
                            <th>Fecha</th>
                            <th>Cliente</th>
                            <th>Personal</th>
                            <th>Documento</th>
                            <th>Número</th>
                            <th>Total Venta</th>
                            <th>Tipo Pago</th>
                            <th>Estado</th>
                           
                          </thead>
                          <tbody>                            
                          </tbody>
                          <tfoot>
                            <th>Fecha</th>
                            <th>Cliente</th>
                            <th>Personal</th>
                            <th>Documento</th>
                            <th>Número</th>
                            <th>Total Venta</th>
                            <th>Tipo Pago</th>
                            <th>Estado</th>
                            
                          </tfoot>
                        </table>
                    </div>
                    <div class="panel-body" id="formularioregistros">
                        <form name="formulario" id="formulario" method="POST">

                          <div class="form-group col-lg-6 col-md-4 col-sm-4 col-xs-12">
                            <label>Personal:</label>
                            <div class="input-group" >
                    
                            <span class="input-group-addon" ><i class="fa fa-user"></i></span> 

                            <input style="border-color: #FFC7BB; text-align:center" type="text" class="form-control" id="nuevoVendedor" value="<?php echo $_SESSION["nombre"]; ?>" readonly>
                            </div>
                          </div>

                          <div class="form-group col-lg-6 col-md-4 col-sm-4 col-xs-12">
                              <label>Cliente:</label>
                            <div class="input-group">
                              <span class="input-group-addon"><i class="fa fa-users"></i></span> 
                              <input type="hidden" name="idventa" id="idventa">
                              <select id="idcliente" name="idcliente" class="form-control selectpicker" data-live-search="true" title="Seleccione Cliente" required>
                              </select>
                           
                            </div>
                          </div>


                          <div class="form-group col-lg-3 col-md-4 col-sm-4 col-xs-12">
                            <label>Fecha:</label>
                            <div class="input-group date">
                              <div class="input-group-addon">
                                <i class="fa fa-calendar"></i>
                              </div>
                              <input style="border-color: #99C0E7; text-align:center" class="form-control pull-right" type="date" name="fecha_hora" id="fecha_hora" required>
                            </div>
                          </div>

                          <div class="form-group col-lg-3 col-md-6 col-sm-6 col-xs-12">
                            
                            <label>Tipo Comprobante:</label>
                            <div class="input-group">
                            <span class="input-group-addon" ><i class="fa fa-file"></i></span>
                            <select name="tipo_comprobante" id="tipo_comprobante" class="form-control selectpicker" required>
                            </select>
                            </div>
                          </div>

                          <div class="form-group col-lg-2 col-md-2 col-sm-6 col-xs-12">
                            <label>Serie:</label>
                            <input style="border-color: #FFC7BB; text-align:center" type="text" class="form-control" name="serie_comprobante" id="serie_comprobante" maxlength="7" placeholder="Serie">
                          </div>

                          <div class="form-group col-lg-2 col-md-2 col-sm-6 col-xs-12">
                            <label>Número:</label>
                            <input style="border-color: #99C0E7; text-align:center" type="text" class="form-control" name="num_comprobante" id="num_comprobante" maxlength="10" placeholder="Número" required="">
                          </div>

                          <div class="form-group col-lg-2 col-md-2 col-sm-6 col-xs-12">
                            <label>Impuesto:</label>
                            <div class="input-group date">
                              <div class="input-group-addon">%
                              </div>
                              <input style="border-color: #FFC7BB; text-align:center" type="text" class="form-control" name="impuesto" id="impuesto" required="">
                            </div>
                          </div>

                          <div class="form-group col-lg-4 col-md-6 col-sm-6 col-xs-12">
                                <label><i class="fa fa-barcode"></i> Códig de barras:</label>
                              <div class="input-group">
                                <span class="input-group-addon">
                                  <i class="fa fa-search"></i>
                                </span> 
                                <input style="background: #fff" autofocus="" class="form-control" id="idCodigoBarra" name="idCodigoBarra" placeholder="Codigo de Barras Aquí, Venta Rápida" type="text" onkeypress="buscarProductoCod(event, this.value)">
                             
                              </div>

                          </div>

                          <div class="form-group col-lg-6 col-md-6 col-sm-6 col-xs-12" style="padding-top: 24px;">
                            <a data-toggle="modal" href="#myModal">       
                              <button id="btnAgregarArt" type="button" class="btn btn-danger"> <span class="fa fa-search"></span> Seleccionar Productos</button>
                            </a>
                          </div>

                          <div class="col-lg-12 modal-body table-responsive">
                            <table id="detalles" class="table table-striped table-bordered table-condensed table-hover" width="100%">
                              <thead>
                                    <th>Producto</th>
                                    <th>Cantidad</th>
                                    <th>Precio Venta</th>
                                    <th>Descuento</th>
                                    <th>Stock</th>
                                    <th>Subtotal</th>
                                    <th>Opciones</th>
                                </thead>
                                <tfoot>
                                </tfoot>
                                <tbody>
                                  
                                </tbody>
                            </table>

                          </div>

                          <div class="col-sm-4 col-sm-offset-3 col-lg-8 col-lg-offset-4 main">
                            <div class="row">
                                <div class="col-lg-4 left">
                                    <div class="input-group has-error">
                                        <div id="Subtotal" class="input-group-addon">Sub Total:</div>

                                    <h8 align="center" class="form-control input-lg" id="most_total" readonly></h8>

                                    <input type="hidden" name="most_total2" id="most_total2">

                                        
                                    </div>
                                  </div>

                              <div class="col-lg-4 left  has-error">
                                <div class="input-group">
                                <div id="IGV" class="input-group-addon">S/ IGV 18.00%:</div>
                                <h8 align="center" class="form-control input-lg" id="most_imp" placeholder="Impuesto" readonly></h8>
                                
                            </div>

                          </div>

                          <div class="col-lg-4 left has-error">
                            <div class="input-group">
                                <div id="Total" class="input-group-addon">Total:</div>
                                <h8 align="center" class="form-control input-lg" id="total" readonly></h8>

                              <input type="hidden" name="total_venta" id="total_venta">
                              

                                
                            </div>
                          </div>

                          </div>
                        </div>

                          


                          <div class="form-group col-lg-2 col-md-4 col-sm-4 col-xs-12" style="padding-top: 25px;">
                            <label>¿Venta al crédito?</label>
                            <div class="input-group">
                              <select id="tipopago" name="tipopago" class="form-control" data-live-search="true" required>
                                <option value="No">No</option>
                                <option value="Si">Sí</option>
                              </select>
                            </div>
                          </div>

                          <div class="form-group col-lg-10 col-md-4 col-sm-4 col-xs-12" style="padding-top: 25px;" id="formapagoocultar">
                            <label>Forma de pago:</label>
                            <div class="input-group">
                              <select id="formapago" name="formapago" class="form-control" data-live-search="true" required>
                                <option value="Efectivo">Efectivo</option>
                                <option value="Transferencia">Transferencia bancaria</option>
                                <option value="Tarjeta">Tarjeta</option>
                              </select>
                            </div>
                          </div>

                          <div class="form-group col-lg-10 col-md-12 col-sm-12 col-xs-12" style="display: none; padding-top: 25px;" id="fp1">

                              <label>Fecha de Pago:</label>
                              <div class="input-group">
                                <input style="border-color: #FFC7BB; text-align:center" type="date" class="form-control" id="fechaOperacion" name="fechaOperacion">
                              </div>

                          </div>

                          <div class="form-group col-lg-2 col-md-12 col-sm-12 col-xs-12" style="display: none;" id="n1">

                              <label># de Operación:</label>
                              <div class="input-group">
                                <input style="border-color: #FFC7BB; text-align:center" type="text" class="form-control" id="nroOperacion" name="nroOperacion">
                              </div>

                          </div>

                          <div class="form-group col-lg-10 col-md-12 col-sm-12 col-xs-12" style="display: none;" id="f1">

                              <label>Fecha Depósito:</label>
                              <div class="input-group">
                                <input style="border-color: #FFC7BB; text-align:center" type="date" class="form-control" id="fechaDepostivo" name="fechaDepostivo">
                              </div>

                          </div>

                          <div class="form-group col-lg-2 col-md-12 col-sm-12 col-xs-12" style="display: none;" id="nd1">

                              <label>Monto Deuda:</label>
                              <div class="input-group">
                                <input style="border-color: #FFC7BB; text-align:center" type="text" class="form-control" id="montoDeuda" name="montoDeuda">
                              </div>

                          </div>

                          <div class="form-group col-lg-10 col-md-12 col-sm-12 col-xs-12" style="display: none;" id="fp2">

                              <label>Monto Pagado:</label>
                              <div class="input-group">
                                <input style="border-color: #FFC7BB; text-align:center" type="text" class="form-control" id="montoPagado" name="montoPagado" value="0">
                              </div>

                          </div>

                          <div class="form-group col-lg-2 col-md-12 col-sm-12 col-xs-12">

                              <label>Descuento en %:</label>
                              <div class="input-group">
                                <input style="border-color: #FFC7BB; text-align:center" type="text" class="form-control" name="porcentaje" id="porcentaje" maxlength="7" placeholder="Descuento" onkeyup="calcularPorcentaje();">
                              </div>

                          </div>

                          <div class="form-group col-lg-2 col-md-12 col-sm-12 col-xs-12">

                              <label>Total Recibido S/.</label>
                              <div class="input-group">
                                <input style="border-color: #FFC7BB; text-align:center" type="text" class="form-control" id="totalrecibido" name="totalrecibido" placeholder="Monto recibido" onkeyup="calcularVuelto();">
                              </div>

                          </div>

                          <div class="form-group col-lg-2 col-md-12 col-sm-12 col-xs-12">

                              <label>Vuelto S/.</label>
                              <div class="input-group">
                                <input style="border-color: #FFC7BB; text-align:center" type="text" class="form-control" id="vuelto" name="vuelto" readonly="">
                              </div>

                          </div>

                          <div class="form-group col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <br>
                            <button class="btn btn-primary" type="submit" id="btnGuardar"><i class="fa fa-save"></i> Guardar</button>

                            <button id="btnCancelar" class="btn btn-danger" onclick="cancelarform()" type="button"><i class="fa fa-remove"></i> Cancelar</button>
                          </div>

                        </form>
                    </div>
                    <!--Fin centro -->
                  </div><!-- /.box -->
              </div><!-- /.col -->
          </div><!-- /.row -->
      </section><!-- /.content -->

    </div><!-- /.content-wrapper -->
  <!--Fin-Contenido-->

<!-- Modal -->
<div class="modal fade" id="modalCliente" tabindex="-1" role="dialog">

  <div class="modal-dialog">

    <div class="modal-content">
      <!-- form -->
      <form class="form-horizontal" role="form" name="formulario" id="formulario" method="POST">

        <div class="modal-header" style="background:#3c8dbc; color:white">
          <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
          <h4 class="modal-title">
          Clientes</h4>
        </div>

        <div class="modal-body panel-body" style="padding: 20px">

          <div class="form-group">
            <label for="name" class="col-sm-2 control-label">Nombre:</label>
            <div class="col-sm-4">
              <input type="hidden" name="idpersona" id="idpersona">
              <input type="hidden" name="tipo_persona" id="tipo_persona" value="Cliente">
              <input type="text" class="form-control" name="nombre" id="nombre" maxlength="100" placeholder="Nombre del proveedor" required>
            </div>

            <label for="name" class="col-sm-2 control-label">Tipo Documento: </label>
            <div class="col-sm-4"> 
              <select class="form-control select-picker" name="tipo_documento" id="tipo_documento" required>
              <option value="DNI">DNI</option>
              <option value="RUC">RUC</option>
              <option value="CEDULA">CEDULA</option>
              </select>
            </div>
          </div>

          <div class="form-group">
            <label for="name" class="col-sm-2 control-label">Número Documento:</label>
            <div class="col-sm-4">
              <input type="text" class="form-control" name="num_documento" id="num_documento" maxlength="20" placeholder="Documento">
            </div>

            <label for="name" class="col-sm-2 control-label">Dirección: </label>
            <div class="col-sm-4"> 
              <input type="text" class="form-control" name="direccion" id="direccion" maxlength="70" placeholder="Dirección">
            </div>
          </div>

          <div class="form-group">
            <label for="name" class="col-sm-2 control-label">Teléfono:</label>
            <div class="col-sm-4">
              <input type="text" class="form-control" name="telefono" id="telefono" maxlength="20" placeholder="Teléfono">
            </div>
            
            <label for="name" class="col-sm-2 control-label">Email:</label>
            <div class="col-sm-4">
              <input type="email" class="form-control" name="email" id="email" maxlength="50" placeholder="Email">
            </div>
          </div>

         </div>

        <div class="modal-footer">
          <button type="button" class="btn btn-danger pull-left" onclick="cancelarform2()" data-dismiss="modal"><i class="fa fa-times"></i> Cerrar</button>
          <button class="btn btn-primary" type="submit" id="btnGuardar"><i class="fa fa-save"></i> Guardar</button>
        </div>

      </form>        
    </div>
  </div>
</div> 
<!-- Fin modal -->

  <!-- Modal -->
  <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
    <div class="modal-dialog modal-lg">
      <div class="modal-content panel panel-primary">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
          <h4 class="modal-title">Seleccione un Producto</h4>
        </div>
        <div class="modal-body table-responsive">
          <table id="tblarticulos" class="table table-striped table-bordered table-condensed table-hover" width="100%">
            <thead>
                <th>Opciones</th>
                <th>Nombre</th>
                <th>Categoria</th>
                <th>Código</th>
                <th>Stock</th>
                <th>Precio Venta</th>
                <th>Imagen</th>
            </thead>
            <tbody>
              
            </tbody>
            <tfoot>
                <th>Opciones</th>
                <th>Nombre</th>
                <th>Categoria</th>
                <th>Código</th>
                <th>Stock</th>
                <th>Precio Venta</th>
                <th>Imagen</th>
            </tfoot>
          </table>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
        </div>        
      </div>
    </div>
  </div>  
  <!-- Fin modal -->
<script>
  window.addEventListener("keyup",checkKeyPress,false);
  function checkKeyPress(key){
    if (key.keyCode=="113") {
      //alert("si se");
      window.open('../vistas/keyboard.php', '_blank');
    }
  }
</script>
  <!-- Modal -->
  <div id="getCodeModal" class="modal fade" role="dialog">
        <div class="modal-dialog modal-lg">
            <!-- Modal content-->
            <div class="modal-content panel panel-primary">
                
                <div class="modal-header panel-heading">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title"><span id="titulo-formulario">Vista</span> de Venta</h4>
                </div>
                <div class="modal-body panel-body">
                    <input type="hidden" id="txtCodigoSeleccionado">
                    
                    <div class="form-group col-lg-5">
                        <label class="col-form-label">Cliente (*)</label>
                        <input class="form-control" type="hidden" name="idcompra" id="idcompra">
                        <input class="form-control" type="text" name="cliente" id="cliente" maxlength="7" readonly>
                    </div>
                    <div class="form-group col-lg-3">
                        <label class="col-form-label">Personal (*)</label>
                        <input type="text" class="form-control" id="nuevoVendedor" value="<?php echo $_SESSION["nombre"]; ?>" readonly>
                    </div>
                    <div class="form-group col-lg-4">
                        <label class="col-form-label">Fecha (*)</label>
                        <input class="form-control pull-right" type="text" name="fecha_horam" id="fecha_horam" readonly>
                    </div>
                    <div class="form-group col-lg-3">
                        <label class="col-form-label">Comprobante (*)</label>
                        <input class="form-control" type="text" name="tipo_comprobantem" id="tipo_comprobantem" maxlength="7" readonly>
                    </div>
                    <div class="form-group col-lg-3">
                        <label class="col-form-label">Serie (*)</label>
                        <input class="form-control" type="text" name="serie_comprobantem" id="serie_comprobantem" maxlength="7" readonly>
                    </div>
                    <div class="form-group col-lg-3">
                        <label class="col-form-label">Número (*)</label>
                         <input class="form-control" type="text" name="num_comprobantem" id="num_comprobantem" maxlength="10" readonly>
                    </div>
                    <div class="form-group col-lg-3">
                      <div class="input-group">
                        <label class="col-form-label">Impuesto (*)</label>
                        <input class="form-control" type="text" name="impuestom" id="impuestom" readonly>
                    </div>
                    </div>

                    <div class="form-group col-lg-3">
                      <div class="input-group">
                        <label class="col-form-label">Forma Pago (*)</label>
                        <input class="form-control" type="text" name="formapagom" id="formapagom" readonly>
                    </div>
                    </div>

                    <div class="form-group col-lg-3">
                      <div class="input-group">
                        <label class="col-form-label">Número de Operación (*)</label>
                        <input class="form-control" type="text" name="nrooperacionm" id="nrooperacionm" readonly>
                    </div>
                    </div>

                    <div class="form-group col-lg-3">
                      <div class="input-group">
                        <label class="col-form-label">Fecha de Depósito (*)</label>
                        <input class="form-control" type="text" name="fechadeposito" id="fechadeposito" readonly>
                    </div>
                    </div>

                    <div class="form-group col-lg-12 col-md-12 col-xs-12">
                      <table id="detallesm" class="table table-striped table-bordered table-condensed table-hover"width="100%">
                      <tbody>
         
                      </tbody>
                      </table>
                    </div>
                </div>
                <div class="modal-footer panel-footer">
                    <button type="button" class="btn btn-danger pull-left" data-dismiss="modal"><i class="fa fa-times"></i> Cancelar</button>
                </div>
            </div>
        </div>
    </div>

  <!-- Fin modal -->

</body>
</html> 
<!-- Fin modal -->

<script>

  $("iframe").each(function() { 
        var src= $(this).attr('src');
        $(this).attr('src',src);  
});
  
</script>
<?php
}
else
{
  require 'noacceso.php';
}

require 'modulos/footer.php';
?>
<script type="text/javascript" src="js/venta.js"></script>
<script type="text/javascript" src="js/stocksbajos.js"></script>
<?php 
}
ob_end_flush();
?>


