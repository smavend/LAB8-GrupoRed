<%@ page import="com.example.lab8.Beans.Heroes" %>
<%@ page import="com.example.lab8.Daos.DaoHeroes" %><%--
  Created by IntelliJ IDEA.
  User: USUARIO
  Date: 4/11/2022
  Time: 09:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="listaHeroes" scope="request" type="java.util.ArrayList<com.example.lab8.Beans.Heroes>"/>
<%
  String buscar = (String) request.getAttribute("buscar");
%>
<html>
<head>
  <meta charset="utf-8">
  <title>Heroes</title>

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

        <li class="nav-item active">
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

  <div class="container py-4 my-5">
    <div class="row justify-content-between">
      <div class="col-lg-12">
        <div class="widget">
          <h1 class="widget-title text-white d-inline-block mb-4">Lista de Héroes</h1>
          <div class="row">
            <div class="col-lg-5 col-md-6 col-sm-6 col-6">
              <form class="search-form" method="post" action="<%=request.getContextPath()%>/Heroes?id=buscar">
                <div class="input-group">
                  <input type="search" name="buscar" class="form-control bg-transparent shadow-none rounded-0" id="busqueda"
                         placeholder="Buscar Héroe" value="<%=buscar!=null?buscar:""%>">
                  <div class="input-group-append">
                    <button class="btn" type="submit">
                      <span class="fas fa-search"></span>
                    </button>
                    <a href="<%=request.getContextPath()%>/Heroes" class="btn btn-secondary">Limpiar</a>
                  </div>
                </div>
              </form>
            </div>
            <div class="col-lg-5 col-md-6 col-sm-6 col-6">
              <div class="d-block">
                <a href="<%=request.getContextPath()%>/ServletHeroe?id=newHero" class="btn btn-success">Añadir nuevo héroe<img src="images/arrow-right.png" alt=""></a>
              </div>
            </div>
          </div>

          <table class="table table-bordered text-center text-white table-transparent">
            <thead class="bg-dark">
            <tr>
              <th class="h3" scope="col">
                <a href="<%=request.getContextPath()%>/ServletFinalFantasy?action=sortByid" style="color: white">
                  ID
                </a>
              </th>
              <th class="h3" scope="col">
                <a href="<%=request.getContextPath()%>/ServletFinalFantasy?action=sortBynombre" style="color: white">
                  Nombre
                </a>
              </th>
              <th class="h3" scope="col">
                Edad
              </th>
              <th class="h3" scope="col">
                <a href="<%=request.getContextPath()%>/ServletFinalFantasy?action=sortBypeso" style="color: white">
                  Genero
                </a>
              </th>
              <th class="h3" scope="col">
                <a href="<%=request.getContextPath()%>/ServletFinalFantasy?action=sortByhero" style="color: white">
                  Clase
                </a>
              </th>
              <th class="h3" scope="col">
                Nivel Inicial
              </th>
              <th class="h3" scope="col">
                Ataque
              </th>
              <th class="h3" scope="col">
                Pareja
              </th>
              <th class="h3" scope="col">
                Pts Exp
              </th>
              <th class="h3" scope="col">Editar</th>
              <th class="h3" scope="col">Eliminar</th>
              <th class="h3" scope="col">Inventario</th>
            </thead>
            <%
              DaoHeroes daoHeroes = new DaoHeroes();
              for(Heroes hero : listaHeroes){%>
            <tbody>
            <tr>
              <td><%=hero.getIdHeroe()%></td>
              <td><%=hero.getNombre()%></td>
              <td><%=hero.getEdad()%></td>
              <td><%=hero.getGenero()%></td>
              <td><%=hero.getClase()%></td>
              <td><%=hero.getNivelInicial()%></td>
              <td><%=hero.getAtaque()%></td>
              <% if(hero.getIdPareja()!=0) {
                Heroes heroe = daoHeroes.getHeroById(hero.getIdPareja());%>
                <td><%=heroe.getNombre()%></td>
              <% }
              else{ %>
              <td>Sin pareja</td>
                <% } %>
              <td><%=hero.getExperiencia()%></td>
              <td>
                <a href="<%=request.getContextPath()%>/ServletHeroe?id=editHero&heroid=<%=hero.getIdHeroe()%>" class="btn btn-secondary">
                  <i class="bi bi-pencil-square">
                  </i>
                </a>
              </td>
              <td>
                <a href="<%=request.getContextPath()%>/ServletHeroe?id=deleteHero&heroid=<%=hero.getIdHeroe()%>" class="btn btn-danger">
                  <i class="bi bi-trash-fill">
                  </i>
                </a>
              </td>
              <td>
                <a href="<%=request.getContextPath()%>/ServletHeroe?id=inventario&id=<%=hero.getIdHeroe()%>" class="btn btn-secondary">
                  <i class="bi bi-bag"></i>
                </a>
              </td>
            </tr>
            </tbody>
            <%}%>
          </table>
          <!-- end table-style -->
        </div>
        <img class="img-fluid" src="images/hero.jpg" alt="">

        <!-- https://staticg.sportskeeda.com/editor/2022/10/45ab6-16650758896894-1920.jpg para vista de enemigo individual-->
        <h1 class="text-white add-letter-space mt-4">Héroes</h1>

        <br><br>

        <p>Aquí encontraras todos los objetos que están dentro del juego.</p>
        <p>Podrás ver los objetos que tienen tus héroes y enemigos favoritos</p>
        <br>
        <p>En esta wiki podrás encontrar a toda la información relacionada a los objetos del juego. Diviértete explorando sus caracterísiticas y descubre curiosidades que quizás aún no conocías. Nútrete de conocimiento.</p>

        <div class="blockquote bg-dark my-5">
          <p class="blockquote-text pl-2">Al usar los objetos correctos podrás avanzar en el juego con mayor faciliad. Recuerda que objetos poderosos conllevan una gran responsabilidad.</p>
          <span class="blockquote-footer text-white h4 mt-3">Mold El Grande</span>
        </div>


      </div>
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
