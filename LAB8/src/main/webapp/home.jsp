<%--
  Created by IntelliJ IDEA.
  User: USUARIO
  Date: 4/11/2022
  Time: 09:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <meta charset="utf-8">
  <title>Wiki FinalFantasy</title>

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
  <aside>
    <div class="sidenav position-sticky d-flex flex-column justify-content-between">
    <a class="navbar-brand" href="<%=request.getContextPath()%>/ServletFinalFantasy" class="logo">
      <img src="images/logo.png">
    </a>
    <!-- end of navbar-brand -->
    <div class="navbar navbar-dark my-4 p-0 font-primary">
      <ul class="navbar-nav w-100">
        <li class="nav-item active">
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

    <div class="container pt-4 mt-5">
      <div class="row justify-content-between">
        <div class="col-lg-8">
          <div class="card post-item bg-transparent border-0 mb-5">
            <div class="card-body px-0">
              <h2 class="card-title">
                <a class="text-white opacity-75-onHover">Bienvenidos a la wiki sobre Final Fantasy,
                  todo lo que debes saber sobre este juego lo podrás encontrar aca.
                </a>
              </h2>
              <img class="card-img-top rounded-0" src="https://www.alkapone.tv/wp-content/uploads/2021/12/final-fantasy.png" alt="">
              <p class="card-text my-4">
                Empezaremos con una breve explicación delo juego.....
                Lorem Ipsum es simplemente el texto de relleno de las imprentas y archivos de texto. Lorem Ipsum ha sido el texto
                de relleno estándar de las industrias desde el año 1500, cuando un impresor (N. del T. persona que se dedica a la imprenta)
                desconocido usó una galería de textos y los mezcló de tal manera que logró hacer un libro de textos especimen. No sólo sobrevivió
                500 años, sino que tambien ingresó como texto de relleno en documentos electrónicos, quedando esencialmente igual al original.
                Fue popularizado en los 60s con la creación de las hojas "Letraset",
                las cuales contenian pasajes de Lorem Ipsum, y más recientemente con software de autoedición, como por ejemplo Aldus PageMaker, el cual incluye versiones de Lorem Ipsum.
              </p>
            </div>
          </div>
          <!-- end of post-item -->
          <div class="card post-item bg-transparent border-0 mb-5">
            <div class="card-body px-0">
              <h2 class="card-title">
                <a class="text-white opacity-75-onHover" href="post-details.html">Heores</a>
              </h2>
              <img class="card-img-top rounded-0" src="images/hero.jpg" alt="">
              <p class="card-text my-4">
                Los Heroes son .....
                Lorem Ipsum es simplemente el texto de relleno de las imprentas y archivos de texto. Lorem Ipsum ha sido el texto de relleno estándar de las
                industrias desde el año 1500, cuando un impresor (N. del T. persona que se dedica a la imprenta) desconocido usó una galería de textos y los
                mezcló de tal manera que logró hacer un libro de textos especimen. No sólo sobrevivió 500 años, sino que tambien ingresó como texto de relleno
                n documentos electrónicos, quedando esencialmente igual al original. Fue popularizado en los 60s con la creación de las hojas "Letraset"
                , las cuales contenian pasajes de Lorem Ipsum, y más recientemente con software de autoedición, como por ejemplo Aldus PageMaker, el cual incluye versiones de Lorem Ipsum.
              </p>
            </div>
          </div>
          <!-- end of post-item -->
          <div class="card post-item bg-transparent border-0 mb-5">
            <div class="card-body px-0">
              <h2 class="card-title">
                <a class="text-white opacity-75-onHover" href="post-details.html">Enemigos en Final Fantasy</a>
              </h2>
              <img class="card-img-top rounded-0" src="https://as01.epimg.net/meristation/imagenes/2021/09/09/noticias/1631177647_549262_1631177716_noticia_normal.jpg" alt="">
              <p class="card-text my-4">
                Los enemigos son. ....
                Lorem Ipsum es simplemente el texto de relleno de las imprentas y archivos de texto. Lorem Ipsum ha sido el texto de relleno estándar de las
                industrias desde el año 1500, cuando un impresor (N. del T. persona que se dedica a la imprenta) desconocido usó una galería de textos
              </p>
            </div>
          </div>
          <div class="card post-item bg-transparent border-0 mb-5">
            <div class="card-body px-0">
              <h2 class="card-title">
                <a class="text-white opacity-75-onHover" href="post-details.html">Hechizos en Final Fantasy</a>
              </h2>
              <img class="card-img-top rounded-0" src="images/hechizoHome.jpg" alt="">
              <p class="card-text my-4">
                Los hecizos en Final Fantasy permiten...
                Lorem Ipsum es simplemente el texto de relleno de las imprentas y archivos de texto. Lorem Ipsum ha sido el texto de relleno estándar de las
                industrias desde el año 1500, cuando un impresor (N. del T. persona que se dedica a la imprenta) desconocido usó una galería de textos
              </p>
            </div>
          </div>
          <div class="card post-item bg-transparent border-0 mb-5">
            <div class="card-body px-0">
              <h2 class="card-title">
                <a class="text-white opacity-75-onHover" href="post-details.html">Objetos de Final Fantasy</a>
              </h2>
              <img class="card-img-top rounded-0" src="images/items_objetos.png" alt="">
              <p class="card-text my-4">
                Los objetos en Final Fantasy son parte importante del juego pues ...
                Lorem Ipsum es simplemente el texto de relleno de las imprentas y archivos de texto. Lorem Ipsum ha sido el texto de relleno estándar de las
                industrias desde el año 1500, cuando un impresor (N. del T. persona que se dedica a la imprenta) desconocido usó una galería de textos
              </p>
            </div>
          </div>
          <!-- end of post-item -->
        </div>

        <div class="col-lg-3 col-md-4">
          <div class="widget text-center">
            <img class="author-thumb-sm rounded-circle d-block mx-auto" src="images/chino.jpg" style="height: 210px">
            <h2 class="widget-title text-white d-inline-block mt-4">Creador</h2>
            <p class="mt-4">
              Final Fantasy es una franquicia de medios creada por Hironobu Sakaguchi y desarrollada, distribuida y propiedad de Square Enix
            </p>
          </div>
          <!-- end of author-widget -->
          <div class="widget bg-dark p-4 text-center">
            <h2 class="widget-title text-white d-inline-block mt-4">Noticias</h2>
            <p class="mt-4">
              La ultima versión de Final Fantasy será "Final Fantasy XVI", esta saldrá al mercado en el 2023
            </p>
            <br>
            <div class="form-group">
              <a href="https://na.finalfantasyxvi.com/"><button class="btn btn-primary">Mas información</button></a>
            </div>
          </div>
          <!-- end of subscription-widget -->

          <div class="widget">
            <div class="mb-5 text-center">
              <h2 class="widget-title text-white d-inline-block">Featured Posts</h2>
            </div>
            <div class="card post-item bg-transparent border-0 mb-5">
              <a href="post-details.html">
                <img class="card-img-top rounded-0" src="images/post/post-sm/01.png" alt="">
              </a>
              <div class="card-body px-0">
                <h2 class="card-title">
                  <a class="text-white opacity-75-onHover" href="post-details.html">Excepteur ado Do minimal duis laborum Fugiat ea</a>
                </h2>
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
                <a href="post-details.html" class="btn btn-primary">Read More <img src="images/arrow-right.png" alt=""></a>
              </div>
            </div>
            <!-- end of widget-post-item -->
            <div class="card post-item bg-transparent border-0 mb-5">
              <a href="post-details.html">
                <img class="card-img-top rounded-0" src="images/post/post-sm/02.png" alt="">
              </a>
              <div class="card-body px-0">
                <h2 class="card-title">
                  <a class="text-white opacity-75-onHover" href="post-details.html">Excepteur ado Do minimal duis laborum Fugiat ea</a>
                </h2>
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
                <a href="post-details.html" class="btn btn-primary">Read More <img src="images/arrow-right.png" alt=""></a>
              </div>
            </div>
            <!-- end of widget-post-item -->
          </div>
          <!-- end of post-items widget -->
        </div>
      </div>
    </div>
    <!-- start of footer -->
    <footer class="bg-dark" style="margin: 0; padding: 2rem">
      <div class="container">
        <div class="col text-center" >
          <div class="col-lg-12 col-sm-12 mb-12" >
            <h4 class="font-primary text-white mb-4">Pagina Web elaborada para el curso de Ingenería Web</h4>
            <h5 class="font-primary text-white mb-4">Desarrolladores</h5>
            <ul class="list-unstyled">
              <li>Beatriz Manrique Avedaño</li>
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
