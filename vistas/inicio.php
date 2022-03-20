<?php
require 'modulos/header.php';

require_once "../modelos/Negocio.php";
  $cnegocio = new Negocio();
  $rsptan = $cnegocio->listar();
  $regn=$rsptan->fetch_object();

  
?>
<!--Contenido-->
      <!-- Content Wrapper. Contains page content -->
      <div class="content-wrapper">        
        <!-- Main content -->
        <section class="content-header">
          <br>
          <ol class="breadcrumb">
            
            <li><a href="inicio.php"><i class="fa fa-dashboard"></i> Inicio</a></li>
            
            <li class="active">Panel de control</li>
          
          </ol>
        </section>
        <section class="content">
            <div class="row">
              <div class="col-md-12">
                  <div class="box">
                    <div class="box-header with-border">
                          <h1 class="box-title">Inicio </h1>
                          <small>Panel de control</small>
                        <div class="box-tools pull-right">
                          <button class="btn btn-box-tool" data-widget="collapse">
                          <i class="fa fa-minus"></i>
                          </button>
                          <button class="btn btn-box-tool" data-widget="remove">
                          <i class="fa fa-times"></i>
                          </button>
                        </div>
                    </div>
                    <!-- /.box-header -->
                    <!-- centro -->
                    <div class="panel-body">

                      <?php 

                        if (empty($regn)) {
                      ?>

                      <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <div class="alert alert-danger alert-dismissible text-center small-box">
                          <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                           <div class="inner">
                              <h4 style="font-size: 17px;">
                                <i class="fa fa-warning"></i> Alert!
                              </h4>
                              <h4>Configura los datos de tu Empresa</h4>
                           </div>
                          <a href="negocio.php" class="small-box-footer">Configurar <i class="fa fa-arrow-circle-right"></i></a>
                        </div>
                      </div>

                      <?php
                      }else{

                        $nombrenegocio=$regn->nombre;
                        $smoneda=$regn->simbolo;
                        $logo=$regn->logo;

                      ?>

                    

                      <?php

                        }

                        ?>

                        <div class="row">


             

                      <div class="col-lg-3 col-md-3 col-sm-6 col-xs-6">
                        <div class="small-box bg-red">
                          <div class="inner">
                            <h4 style="font-size:20px;">
                              <strong>Datos Menu</strong>
                            </h4>
                            <p>MENU 1 </p>
                          </div>
                          <div class="icon">
                            <i class="fa fa-users"></i>
                          </div>
                          <a href="#" class="small-box-footer">menu 1 <i class="fa fa-arrow-circle-right"></i></a>
                        </div>
                      </div>
                          


                        </div>



                        </div>




                    <!--Fin centro -->
                  </div><!-- /.box -->
              </div><!-- /.col -->

              <!--------------------->
  
           <div class="row">
           

              <!-- DONUT CHART -->
             

            </div><!-- /.col (LEFT) -->
            
      

            </div><!-- /.col (RIGHT) -->
          </div>

          <!------------------->


          </div><!-- /.row -->


      </section><!-- /.content -->

    </div><!-- /.content-wrapper -->
  <!--Fin-Contenido-->

<?php
require 'modulos/footer.php';
?>
<script src="../public/js/Chart.js"></script>
<script src="../public/js/Chart.bundle.min.js"></script>
<script type="text/javascript">
  var ctx = document.getElementById("compras").getContext('2d');
var compras = new Chart(ctx, {
    type: 'bar',
    data: {
        labels: [<?php echo $fechasc; ?>],
        datasets: [{
            label: 'Compras en S/ de los últimos 10 días',
            data: [<?php echo $totalesc; ?>],
            backgroundColor: [
                'rgba(215, 40, 40, 0.6)',
                'rgba(255, 143, 35, 0.6)',
                'rgba(255, 206, 86, 0.2)',
                'rgba(75, 192, 192, 0.2)',
                'rgba(153, 102, 255, 0.2)',
                'rgba(255, 159, 64, 0.2)',
                'rgba(255, 99, 132, 0.2)',
                'rgba(54, 162, 235, 0.2)',
                'rgba(255, 206, 86, 0.2)',
                'rgba(75, 192, 192, 0.2)'
            ],
            borderColor: [
                'rgba(255,99,132,1)',
                'rgba(255, 143, 35, 1)',
                'rgba(255, 206, 86, 1)',
                'rgba(75, 192, 192, 1)',
                'rgba(153, 102, 255, 1)',
                'rgba(255, 159, 64, 1)',
                'rgba(255,99,132,1)',
                'rgba(54, 162, 235, 1)',
                'rgba(255, 206, 86, 1)',
                'rgba(75, 192, 192, 1)'
            ],
            borderWidth: 2
        }]
    },
    options: {
        scales: {
            yAxes: [{
                ticks: {
                    beginAtZero:true
                }
            }]
        }
    }
});

var ctx = document.getElementById("ventas").getContext('2d');
var ventas = new Chart(ctx, {
    type: 'bar',
    data: {
        labels: [<?php echo $fechasv; ?>],
        datasets: [{
            label: 'Ventas en S/ de los últimos 12 meses',
            data: [<?php echo $totalesv; ?>],
            backgroundColor: [
                'rgba(49, 148, 77, 0.6)',
                'rgba(190, 103, 89, 0.6)',
                'rgba(255, 206, 86, 0.2)',
                'rgba(75, 192, 192, 0.2)',
                'rgba(153, 102, 255, 0.2)',
                'rgba(255, 159, 64, 0.2)',
                'rgba(255, 99, 132, 0.2)',
                'rgba(54, 162, 235, 0.2)',
                'rgba(255, 206, 86, 0.2)',
                'rgba(75, 192, 192, 0.2)',
                'rgba(153, 102, 255, 0.2)',
                'rgba(255, 159, 64, 0.2)'
            ],
            borderColor: [
                'rgba(49, 164, 89, 1)',
                'rgba(190, 103, 89, 1)',
                'rgba(255, 206, 86, 1)',
                'rgba(75, 192, 192, 1)',
                'rgba(153, 102, 255, 1)',
                'rgba(255, 159, 64, 1)',
                'rgba(255,99,132,1)',
                'rgba(54, 162, 235, 1)',
                'rgba(255, 206, 86, 1)',
                'rgba(75, 192, 192, 1)',
                'rgba(153, 102, 255, 0.2)',
                'rgba(255, 159, 64, 0.2)'
            ],
            borderWidth: 2
        }]
    },
    options: {
        scales: {
            yAxes: [{
                stacked: true
            }]
        }
    }
});

var ctx = document.getElementById("pieChart").getContext('2d');
var compras = new Chart(ctx, {
    type: 'doughnut',
    data: {
        labels: [<?php echo $nombreV; ?>],
        datasets: [{
            label: 'Productos más Vendidos',
            data: [<?php echo $productosm; ?>],
            backgroundColor: [
                'rgba(215, 40, 40, 0.9)',
                'rgba(97, 103, 225, 0.9)',
                'rgba(255, 159, 65, 0.9)'
            ],
            borderColor: [
                'rgba(215, 40, 40, 1)',
                'rgba(97, 103, 225, 1)',
                'rgba(255, 159, 65, 1)'
            ]
        }]
    },
    options: {
        
    }
});
</script>
<script type="text/javascript" src="js/stockproducto.js"></script>
<script type="text/javascript" src="js/stocksbajos.js"></script>
