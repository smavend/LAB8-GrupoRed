<%@ page import="com.example.lab8.Beans.Enemigo" %><%--
  Created by IntelliJ IDEA.
  User: USUARIO
  Date: 4/11/2022
  Time: 09:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="listaEnemigos" scope="request" type="java.util.ArrayList<com.example.lab8.Beans.Enemigo>"/>
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
          <a class="nav-link text-white px-0 pt-0" href="<%=request.getContextPath()%>/ServletFinalFantasy">Home</a>
        </li>

        <li class="nav-item ">
          <a class="nav-link text-white px-0" href="<%=request.getContextPath()%>/ServletFinalFantasy?action=heroes">Héroes</a>
        </li>

        <li class="nav-item active accordion">
          <div id="drop-menu" class="drop-menu collapse">
            <a class="d-block " href="<%=request.getContextPath()%>/Enemigos">Enemigos</a>
            <a class="d-block " href="<%=request.getContextPath()%>/Enemigos?id=clase">Clases de Enemigos</a>
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
                  <a href="<%=request.getContextPath()%>/Enemigo?id=vistaAdd" class="btn btn-success">Añadir nuevo enemigo<img src="images/arrow-right.png" alt=""></a>
                </div>
              </div>
            </div>
            <table class="table table-bordered text-center text-white table-transparent">
              <thead class="bg-dark">
                <tr>
                  <th style="background: #E4112F;" class="h3" scope="col">#</th>
                  <th class="h3" scope="col">Nombre</th>
                  <th class="h3" scope="col">Clase</th>
                  <th class="h3" scope="col">Ataque</th>
                  <th class="h3" scope="col">Experiencia dada</th>
                  <th class="h3" scope="col">Objeto dado</th>
                  <th class="h3" scope="col">Prob. Objeto</th>
                  <th class="h3" scope="col">Género</th>
                  <th class="h3" scope="col">Editar</th>
                  <th class="h3" scope="col">Eliminar</th>
                </tr>
              </thead>
              <tbody>
                <tr>
              <% int i = 1;
                for (Enemigo e : listaEnemigos){ %>
                  <td><%=i%></td>
                  <td><%=e.getNombre()%></td>
                  <td><%=e.getClase()%></td>
                  <td><%=e.getAtaque()%></td>
                  <td><%=e.getExperiencia()%></td>
                  <td><%=e.getObjetoDado()%></td>
                  <td><%=e.getProbObjeto()%></td>
                  <td><%=(e.getGenero() == null)?"-":(e.getGenero().equalsIgnoreCase("M"))?"Masculino":"Femenino"%></td>
                  <td><a href="<%=request.getContextPath()%>/Enemigos?id=edit&enemy=<%=e.getIdEnemigo()%>" class="btn btn-secondary">
                    <i class="bi bi-pencil-square"></i>
                  </a>
                  </td>
                  <td><a class="btn btn-danger"><i class="bi bi-trash-fill"></i></a>
                  </td>
               <%i++;
                } %>
                </tr>
              </tbody>
            </table>
            <!-- end table-style -->
          </div>
          <img class="img-fluid" src="https://as01.epimg.net/meristation/imagenes/2021/09/09/noticias/1631177647_549262_1631177716_noticia_normal.jpg" alt="">

          <!-- https://staticg.sportskeeda.com/editor/2022/10/45ab6-16650758896894-1920.jpg para vista de enemigo individual-->
          <h1 class="text-white add-letter-space mt-4">Enemigos</h1>
          <ul class="post-meta mt-3 mb-4">
            <li class="d-inline-block mr-3">
              <span class="fas fa-clock text-primary"></span>
              <a class="ml-1">24 April, 2016</a>
            </li>
            <li class="d-inline-block">
              <span class="fas fa-list-alt text-primary"></span>
              <a class="ml-1">Photography</a>
            </li>
          </ul>

          <p>Los enemigos son seres malignos dispuestos a destruir a los héroes.</p>
          <p>Rellenar aquí</p>
          <br>
          <p>En esta wiki podrás encontrar a todos los enemigos vigentes del juego. Diviértete explorando sus caracterísiticas y descubre curiosidades que quizás aún no conocías. Nútrete de conocimiento, querido héroe.</p>
          <br>

          <div class="widget bg-dark p-4 text-center">
            <h2 class="widget-title text-white d-inline-block mt-4">Lo más popular en enemigos...<br></h2>
            <div class="container">
              <div class="row text-center">
                <div class="col-lg-6 col-lg-6 col-sm-6 col-12 mb-5">
                  <h4 style="padding-top: 10px;">Clase más común</h4>
                  <div class="row justify-content-center">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-12 d-flex align-items-center justify-content-center">
                      <span class="me-2 text-xs font-weight-bold">Dragón</span>
                      <div class="figure">
                        <svg version="1.1" xmlns="http://www.w3.org/2000/svg" width="80" height="50" viewBox="-5 20 120 100">
                          <line x1="10" y1="70" x2="100" y2="70" stroke-width="25" stroke="Gainsboro" stroke-linecap="round"></line>
                          <line x1="10" y1="70" x2="60" y2="70" stroke-width="20" stroke="crimson" stroke-linecap="round"></line>
                        </svg>
                      </div>
                      <span class="me-2 text-xs font-weight">60%</span>
                    </div>
                  </div>
                </div>
                <div class="col-lg-6 col-lg-6 col-sm-6 col-12 mb-5">
                  <h4 style="padding-top: 10px;">Objeto regalado más común</h4>
                  <div class="row justify-content-center">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-12 d-flex align-items-center justify-content-center">
                      <span class="me-2 text-xs font-weight-bold">Pico</span>
                      <div class="figure">
                        <svg version="1.1" xmlns="http://www.w3.org/2000/svg" width="80" height="50" viewBox="-5 20 120 100">
                          <line x1="10" y1="70" x2="100" y2="70" stroke-width="25" stroke="Gainsboro" stroke-linecap="round"></line>
                          <line x1="10" y1="70" x2="50.6" y2="70" stroke-width="20" stroke="crimson" stroke-linecap="round"></line>
                        </svg>
                      </div>
                      <span class="me-2 text-xs font-weight">50.6%</span>
                    </div>
                  </div>
                </div>
                <div class="col-lg-12 col-lg-12 col-sm-12 col-12 mb-5">
                  <h4 style="padding-top: 10px;">Enemigos sin género</h4>
                  <div class="row justify-content-center">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-12 d-flex align-items-center justify-content-center">
                      <span class="me-2 text-xs font-weight-bold">Sin género</span>
                      <div class="figure">
                        <svg version="1.1" xmlns="http://www.w3.org/2000/svg" width="80" height="50" viewBox="-5 20 120 100">
                          <line x1="10" y1="70" x2="100" y2="70" stroke-width="25" stroke="Gainsboro" stroke-linecap="round"></line>
                          <line x1="10" y1="70" x2="20" y2="70" stroke-width="20" stroke="crimson" stroke-linecap="round"></line>
                        </svg>
                      </div>
                      <span class="me-2 text-xs font-weight">20%</span>
                    </div>
                  </div>
                </div>
              </div>
            </div>
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
