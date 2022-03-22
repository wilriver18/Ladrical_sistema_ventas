
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta http-equiv="x-ua-compatible" content="ie=edge">
  <title>LADRICAL </title>
  <!-- Favicons-->
  <link rel="icon" href="public/images/favicon/logo1.png" sizes="32x32">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.11.2/css/all.css">
  <!-- Bootstrap core CSS -->
  <link href="public/css/bootstrap.min.css" rel="stylesheet">
  <!-- Material Design Bootstrap -->
  <link href="public/css/mdb.min.css" rel="stylesheet">
  <!--datables CSS básico-->
  <link rel="stylesheet" type="text/css" href="public/datatables/datatables.min.css" />
  <!--datables estilo bootstrap 4 CSS-->
  <link rel="stylesheet" type="text/css" href="public/datatables/DataTables-1.10.18/css/dataTables.bootstrap4.min.css">
  <!-- Your custom styles optional -->
  <script src="https://code.jquery.com/jquery-3.3.1.js"></script>
  <link href="public/css/style.min.css" rel="stylesheet">
  <link href="public/css/style.css" rel="stylesheet">
  <link href="public/css/myEstilos.css" rel="stylesheet">

<body class="plata">
  <!-- No tocar sirve para el responsive ojo eh! -->
  <style>
    @media handheld,
    only screen and (min-width: 767px) {
      .ls-container {
        display: none;
      }
    }

    @media only screen and (min-width: 1023px) {
      .ls-container {
        display: none;
      }
    }
  </style>
    
  <header>
      <!--
      ========================================================
      							 Navbar
      ========================================================
        -->
    <nav class="navbar fixed-top navbar-expand-lg navbar-light  warning-color-dark scrolling-navbar py-2">
      <div class="container-fluid">

        <!-- Brand -->
        <a class="navbar-brand waves-effect" href="">
          <strong class="white-text"><b>LADRICAL</b></strong>
        </a>

        <form class="d-none d-md-flex input-group w-auto my-auto">
          <input autocomplete="off" type="search" class="form-control rounded" placeholder='Buscar...' style="min-width: 555px" />
        </form>

        <!-- Collapse -->
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>

        <!-- Links -->
        <div class="collapse navbar-collapse" id="navbarSupportedContent">

          <!-- Left -->
          <ul class="navbar-nav mr-auto">
            <div class="ls-container">
              <li class="nav-item active">
                <a class="nav-link waves-effect" href="">Inicio
                  <span class="sr-only">(current)</span>
                </a>
              </li>
              <li class="nav-item">
                <a class="nav-link waves-effect" href="">Regitro de caso</a>
              </li>     
            </div>
          </ul>

          <!-- Right -->
          <ul class="navbar-nav nav-flex-icons">
            <div class="collapse navbar-collapse" id="navbarSupportedContent-5">
            </div>
            <li class="nav-item avatar dropdown">
              <a class="nav-link dropdown-toggle" id="navbarDropdownMenuLink-55" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <img src="public/images/favicon/logo1.png" class="rounded-circle z-depth-0" alt="avatar image" height="30px">
              </a>
              <div class="dropdown-menu dropdown-menu-lg-right dropdown-secondary" aria-labelledby="navbarDropdownMenuLink-55">
                <a class="dropdown-item" href=""><i class="fas fa-user mr-3"></i></a>
                <a class="dropdown-item" href=""><i class="fas fa-sign-out-alt mr-3"></i>Cerrar Sesión</a>
              </div>
            </li>
          </ul>
        </div>
      </div>
    </nav>
    <!--
      ========================================================
      							 Navbar Fin
      ========================================================
        -->

      <!-- ESTE CSS NOS SIRVE PARA PONER AL SIDEBAR IMAGEN -->
    <style>
      body,
      html {
        height: 100%;
      }
      .bg {
        /* The image used */
        background-image: url("images/avatar/frio.png");

        /* Full height */
        height: 100%;

        /* Center and scale the image nicely */
        background-position: center;
        background-repeat: no-repeat;
        background-size: cover;
      }
      .plata {

background-color: #f0f5fd;
}
    </style>

     <!--
      ========================================================
      							 Sidebar 
      ========================================================
        -->
   <br>  
    <div class="sidebar-fixed position-fixed bg  mt-lg-5 " style="height: 545px;">
      <br>
      <div class="list-group list-group-flush ">
        <div class="container">
        <br> <br> <br><br><br>  
          <a href="" class="waves-effect  pink-text darken-4">
            

            <button type="button" class="btn btn-outline-danger waves-effect"><i class="mr-2 fas fa-city  "></i><b>PRODUCTOS</b></a></button>
        </div>
      </div>
    </div>
     <!--
      ========================================================
      							 Sidebar  Fin
      ========================================================
        -->
  </header>
