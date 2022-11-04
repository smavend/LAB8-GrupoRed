<%--
  Created by IntelliJ IDEA.
  User: USUARIO
  Date: 4/11/2022
  Time: 09:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <meta charset="utf-8">
  <title>Enemigos</title>

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
          <a class="nav-link text-white px-0 pt-0" href="<%=request.getContextPath()%>/ServletFinalFantasy">Home</a>
        </li>

        <li class="nav-item ">
          <a class="nav-link text-white px-0" href="<%=request.getContextPath()%>/ServletFinalFantasy?action=heroes">Héroes</a>
        </li>

        <li class="nav-item active accordion">
          <div id="drop-menu" class="drop-menu collapse">
            <a class="d-block " href="<%=request.getContextPath()%>/ServletFinalFantasy?action=enemigos">Enemigos</a>
            <a class="d-block " href="<%=request.getContextPath()%>/ServletFinalFantasy?action=claseEnemigos">Clases de Enemigos</a>
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
          <img class="img-fluid" src="https://as01.epimg.net/meristation/imagenes/2021/09/09/noticias/1631177647_549262_1631177716_noticia_normal.jpg" alt="">

          <!-- https://staticg.sportskeeda.com/editor/2022/10/45ab6-16650758896894-1920.jpg para vista de enemigo individual-->
          <h1 class="text-white add-letter-space mt-4">Enemigos</h1>
          <ul class="post-meta mt-3 mb-4">
            <li class="d-inline-block mr-3">
              <span class="fas fa-clock text-primary"></span>
              <a class="ml-1" href="#">24 April, 2016</a>
            </li>
            <li class="d-inline-block">
              <span class="fas fa-list-alt text-primary"></span>
              <a class="ml-1" href="#">Photography</a>
            </li>
          </ul>

          <p>Los enemigos son seres malignos dispuestos a destruir a los héroes.</p>
          <p>Rellenar aquí</p>
          <br>
          <p>En esta wiki podrás encontrar a todos los enemigos vigentes del juego. Diviértete explorando sus caracterísiticas y descubre curiosidades que quizás aún no conocías. Nútrete de conocimiento, querido héroe.</p>

          <div class="blockquote bg-dark my-5">
            <p class="blockquote-text pl-2">A wise girls knows her limit to touch sky.Rpelat sapiesd praesentium adipisci.The question me an idea so asered</p>
            <span class="blockquote-footer text-white h4 mt-3">James Hopkins</span>
          </div>

          <div class="widget">
            <h1 class="widget-title text-white d-inline-block mb-4">Lista de enemigos</h1>
            <div class="row">
              <div class="col-lg-5 col-md-6 col-sm-6 col-6">
                <form class="search-form" action="#">
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
              <div class="col-lg-5 col-md-6 col-sm-6 col-6">
                <div class="d-block">
                  <a class="btn btn-success" href="clases.html">Añadir nuevo enemigo<img src="images/arrow-right.png" alt=""></a>
                </div>
              </div>
            </div>
            <table class="table table-bordered text-center text-white table-transparent">
              <thead class="bg-dark">
              <tr>
                <th style="background: #E4112F;" class="h3" scope="col">Table</th>
                <th class="h3" scope="col">Column</th>
                <th class="h3" scope="col">Column</th>
              </tr>
              </thead>
              <tbody>
              <tr>
                <td>Row 1.1</td>
                <td>Row 2.1</td>
                <td>Row 3.1</td>
              </tr>
              <tr>
                <td>Row 1.2</td>
                <td>Row 2.2</td>
                <td>Row 3.2</td>
              </tr>
              <tr>
                <td>Row 1.3</td>
                <td>Row 2.3</td>
                <td>Row 3.3</td>
              </tr>
              </tbody>
            </table>
            <!-- end table-style -->
          </div>

          <div class="widget">
            <div class="d-block">
              <a class="btn btn-primary" href="clases.html">Descubre más sobre sus clases<img src="images/arrow-right.png" alt=""></a>
            </div>
            <!-- end buttons -->
          </div>
        </div>
      </div>
    </div>


    <!-- start of footer -->
    <footer class="bg-dark">
      <div class="container">
        <div class="row text-center">
          <div class="col-lg-3 col-sm-6 mb-5">
            <h5 class="font-primary text-white mb-4">Inspirations</h5>
            <ul class="list-unstyled">
              <li><a href="#!">Privacy State</a></li>
              <li><a href="#!">Privacy</a></li>
              <li><a href="#!">State</a></li>
              <li><a href="#!">Privacy</a></li>
            </ul>
          </div>
          <div class="col-lg-3 col-sm-6 mb-5">
            <h5 class="font-primary text-white mb-4">Templates</h5>
            <ul class="list-unstyled">
              <li><a href="#!">Privacy State</a></li>
              <li><a href="#!">Privacy</a></li>
              <li><a href="#!">State</a></li>
              <li><a href="#!">Privacy</a></li>
            </ul>
          </div>
          <div class="col-lg-3 col-sm-6 mb-5">
            <h5 class="font-primary text-white mb-4">Resource</h5>
            <ul class="list-unstyled">
              <li><a href="#!">Privacy State</a></li>
              <li><a href="#!">Privacy</a></li>
              <li><a href="#!">State</a></li>
              <li><a href="#!">Privacy</a></li>
            </ul>
          </div>
          <div class="col-lg-3 col-sm-6 mb-5">
            <h5 class="font-primary text-white mb-4">Company</h5>
            <ul class="list-unstyled">
              <li><a href="#!">Privacy State</a></li>
              <li><a href="#!">Privacy</a></li>
              <li><a href="#!">State</a></li>
              <li><a href="#!">Privacy</a></li>
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
