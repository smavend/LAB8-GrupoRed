
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <meta charset="utf-8">
    <title>Añadir Objetos</title>

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

        <div class="col-lg-10">
            <img class="img-fluid" src="images/addHero.png" alt="">

            <!-- https://staticg.sportskeeda.com/editor/2022/10/45ab6-16650758896894-1920.jpg para vista de enemigo individual-->
            <h1 class="text-white add-letter-space mt-4">Nuevo Héroe</h1>

            <br>

            <p>Aquí puede añadir objetos al juego</p>
            <br>
            <div class="d-flex justify-content-center">
                <div class="widget">
                    <h1 class="widget-title text-white d-inline-block mb-4">Creación de nuevo héroe</h1>
                    <br>
                    <form method="post" action="<%=request.getContextPath()%>/ServletHeroe?id=guardar">
                        <div class="input-group mb-3">
                            <span class="input-group-text" >Nombre</span>
                            <input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" id="nombre" name="nombre"  style="color:black ">
                        </div>
                        <div class="input-group mb-3">
                            <span class="input-group-text" >Edad</span>
                            <input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default"  id="edad" name="edad" style="color:black">
                        </div>
                        <div class="input-group mb-3">
                            <label class="input-group-text" for="genero">Options</label>
                            <select class="form-select" id="genero" name="genero">
                                <option selected>Escoger...</option>
                                <option value="M">Masculino</option>
                                <option value="F">Femenino</option>
                                <option value="O">Otros</option>
                            </select>
                        </div>
                        <div class="input-group mb-3">
                            <span class="input-group-text" >Clase</span>
                            <input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default"  id="clase" name="clase" style="color:black">
                        </div>
                        <div class="input-group mb-3">
                            <span class="input-group-text" >Nivel Inicial</span>
                            <input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" id="nivelInicial" name="nivelInicial" style="color:black">
                        </div>
                        <div class="input-group mb-3">
                            <span class="input-group-text" >Ataque</span>
                            <input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" id="ataque" name="ataque" style="color:black">
                        </div>
                        <div class="input-group mb-3">
                            <span class="input-group-text" >Pareja</span>
                            <input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" id="pareja" name="pareja" style="color:black">
                        </div>
                        <div class="d-flex justify-content-center">
                            <button type="submit" class="btn btn-primary">Confirmar</button>
                        </div>
                    </form>
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
