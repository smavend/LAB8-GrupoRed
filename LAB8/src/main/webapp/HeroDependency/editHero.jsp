<%@ page import="com.example.lab8.Beans.Heroes" %><%--
  Created by IntelliJ IDEA.
  User: USUARIO
  Date: 5/11/2022
  Time: 12:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="hero" scope="request" type="com.example.lab8.Beans.Heroes"/>
<jsp:useBean id="heroList" scope="request" type="java.util.ArrayList<com.example.lab8.Beans.Heroes>"/>
<html>
<head>
    <meta charset="utf-8">
    <title>Editar Héroe</title>

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

    <div class="container py-4 my-5">
        <div class="row">
            <div class="col-md-10">
                <img class="img-fluid" src="images/addHero.png" alt="">
                <div class="contact-form bg-dark">
                    <h1 class="text-white add-letter-space mb-5">Edita a tu héroe</h1>
                    <form method="POST" class="needs-validation" action="<%=request.getContextPath()%>/ServletHeroe?id=actualizar" novalidate>
                        <div class="row">
                            <div class="col-lg-2 col-md-12 col-sm-12 col-12" hidden>
                                <div class="form-group mb-5">
                                    <label for="id_up" class="text-black-300">id Hero</label>
                                    <input type="text" id="id_up" class="form-control bg-transparent rounded-0 border-bottom shadow-none pb-15 px-0" name="id_up" value="<%=hero.getIdHeroe()%>">
                                </div>
                            </div>
                            <div class="col-lg-3 col-md-12 col-sm-12 col-12">
                                <div class="form-group mb-5">
                                    <label for="nombre" class="text-black-300">Nombre</label>
                                    <input type="text" id="nombre" class="form-control bg-transparent rounded-0 border-bottom shadow-none pb-15 px-0" name="nombre"  value="<%=hero.getNombre()%>" required>
                                    <p class="invalid-feedback">¡Se necesita un nombre!</p>
                                </div>
                            </div>
                            <div class="col-lg-2 col-md-12 col-sm-12 col-12">
                                <div class="form-group mb-5">
                                    <label for="edad" class="text-black-300">Edad</label>
                                    <input type="number" id="edad" class="form-control bg-transparent rounded-0 border-bottom shadow-none pb-15 px-0" name="edad"  value="<%=hero.getEdad()%>" required>
                                    <p class="invalid-feedback">¡Se necesita una edad!</p>
                                </div>
                            </div>
                            <div class="col-lg-6 col-md-12 col-sm-12 col-12">
                                <div class="form-group mb-5">
                                    <label for="genero" class="text-black-300">Género del enemigo</label>
                                    <select class="d-block w-100" id="genero" name="genero">
                                        <option value="M" <%=(hero.getGenero().equalsIgnoreCase("M"))?"selected":""%>>M</option>
                                        <option value="F" <%=(hero.getGenero().equalsIgnoreCase("F"))?"selected":""%>>F</option>
                                        <option value="O" <%=(hero.getGenero().equalsIgnoreCase("O"))?"selected":""%>>O</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-lg-2 col-md-12 col-sm-12 col-12">
                                <div class="form-group mb-5">
                                    <label for="clase" class="text-black-300">Clase</label>
                                    <input type="text" id="clase" class="form-control bg-transparent rounded-0 border-bottom shadow-none pb-15 px-0" name="clase" value="<%=hero.getClase()%>" required>

                                    <p class="invalid-feedback">¡Verifica la clase!</p>
                                </div>
                            </div>
                            <div class="col-lg-2 col-md-12 col-sm-12 col-12">
                                <div class="form-group mb-5">
                                    <label for="nivelInicial" class="text-black-300">Nivel inicial</label>
                                    <input type="number" id="nivelInicial" class="form-control bg-transparent rounded-0 border-bottom shadow-none pb-15 px-0" name="nivelInicial" value="<%=hero.getNivelInicial()%>" required>

                                    <p class="invalid-feedback">¡Verifica el nivel!</p>
                                </div>
                            </div>
                            <div class="col-lg-2 col-md-12 col-sm-12 col-12">
                                <div class="form-group mb-5">
                                    <label for="ataque" class="text-black-300">Ataque</label>
                                    <input type="number" id="ataque" class="form-control bg-transparent rounded-0 border-bottom shadow-none pb-15 px-0" name="ataque" value="<%=hero.getAtaque()%>" required>

                                    <p class="invalid-feedback">¡Verifica el ataque!</p>
                                </div>
                            </div>
                            <div class="col-lg-3 col-md-12 col-sm-12 col-12">
                                <div class="form-group mb-5">
                                    <label for="pareja" class="text-black-300">Pareja Id</label>
                                    <select class="d-block w-100" id="pareja" name="pareja">
                                        <option value="0" <%=(hero.getIdPareja()==0)?"selected":""%>>Sin pareja</option>
                                        <% for (Heroes h: heroList) {
                                        if(h.getIdHeroe()!=hero.getIdHeroe()){%>
                                        <option value="<%=h.getIdHeroe()%>" <%=(h.getIdHeroe()==hero.getIdPareja())?"selected":""%>><%=h.getIdHeroe()%></option>
                                        <% }
                                        }%>
                                    </select>
                                </div>
                            </div>
                            <div class="row justify-content-start">
                                <div class="col-lg-6 col-md-6 col-sm-6 col-6">
                                    <div class="d-block">
                                        <button type="submit" class="btn btn-sm btn-primary">Confirmar</button>
                                    </div>
                                </div>
                                <div class="col-lg-6 col-md-6 col-sm-6 col-6">
                                    <div class="d-block">
                                        <a href="<%=request.getContextPath()%>/Heroes" class="btn btn-secondary">Cancelar</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <div style="position: fixed; bottom: 40px; right: 40px;" aria-live="polite" aria-atomic="true">
            <div class="toast text-black" id=toast" role="alert" aria-live="assertive" aria-atomic="true" data-delay="6000">
                <div class="toast-header">
                    <strong class="mr-auto text-danger">Alerta</strong>
                    <small>justo ahora</small>
                    <button type="button" class="ml-2 mb-1 close close-white" data-dismiss="toast" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="toast-body">
                    En caso de error, revise los datos e intente nuevamente.
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
    <script>
        $(document).ready(function (){
            $('.toast').toast('show');
        })
    </script>
</body>
</html>