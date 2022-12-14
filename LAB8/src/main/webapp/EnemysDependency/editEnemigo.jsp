<%@ page import="com.example.lab8.Beans.Enemigo" %>
<%@ page import="com.example.lab8.Beans.Clase" %>
<%@ page import="com.example.lab8.Beans.Objeto" %><%--
  Created by IntelliJ IDEA.
  User: USUARIO
  Date: 4/11/2022
  Time: 09:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="enemy" scope="request" type="com.example.lab8.Beans.Enemigo"/>
<jsp:useBean id="listaEnemigos" scope="request" type="java.util.ArrayList<com.example.lab8.Beans.Enemigo>"/>
<jsp:useBean id="listaClases" scope="request" type="java.util.ArrayList<com.example.lab8.Beans.Clase>"/>
<jsp:useBean id="listaObjetos" scope="request" type="java.util.ArrayList<com.example.lab8.Beans.Objeto>"/>
<html>
    <head>
        <meta charset="utf-8">
        <title>Editar enemigo</title>

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
                    <div class="row">
                        <div class="col-md-10">
                            <div class="contact-form bg-dark">
                                <h1 class="text-white add-letter-space mb-5">Edita a tu enemigo</h1>
                                <form method="POST" class="needs-validation" action="<%=request.getContextPath()%>/Enemigos?post=edit" novalidate>
                                    <div class="row">
                                        <div class="col-lg-2 col-md-12 col-sm-12 col-12" hidden>
                                            <div class="form-group mb-5">
                                                <label for="idEnemigo" class="text-black-300">id Enemigo</label>
                                                <input type="text" id="idEnemigo" class="form-control bg-transparent rounded-0 border-bottom shadow-none pb-15 px-0" name="idEnemigo" value="<%=enemy.getIdEnemigo()%>">
                                            </div>
                                        </div>
                                        <div class="col-lg-3 col-md-12 col-sm-12 col-12">
                                            <div class="form-group mb-5">
                                                <label for="nombre" class="text-black-300">Nombre</label>
                                                    <input type="text" id="nombre" class="form-control bg-transparent rounded-0 border-bottom shadow-none pb-15 px-0" name="nombre"  value="<%=enemy.getNombre()%>" required>
                                                <p class="invalid-feedback">??Se necesita un nombre!</p>
                                            </div>
                                        </div>
                                        <div class="col-lg-2 col-md-12 col-sm-12 col-12">
                                            <div class="form-group mb-5">
                                                <label for="clase" class="text-black-300">Clase</label>
                                                <select id="clase" name="clase" class="d-block w-100">
                                                    <% for (Clase c: listaClases) {%>
                                                    <option value="<%=c.getIdClase()%>" <%=(c.getIdClase()==enemy.getIdClase())?"selected":""%>><%=c.getIdClase()%></option>
                                                    <% } %>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-lg-2 col-md-12 col-sm-12 col-12">
                                            <div class="form-group mb-5">
                                                <label for="ataque" class="text-black-300">Ataque</label>
                                                <input type="number" id="ataque" class="form-control bg-transparent rounded-0 border-bottom shadow-none pb-15 px-0" name="ataque" value="<%=enemy.getAtaque()%>" required>

                                                <p class="invalid-feedback">??Verifica el ataque!</p>
                                            </div>
                                        </div>
                                        <div class="col-lg-2 col-md-12 col-sm-12 col-12">
                                            <div class="form-group mb-5">
                                                <label for="experiencia" class="text-black-300">Experiencia</label>
                                                <input type="number" id="experiencia" class="form-control bg-transparent rounded-0 border-bottom shadow-none pb-15 px-0" name="experiencia" value="<%=enemy.getExperiencia()%>" required>

                                                <p class="invalid-feedback">??Verifica la experiencia!</p>
                                            </div>
                                        </div>
                                        <div class="col-lg-3 col-md-12 col-sm-12 col-12">
                                            <div class="form-group mb-5">
                                                <label for="idObjeto" class="text-black-300">Objeto que da</label>
                                                <select class="d-block w-100" id="idObjeto" name="idObjeto">
                                                    <% for (Objeto o: listaObjetos) {%>
                                                    <option value="<%=o.getIdObjeto()%>" <%=(enemy.getIdObjeto()==o.getIdObjeto())?"selected":""%>><%=o.getNombre()%></option>
                                                    <% } %>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-lg-6 col-md-12 col-sm-12 col-12">
                                            <div class="form-group mb-5">
                                                <label for="probObjeto" class="text-black-300">Probabilidad de que d?? el objeto</label>
                                                <input type="text" id="probObjeto" class="form-control bg-transparent rounded-0 border-bottom shadow-none pb-15 px-0" name="probObjeto" value="<%=enemy.getProbObjeto()%>" required>

                                                <p class="invalid-feedback">??Verifica la probabilidad!</p>
                                            </div>
                                        </div>
                                        <div class="col-lg-6 col-md-12 col-sm-12 col-12">
                                            <div class="form-group mb-5">
                                                <label for="genero" class="text-black-300">G??nero del enemigo</label>
                                                <select class="d-block w-100" id="genero" name="genero">
                                                    <option value="M" <%=(enemy.getGenero().equalsIgnoreCase("masculino"))?"selected":""%>>M</option>
                                                    <option value="F" <%=(enemy.getGenero().equalsIgnoreCase("femenino"))?"selected":""%>>F</option>
                                                    <option value="O" <%=(enemy.getGenero().equalsIgnoreCase("otro"))?"selected":""%>>O</option>
                                                    <option value="-" <%=(enemy.getGenero().equalsIgnoreCase("-"))?"selected":""%>>-</option>
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
                                                    <a href="<%=request.getContextPath()%>/Enemigo" class="btn btn-secondary">Cancelar</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </div>
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
