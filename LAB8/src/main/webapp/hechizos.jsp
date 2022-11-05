<%--
  Created by IntelliJ IDEA.
  User: USUARIO
  Date: 4/11/2022
  Time: 09:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <meta charset="utf-8">
  <title>Hechizos</title>

  <!-- mobile responsive meta -->
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

  <!-- theme meta -->
  <meta name="theme-name" content="galaxy" />

  <!-- ** Plugins Needed for the Project ** -->
  <!-- Bootstrap -->
  <link rel="stylesheet" href="plugins/bootstrap/bootstrap.min.css">
  <link rel="stylesheet" href="plugins/fontawesome/css/all.css">

  <!-- Main Stylesheet -->
  <link href="css/style.css" rel="stylesheet">

  <!--Favicon-->
  <link rel="shortcut icon" href="images/favicon.png" type="image/x-icon">
  <link rel="icon" href="images/favicon.png" type="image/x-icon">

  <!-- Bootstrap By: Dana-->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
  <link rel="stylesheet" type="text/css" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
  <link rel="stylesheet" href="../../css/style.min.css">
  <link rel="stylesheet" href="../../css/flex.css">
  <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">

</head>
<body data-spy="scroll" data-target="#navbar-nav-header" class="static-layout" style="background: #000000">
<!-- START preloader-wrapper -->
<div class="preloader-wrapper">
  <div class="preloader-inner">
    <div class="spinner-border text-red"></div>
  </div>
</div>
<!-- END preloader-wrapper -->

