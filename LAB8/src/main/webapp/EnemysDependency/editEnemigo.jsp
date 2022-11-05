<%@ page import="com.example.lab8.Beans.Enemigo" %><%--
  Created by IntelliJ IDEA.
  User: USUARIO
  Date: 4/11/2022
  Time: 09:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="enemy" scope="request" type="com.example.lab8.Beans.Enemigo"/>
<jsp:useBean id="listaEnemigos" scope="request" type="java.util.ArrayList<com.example.lab8.Beans.Enemigo>"/>
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
                            <a class="nav-link text-white px-0" href="<%=request.getContextPath()%>/Heroes">Héroes</a>
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
                                <form method="POST" class="needs-validation" novalidate>
                                    <div class="row">
                                        <div class="col-md-4">
                                            <div class="form-group mb-5">
                                                <label for="nombre" class="text-black-300">Nombre</label>
                                                    <input type="text" id="nombre" class="form-control bg-transparent rounded-0 border-bottom shadow-none pb-15 px-0" name="nombre"  value="<%=enemy.getNombre()%>" required>
                                                <p class="invalid-feedback">¡Se necesita un nombre!</p>
                                            </div>
                                        </div>
                                        <div class="col-md-2">
                                            <div class="form-group mb-5">
                                                <label for="clase" class="text-black-300">Clase</label>
                                                <select class="d-block w-100">
                                                    <% for (Enemigo e: listaEnemigos) {%>
                                                    <option id="clase" name="clase" value="<%=e.getClase()%>" <%=(e.getIdClase()==enemy.getIdClase())?"selected":""%>><%=e.getIdClase()%></option>
                                                    <% } %>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-md-2">
                                            <div class="form-group mb-5">
                                                <label for="ataque" class="text-black-300">Ataque</label>
                                                <input type="number" id="ataque" class="form-control bg-transparent rounded-0 border-bottom shadow-none pb-15 px-0" name="ataque" value="<%=enemy.getAtaque()%>" required>

                                                <p class="invalid-feedback">¡Ingresa ataque!</p>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group mb-5">
                                                <label class="text-black-300">What Is This About?</label>
                                                <select class="d-block w-100">
                                                    <option value="1">Personal Proposal</option>
                                                    <option value="2">Business Purpose</option>
                                                    <option value="3">Want to say hello</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-md-12">
                                            <button type="submit" class="btn btn-sm btn-primary">Send Now <img src="images/arrow-right.png" alt=""></button>
                                        </div>
                                    </div>
                                </form>
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
