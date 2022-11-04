<%@ page import="com.example.lab8.Beans.BObjetos" %><%--
  Created by IntelliJ IDEA.
  User: USUARIO
  Date: 4/11/2022
  Time: 09:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="listaObjetos" scope="request" type="java.util.ArrayList<com.example.lab8.Beans.BObjetos>"/>
<%
  String searchText = (String) request.getAttribute("searchText");

%>
<html>
<head>
  <meta charset="utf-8">
  <title>Objetos</title>

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
        <li class="nav-item active">
          <a class="nav-link text-white px-0 pt-0" href="<%=request.getContextPath()%>/ServletFinalFantasy">Home</a>
        </li>

        <li class="nav-item ">
          <a class="nav-link text-white px-0" href="<%=request.getContextPath()%>/ServletFinalFantasy?action=heroes">Héroes</a>
        </li>

        <li class="nav-item  accordion">
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


  <div class="container py-4 my-5">
    <div class="row justify-content-between">
      <div class="col-lg-10">
        <img class="img-fluid" src="images/items_objetos.png" alt="">

        <!-- https://staticg.sportskeeda.com/editor/2022/10/45ab6-16650758896894-1920.jpg para vista de enemigo individual-->
        <h1 class="text-white add-letter-space mt-4">Objetos</h1>

        <br><br>

        <p>Aquí encontraras todos los objetos que están dentro del juego.</p>
        <p>Podrás ver los objetos que tienen tus héroes y enemigos favoritos</p>
        <br>
        <p>En esta wiki podrás encontrar a toda la información relacionada a los objetos del juego. Diviértete explorando sus caracterísiticas y descubre curiosidades que quizás aún no conocías. Nútrete de conocimiento.</p>

        <div class="blockquote bg-dark my-5">
          <p class="blockquote-text pl-2">Al usar los objetos correctos podrás avanzar en el juego con mayor faciliad. Recuerda que objetos poderosos conllevan una gran responsabilidad.</p>
          <span class="blockquote-footer text-white h4 mt-3">Mold El Grande</span>
        </div>

        <div class="widget">
          <h1 class="widget-title text-white d-inline-block mb-4">Lista de objetos</h1>
          <br>
          <a class="btn btn-primary" href="<%=request.getContextPath()%>/ServletFinalFantasy?action=newObject" role="button">Añadir Objeto</a>
          <br>
          <div class="row">
            <div class="col-lg-5 col-md-8">
              <br>
              <form class="search-form" method="post" action="<%=request.getContextPath()%>/ServletFinalFantasy?action=buscar">
                <div class="input-group">
                  <input type="search" name="searchText" class="form-control bg-transparent shadow-none rounded-0" id="busqueda"
                         placeholder="Buscar Objeto" value="<%=searchText!=null?searchText:""%>">
                  <div class="input-group-append">
                    <button class="btn" type="submit">
                      <span class="fas fa-search"></span>
                    </button>
                    <a href="<%=request.getContextPath()%>/ServletFinalFantasy?action=objetos" class="btn btn-secondary">Limpiar</a>
                  </div>
                </div>
              </form>
            </div>
          </div>

          <table class="table table-bordered text-center text-white table-transparent">
            <thead class="bg-dark">
            <tr>

              <th class="h3" scope="col">ID</th>
              <th class="h3" scope="col">Nombre</th>
              <th class="h3" scope="col">Efecto/Uso</th>
              <th class="h3" scope="col">Peso</th>
              <th class="h3" scope="col">Héroe</th>
              <th class="h3" scope="col">Editar</th>
              <th class="h3" scope="col">Eliminar</th>
            </tr>
            </thead>
            <%for(BObjetos object : listaObjetos){%>
            <tbody>
            <tr>
              <td><%=object.getIdObjeto()%></td>
              <td><%=object.getNombre()%></td>
              <td><%=object.getEfectoUso()%></td>
              <td><%=object.getPeso()%></td>
              <td>uso</td>
              <td>
                <a class="btn -primary" href="<%=request.getContextPath()%>/ServletFinalFantasy?action=editObject&id=<%=object.getIdObjeto()%>" role="button" style="width: 2.5rem; height: 1.3rem ; margin: 0; padding: 0">
                  <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil" viewBox="0 0 16 16" style="padding: 0; margin: 0 ">
                    <path d="M12.146.146a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1 0 .708l-10 10a.5.5 0 0 1-.168.11l-5 2a.5.5 0 0 1-.65-.65l2-5a.5.5 0 0 1 .11-.168l10-10zM11.207 2.5 13.5 4.793 14.793 3.5 12.5 1.207 11.207 2.5zm1.586 3L10.5 3.207 4 9.707V10h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.293l6.5-6.5zm-9.761 5.175-.106.106-1.528 3.821 3.821-1.528.106-.106A.5.5 0 0 1 5 12.5V12h-.5a.5.5 0 0 1-.5-.5V11h-.5a.5.5 0 0 1-.468-.325z"/>
                  </svg>
                </a>
              </td>
              <td>
                <a class="btn -primary" role="button" style="width: 2.5rem; height: 1.3rem ; margin: 0; padding: 0"
                   onclick="return confirm('¿Estas seguro(a) que deseas borrar <%=object.getNombre()%>?')"
                   href="<%=request.getContextPath()%>/ServletFinalFantasy?action=borrar&id=<%=object.getIdObjeto()%>">
                  <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash" viewBox="0 0 16 16" style="padding: 0; margin: 0">
                    <path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z"/>
                    <path fill-rule="evenodd" d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4 4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z"/>
                  </svg>
                </a>
              </td>
            </tr>
            </tbody>
            <%}%>
          </table>
          <!-- end table-style -->
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
