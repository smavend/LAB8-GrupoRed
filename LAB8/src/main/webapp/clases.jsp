<%@ page import="com.example.lab8.Beans.Clase" %><%--
  Created by IntelliJ IDEA.
  User: USUARIO
  Date: 4/11/2022
  Time: 09:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="clases" scope="request" type="java.util.ArrayList<com.example.lab8.Beans.Clase>"/>
<html>
<head>
  <meta charset="utf-8">
  <title>Clases Enemigos</title>

  <!-- mobile responsive meta -->
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

  <!-- theme meta -->
  <meta name="theme-name" content="galaxy" />

  <!-- ** Plugins Needed for the Project ** -->
  <!-- Bootstrap -->
  <link rel="stylesheet" href="plugins/bootstrap/bootstrap.min.css">
  <link rel="stylesheet" href="plugins/fontawesome/css/all.css">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">

  <!-- Main Stylesheet -->
  <link href="css/style.css" rel="stylesheet">

  <!--Favicon-->
  <link rel="shortcut icon" href="images/favicon.png" type="image/x-icon">
  <link rel="icon" href="images/favicon.png" type="image/x-icon">

</head>
<body>
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
          <a class="nav-link text-white px-0" href="<%=request.getContextPath()%>/Heroes">H??roes</a>
        </li>

        <li class="nav-item active accordion">
          <div id="drop-menu" class="drop-menu collapse">
            <a class="d-block " href="<%=request.getContextPath()%>/Enemigos">Enemigos</a>
            <a class="d-block " href="<%=request.getContextPath()%>/Enemigo?id=clase">Clases de Enemigos</a>
          </div>
          <a class="nav-link text-white" href="#!" role="button" data-toggle="collapse" data-target="#drop-menu" aria-expanded="false" aria-controls="drop-menu">Lado Maligno</a>
        </li>
        <li class="nav-item ">
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
  <div class="main-content">
    <!-- start of mobile-nav -->
    <header class="mobile-nav pt-4">
      <div class="container">
        <div class="row align-items-center">
          <div class="col-6">
            <a href="home.html">
              <img src="images/logo.png" alt="">
            </a>
          </div>
          <div class="col-6 text-right">
            <button class="nav-toggle bg-transparent border text-white">
              <span class="fas fa-bars"></span>
            </button>
          </div>
        </div>
      </div>
    </header>
    <div class="nav-toggle-overlay"></div>
    <!-- end of mobile-nav -->


    <div class="container py-4 my-5">



      <div class="row justify-content-between">
        <div class="col-lg-10">
          <img class="img-fluid" src="https://www.pcgamesn.com/wp-content/sites/pcgamesn/2018/06/Best-LoL-champions.jpg" alt="">
          <h1 class="text-white add-letter-space mt-4">Clases de Enemigos</h1>
          <ul class="post-meta mt-3 mb-4">
            <li class="d-inline-block mr-3">
              <span class="fas fa-clock text-primary"></span>
              <span class="ml-1">Creado desde 2018</span>
            </li>
            <li class="d-inline-block">
              <span class="fas fa-list-alt text-primary"></span>
              <span class="ml-1">Wiki Fast??stica</span>
            </li>
          </ul>

          <p>Como ya sabes, los enemigos son seres malignos que buscan destruirte, y estas son las clases que los ordenan.</p>
          <p>Cada quien posee debilidades frente a ciertos elementos de Final Fantasy. Es tu responsabilidad poder aprovechar tus conocimientos para destruirlos eficazmente.</p>
          <br>
          <p>En esta wiki podr??s encontrar todas las clases de los enemigos vigentes del juego. Valora esta informaci??n, h??roe. Servir?? mucho para tu lucha.</p>


          <div class="widget">
            <h1 class="widget-title text-white d-inline-block mb-4">Lista de clases de enemigos</h1>
            <table class="table table-bordered text-center text-white table-transparent">
              <thead class="bg-dark">
                <tr>
                  <th class="h3" scope="col">#id</th>
                  <th class="h3" scope="col">Nombre</th>
                  <th class="h3" scope="col">Detalles</th>
                </tr>
              </thead>
              <tbody>
                <%for(Clase c : clases){%>
                <tr>
                  <td><%=c.getIdClase()%></td>
                  <td><%=c.getNombre()%></td>
                  <td style="background: #221c26;">
                    <a href="<%=request.getContextPath()%>/Enemigos?id=detail&clase=<%=c.getIdClase()%>" class="btn"><i class="bi bi-arrows-angle-expand"></i></a></td>
                </tr>
                <%}%>


              </tbody>
            </table>
            <!-- end table-style -->
          </div>


            <!-- end buttons -->

        </div>
      </div>
    </div>


    <!-- start of footer -->
    <footer class="bg-dark" style="margin: 0; padding: 2rem">
      <div class="container">
        <div class="col text-center" >
          <div class="col-lg-12 col-sm-12 mb-12" >
            <h4 class="font-primary text-white mb-4">Pagina Web elaborada para el curso de Ingener??a Web</h4>
            <h5 class="font-primary text-white mb-4">Desarrolladores</h5>
            <ul class="list-unstyled">
              <li>Beatriz Manrique Aveda??o</li>
              <li>Dana Nolasco Vallejos</li>
              <li>Sebastian Segura Abanto</li>
            </ul>
          </div>
        </div>
      </div>
    </footer>
    <!-- end of footer -->
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