<!-- START main-wrapper -->
<section class="d-flex">

  <!-- start of sidenav -->
  <aside><div class="sidenav position-sticky d-flex flex-column justify-content-between">
    <a class="navbar-brand" href="<%=request.getContextPath()%>/ServletFinalFantasy" class="logo">
      <img src="images/logo.png" alt="">
    </a>
    <!-- end of navbar-brand -->

    <div class="navbar navbar-dark my-4 p-0 font-primary">
      <ul class="navbar-nav w-100">
        <li class="nav-item ">
          <a class="nav-link text-white px-0 pt-0" href="<%=request.getContextPath()%>/ServletFinalFantasy">Inicio</a>
        </li>

        <li class="nav-item ">
          <a class="nav-link text-white px-0" href="<%=request.getContextPath()%>/Heroes">Héroes</a>
        </li>

        <li class="nav-item  accordion">
          <div id="drop-menu" class="drop-menu collapse">
            <a class="d-block " href="<%=request.getContextPath()%>/Enemigos">Enemigos</a>
            <a class="d-block " href="<%=request.getContextPath()%>/Enemigo?id=clase">Clases de Enemigos</a>
          </div>
          <a class="nav-link text-white" href="#!" role="button" data-toggle="collapse" data-target="#drop-menu" aria-expanded="false" aria-controls="drop-menu">Lado Maligno</a>
        </li>
        <li class="nav-item active">
          <a class="nav-link text-white px-0" href="<%=request.getContextPath()%>/ServletFinalFantasy?action=hechizos">Hechizos</a>
        </li>
        <li class="nav-item ">
          <a class="nav-link text-white px-0" href="<%=request.getContextPath()%>/ServletFinalFantasy?action=objetos">Objetos</a>
        </li>

      </ul>
    </div>
    <!-- end of navbar -->

    <ul class="list-inline nml-2">
      <li class="list-inline-item">
        <a href="#!" class="text-white text-red-onHover pr-2">
          <span class="fab fa-twitter"></span>
        </a>
      </li>
      <li class="list-inline-item">
        <a href="#!" class="text-white text-red-onHover p-2">
          <span class="fab fa-facebook-f"></span>
        </a>
      </li>
      <li class="list-inline-item">
        <a href="#!" class="text-white text-red-onHover p-2">
          <span class="fab fa-instagram"></span>
        </a>
      </li>
      <li class="list-inline-item">
        <a href="#!" class="text-white text-red-onHover p-2">
          <span class="fab fa-linkedin-in"></span>
        </a>
      </li>
    </ul>
    <!-- end of social-links -->
  </div></aside>
  <!-- end of sidenav -->

  <!-- start header-->
  <!--
  1. titulo e imagen juntos
  2. que son los hechizos?
  3. ¿cómo funcionan los hechizos?
  abrir un modal, ponerlos como cuadrados y cuando demos click
  4. tabla de hechizos
  5. indices
  -->

  <!-- imagen y titulo-->
  <div class="main-content">

    <div style="color: white">
      Imagen y título
    </div>

    <div style="height: 30px; display: block;"></div>

    <div class="row">

      <div class="col-sm-5" style="margin: 10px 5px 10px 80px; border:2px solid #e4112f; border-radius: 8px">
        <div class="container-fluid" style="color: #ffffff">
          <div style="height: 15px; display: block;"></div>
          <p align="center" style="font-weight: bolder; color: #ffffff; font-size: 20px">¿Qué son los hechizos?</p>
          <p align="center" style="color: #B0B0B0"> Las poderosas armas elementales que se usa
            para poder librar la guerra en este mundo tan hostil. </p>
        </div>
      </div>
      <div class="col-sm-5" style="margin: 10px 5px 10px 30px; border:2px solid #e4112f; border-radius: 8px">
        <div class="container-fluid" style="color: #ffffff">
          <div style="height: 10px; display: block;"></div>
          <p align="center" style="font-weight: bolder; color: #ffffff; font-size: 20px">¿Cómo funcionan los hechizos?</p>
          <p align="center" style="color: #B0B0B0"> Los hechizos se caracterizan por tener
            un nombre, un elemento, potencia de hechizo y precisión del
            hechizo. </p>
        </div>
      </div>

    </div>

    <div style="height: 30px; display: block;"></div>
    <div align="center">
      <h1 class="widget-title text-white d-inline-block mb-4"> Lista de Hechizos en el Juego </h1>
    </div>

    <div style="height: 20px; display: block;"></div>
    <div class="col-lg-5 col-md-8" style="margin-left: 14px">
      <form class="search-form" action="#" >
        <div class="input-group">
          <input type="search" class="form-control bg-transparent shadow-none rounded-0" placeholder="Buscar enemigo">
          <div class="input-group-append">
            <button class="btn" type="submit">
              <span class="fas fa-search"></span>
            </button>
          </div>
        </div>
      </form>
    </div>

    <div class="row">

      <div class="col-sm-11">

        <table class="table table-bordered text-center text-white table-transparent" style="margin: 0px 30px 30px 30px">
          <thead class="bg-dark">
          <tr>
            <th class="h3" scope="col">Nombre</th>
            <th class="h3" scope="col">Elemento</th>
            <th class="h3" scope="col">Potencia</th>
            <th class="h3" scope="col">Precisión</th>
            <th class="h3" scope="col">Aprendizaje</th>
            <th class="h3" scope="col">Hechizo Base</th>
          </tr>
          </thead>
          <tbody style="color: #B0B0B0">
          <tr>
            <td>Ráfaga de Hechizos</td>
            <td>Viento</td>
            <td>300</td>
            <td>90%</td>
            <td>120</td>
            <td>Hechizo Primero</td>
          </tr>
          <tr>
            <td>Hechizo de Concentración</td>
            <td>Fuego</td>
            <td>500</td>
            <td>110%</td>
            <td>200</td>
            <td>Rafaga de Hechizo</td>
          </tr>
          <tr>
            <td>Hechizo Veloces</td>
            <td>Agua</td>
            <td>800</td>
            <td>70%</td>
            <td>100</td>
            <td>Hechizo Primero</td>
          </tr>
          </tbody>
        </table>

      </div>
      <div class="col-sm"></div>

    </div>
  </div>


</section>
<!-- END main-wrapper -->

<!-- All JS Files -->
<script src="plugins/jQuery/jquery.min.js"></script>
<script src="plugins/bootstrap/bootstrap.min.js"></script>

<!-- Main Script -->
<script src="js/script.js"></script>
</body>
</html>
