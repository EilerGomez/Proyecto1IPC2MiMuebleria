
<%@page import="com.mycompany.proyecto1ipc2.ConexionSQL"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    HttpSession sesion = request.getSession();
    if (sesion.getAttribute("logueado") == null || sesion.getAttribute("logueado").equals("0")) {
        response.sendRedirect("index.jsp");
    }
%>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Area de Fábrica| Inicio</title>       
        <link rel="stylesheet" href="Css/bootstrap.min.css" type="text/css">


        <link href="Css/AdminLTE.min.css" rel="stylesheet" type="text/css"/>

        <link rel="stylesheet" href="Css/skin-blue.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    </head>

    <body class="hold-transition skin-blue sidebar-mini">
        <div class="wrapper">
            <!-- Main Header -->
            <header class="main-header">
                <a href="#" class="logo">
                    <span class="logo-lg"><b>Sistema </b>de Fábrica</span>
                </a>

                <!-- Navegacion -->
                <nav class="navbar navbar-static-top" role="navigation">
                    <!-- botón para abrir el menu-->
                    <a href="#"  data-toggle="push-menu" >

                        <img src="https://img.icons8.com/nolan/64/drag-list-down.png"/>
                    </a>
                    <div class="navbar-custom-menu">
                        <ul class="nav navbar-nav">
                            <li><a href="#" id="ensamble"><img src="https://img.icons8.com/nolan/30/maintenance.png"/>Ensamblar muebles</a></li>
                            <li><a href="#" id="generarMuebles"><img src="https://img.icons8.com/nolan/30/office-chair-2.png"/>Generar muebles</a></li>
                            <li> <a href="#" id="generarPiezas"><img src="https://img.icons8.com/nolan/30/amazon-s3.png"/>Generar piezas</a></li>
                            <li class="dropdown user user-menu">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                    <img src="Images/AreaFabrica.png" class="user-image" alt="User Image">
                                    <!-- hidden-xs hides the username on small devices so only the image appears. -->
                                    <span class="hidden-xs"> <%=sesion.getAttribute("usuario")%> </span>
                                </a>


                                <ul class="dropdown-menu">
                                    <!-- The user image in the menu -->
                                    <li class="user-header">
                                        <img src="Images/AreaFabrica.png" class="img-circle" alt="User Image">

                                        <p>                    
                                            <%=sesion.getAttribute("usuario")%>
                                            <small>Usted es,<%=sesion.getAttribute("usuario")%> </small>
                                        </p>
                                    </li>
                                    <!-- Menu Footer-->
                                    <li class="user-footer">
                                        <div class="pull-right">
                                            <a href="logOut.jsp" class="btn btn-default btn-flat">Cerrar Session</a>
                                        </div>

                                        <div class="pull-right margin-r-5">
                                            <a href="modificarUsuario.jsp" class="btn btn-default btn-flat">   Mi cuenta  </a>
                                        </div>
                                    </li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                </nav>
            </header>
            <aside class="main-sidebar">
                <section class="sidebar">
                    <div class="user-panel">
                        <div class="pull-left image">
                            <img src="Images/AreaFabrica.png" class="img-circle" alt="User Image">
                        </div>
                        <div class="pull-left info">
                            <p>Bienvenido, <%=sesion.getAttribute("usuario")%>  </p>
                            <!-- Status -->
                            <a href="#"><svg xmlns="http://www.w3.org/2000/svg" x="0px" y="0px"
                                             width="10" height="10"
                                             viewBox="0 0 172 172"
                                             style=" fill:#000000;"><g fill="none" fill-rule="nonzero" stroke="none" stroke-width="1" stroke-linecap="butt" stroke-linejoin="miter" stroke-miterlimit="10" stroke-dasharray="" stroke-dashoffset="0" font-family="none" font-weight="none" font-size="none" text-anchor="none" style="mix-blend-mode: normal"><path d="M0,172v-172h172v172z" fill="none"></path><g><path d="M86,165.55c-43.8643,0 -79.55,-35.6857 -79.55,-79.55c0,-43.8643 35.6857,-79.55 79.55,-79.55c43.8643,0 79.55,35.6857 79.55,79.55c0,43.8643 -35.6857,79.55 -79.55,79.55z" fill="#0bfd39"></path><path d="M86,8.6c42.6775,0 77.4,34.7225 77.4,77.4c0,42.6775 -34.7225,77.4 -77.4,77.4c-42.6775,0 -77.4,-34.7225 -77.4,-77.4c0,-42.6775 34.7225,-77.4 77.4,-77.4M86,4.3c-45.1199,0 -81.7,36.5801 -81.7,81.7c0,45.1199 36.5801,81.7 81.7,81.7c45.1199,0 81.7,-36.5801 81.7,-81.7c0,-45.1199 -36.5801,-81.7 -81.7,-81.7z" fill="#2ecc71"></path></g></g></svg>

                                En línea</a>
                        </div>
                    </div>


                    <ul class="sidebar-menu" data-widget="tree">
                        <li class="header">INICIO</li>
                        <li class="active"><a href="#"><img src="https://img.icons8.com/nolan/30/manufacturing.png"/></i> <span>Panel Fabricación</span></a></li>
                        <li class="treeview">
                            <a href="#"><img src="https://img.icons8.com/nolan/30/blockchain-new-logo.png"/> <span>Registros</span>                               
                            </a>
                            <ul class="treeview-menu">

                                <li><a href="#" id="libro"></i><img src="https://img.icons8.com/nolan/30/literature.png"/>Libro de ensamble</a></li>
                                <li><a href="#" id="registrarMueble"></i><svg xmlns="http://www.w3.org/2000/svg" x="0px" y="0px"
                                                                              width="30" height="30"
                                                                              viewBox="0 0 172 172"
                                                                              style=" fill:#000000;"><defs><linearGradient x1="86" y1="18.8125" x2="86" y2="153.40519" gradientUnits="userSpaceOnUse" id="color-1_62186_gr1"><stop offset="0" stop-color="#1a6dff"></stop><stop offset="1" stop-color="#c822ff"></stop></linearGradient><linearGradient x1="37.625" y1="61.92538" x2="37.625" y2="77.83538" gradientUnits="userSpaceOnUse" id="color-2_62186_gr2"><stop offset="0" stop-color="#8ab4ff"></stop><stop offset="1" stop-color="#e492ff"></stop></linearGradient><linearGradient x1="69.875" y1="29.67538" x2="69.875" y2="45.58538" gradientUnits="userSpaceOnUse" id="color-3_62186_gr3"><stop offset="0" stop-color="#8ab4ff"></stop><stop offset="1" stop-color="#e492ff"></stop></linearGradient><linearGradient x1="102.125" y1="29.67538" x2="102.125" y2="45.58538" gradientUnits="userSpaceOnUse" id="color-4_62186_gr4"><stop offset="0" stop-color="#8ab4ff"></stop><stop offset="1" stop-color="#e492ff"></stop></linearGradient><linearGradient x1="134.375" y1="29.67538" x2="134.375" y2="45.58538" gradientUnits="userSpaceOnUse" id="color-5_62186_gr5"><stop offset="0" stop-color="#8ab4ff"></stop><stop offset="1" stop-color="#e492ff"></stop></linearGradient><linearGradient x1="37.625" y1="29.67538" x2="37.625" y2="45.58538" gradientUnits="userSpaceOnUse" id="color-6_62186_gr6"><stop offset="0" stop-color="#8ab4ff"></stop><stop offset="1" stop-color="#e492ff"></stop></linearGradient><linearGradient x1="37.625" y1="94.17538" x2="37.625" y2="110.08538" gradientUnits="userSpaceOnUse" id="color-7_62186_gr7"><stop offset="0" stop-color="#8ab4ff"></stop><stop offset="1" stop-color="#e492ff"></stop></linearGradient><linearGradient x1="37.625" y1="126.42538" x2="37.625" y2="142.33538" gradientUnits="userSpaceOnUse" id="color-8_62186_gr8"><stop offset="0" stop-color="#8ab4ff"></stop><stop offset="1" stop-color="#e492ff"></stop></linearGradient><linearGradient x1="86" y1="18.8125" x2="86" y2="153.40519" gradientUnits="userSpaceOnUse" id="color-9_62186_gr9"><stop offset="0" stop-color="#1a6dff"></stop><stop offset="1" stop-color="#c822ff"></stop></linearGradient><linearGradient x1="37.625" y1="61.92538" x2="37.625" y2="77.83538" gradientUnits="userSpaceOnUse" id="color-10_62186_gr10"><stop offset="0" stop-color="#8ab4ff"></stop><stop offset="1" stop-color="#e492ff"></stop></linearGradient><linearGradient x1="69.875" y1="29.67538" x2="69.875" y2="45.58538" gradientUnits="userSpaceOnUse" id="color-11_62186_gr11"><stop offset="0" stop-color="#8ab4ff"></stop><stop offset="1" stop-color="#e492ff"></stop></linearGradient><linearGradient x1="102.125" y1="29.67538" x2="102.125" y2="45.58538" gradientUnits="userSpaceOnUse" id="color-12_62186_gr12"><stop offset="0" stop-color="#8ab4ff"></stop><stop offset="1" stop-color="#e492ff"></stop></linearGradient><linearGradient x1="134.375" y1="29.67538" x2="134.375" y2="45.58538" gradientUnits="userSpaceOnUse" id="color-13_62186_gr13"><stop offset="0" stop-color="#8ab4ff"></stop><stop offset="1" stop-color="#e492ff"></stop></linearGradient><linearGradient x1="37.625" y1="29.67538" x2="37.625" y2="45.58538" gradientUnits="userSpaceOnUse" id="color-14_62186_gr14"><stop offset="0" stop-color="#8ab4ff"></stop><stop offset="1" stop-color="#e492ff"></stop></linearGradient><linearGradient x1="37.625" y1="94.17538" x2="37.625" y2="110.08538" gradientUnits="userSpaceOnUse" id="color-15_62186_gr15"><stop offset="0" stop-color="#8ab4ff"></stop><stop offset="1" stop-color="#e492ff"></stop></linearGradient><linearGradient x1="37.625" y1="126.42538" x2="37.625" y2="142.33538" gradientUnits="userSpaceOnUse" id="color-16_62186_gr16"><stop offset="0" stop-color="#8ab4ff"></stop><stop offset="1" stop-color="#e492ff"></stop></linearGradient><linearGradient x1="137.06413" y1="107.50826" x2="137.06413" y2="172" gradientUnits="userSpaceOnUse" id="color-17_62186_gr17"><stop offset="0" stop-color="#1a6dff"></stop><stop offset="1" stop-color="#c822ff"></stop></linearGradient></defs><g fill="none" fill-rule="nonzero" stroke="none" stroke-width="1" stroke-linecap="butt" stroke-linejoin="miter" stroke-miterlimit="10" stroke-dasharray="" stroke-dashoffset="0" font-family="none" font-weight="none" font-size="none" text-anchor="none" style="mix-blend-mode: normal"><path d="M0,172v-172h172v172z" fill="none" stroke="none"></path><g id="original-icon" stroke="none" opacity="0" visibility="hidden"><path d="M139.75,18.8125h-107.5c-7.40944,0 -13.4375,6.02806 -13.4375,13.4375v107.5c0,7.40944 6.02806,13.4375 13.4375,13.4375h107.5c7.40944,0 13.4375,-6.02806 13.4375,-13.4375v-107.5c0,-7.40944 -6.02806,-13.4375 -13.4375,-13.4375zM115.5625,83.3125h-26.875v-26.875h26.875zM120.9375,56.4375h26.875v26.875h-26.875zM88.6875,51.0625v-26.875h26.875v26.875zM83.3125,51.0625h-26.875v-26.875h26.875zM83.3125,56.4375v26.875h-26.875v-26.875zM51.0625,83.3125h-26.875v-26.875h26.875zM24.1875,88.6875h26.875v26.875h-26.875zM56.4375,88.6875h26.875v26.875h-26.875zM83.3125,120.9375v26.875h-26.875v-26.875zM88.6875,120.9375h26.875v26.875h-26.875zM88.6875,115.5625v-26.875h26.875v26.875zM120.9375,88.6875h26.875v26.875h-26.875zM147.8125,32.25v18.8125h-26.875v-26.875h18.8125c4.44513,0 8.0625,3.61737 8.0625,8.0625zM32.25,24.1875h18.8125v26.875h-26.875v-18.8125c0,-4.44513 3.61737,-8.0625 8.0625,-8.0625zM24.1875,139.75v-18.8125h26.875v26.875h-18.8125c-4.44513,0 -8.0625,-3.61737 -8.0625,-8.0625zM139.75,147.8125h-18.8125v-26.875h26.875v18.8125c0,4.44513 -3.61737,8.0625 -8.0625,8.0625z" fill="url(#color-1_62186_gr1)"></path><path d="M29.5625,61.8125h16.125v16.125h-16.125z" fill="url(#color-2_62186_gr2)"></path><path d="M61.8125,29.5625h16.125v16.125h-16.125z" fill="url(#color-3_62186_gr3)"></path><path d="M94.0625,29.5625h16.125v16.125h-16.125z" fill="url(#color-4_62186_gr4)"></path><path d="M126.3125,45.6875h16.125v-13.4375c0,-1.4835 -1.204,-2.6875 -2.6875,-2.6875h-13.4375z" fill="url(#color-5_62186_gr5)"></path><path d="M32.25,29.5625c-1.4835,0 -2.6875,1.204 -2.6875,2.6875v13.4375h16.125v-16.125z" fill="url(#color-6_62186_gr6)"></path><path d="M29.5625,94.0625h16.125v16.125h-16.125z" fill="url(#color-7_62186_gr7)"></path><path d="M29.5625,139.75c0,1.4835 1.204,2.6875 2.6875,2.6875h13.4375v-16.125h-16.125z" fill="url(#color-8_62186_gr8)"></path></g><g id="subtracted-icon" stroke="none"><path d="M153.1875,32.25l0,70.30038c-0.93967,-0.27796 -1.91335,-0.42025 -2.8996,-0.42025c-0.83762,0 -1.66844,0.10188 -2.4754,0.30221v-13.74484h-26.875v24.87868c-1.85744,0.41611 -3.65504,1.0146 -5.375,1.77687v-26.65555h-26.875v26.875h26.3917c-2.90657,1.35157 -5.58266,3.17393 -7.94005,5.375l-18.45165,0v26.875l8.17306,0c0.14836,1.82319 0.44697,3.62013 0.88921,5.375h-65.49977c-7.40944,0 -13.4375,-6.02806 -13.4375,-13.4375v-107.5c0,-7.40944 6.02806,-13.4375 13.4375,-13.4375h107.5c7.40944,0 13.4375,6.02806 13.4375,13.4375zM115.5625,56.4375h-26.875v26.875h26.875zM120.9375,83.3125h26.875v-26.875h-26.875zM115.5625,51.0625v-26.875h-26.875v26.875zM83.3125,24.1875h-26.875v26.875h26.875zM56.4375,56.4375v26.875h26.875v-26.875zM51.0625,56.4375h-26.875v26.875h26.875zM24.1875,115.5625h26.875v-26.875h-26.875zM56.4375,115.5625h26.875v-26.875h-26.875zM56.4375,120.9375v26.875h26.875v-26.875zM139.75,24.1875h-18.8125v26.875h26.875v-18.8125c0,-4.44513 -3.61737,-8.0625 -8.0625,-8.0625zM24.1875,32.25v18.8125h26.875v-26.875h-18.8125c-4.44513,0 -8.0625,3.61737 -8.0625,8.0625zM32.25,147.8125h18.8125v-26.875h-26.875v18.8125c0,4.44513 3.61737,8.0625 8.0625,8.0625z" fill="url(#color-9_62186_gr9)"></path><path d="M29.5625,77.9375h16.125v-16.125h-16.125z" fill="url(#color-10_62186_gr10)"></path><path d="M61.8125,45.6875h16.125v-16.125h-16.125z" fill="url(#color-11_62186_gr11)"></path><path d="M94.0625,45.6875h16.125v-16.125h-16.125z" fill="url(#color-12_62186_gr12)"></path><path d="M126.3125,45.6875h16.125v-13.4375c0,-1.4835 -1.204,-2.6875 -2.6875,-2.6875h-13.4375z" fill="url(#color-13_62186_gr13)"></path><path d="M32.25,29.5625c-1.4835,0 -2.6875,1.204 -2.6875,2.6875v13.4375h16.125v-16.125z" fill="url(#color-14_62186_gr14)"></path><path d="M29.5625,110.1875h16.125v-16.125h-16.125z" fill="url(#color-15_62186_gr15)"></path><path d="M29.5625,139.75c0,1.4835 1.204,2.6875 2.6875,2.6875h13.4375v-16.125h-16.125z" fill="url(#color-16_62186_gr16)"></path></g><g stroke="none"><g id="Layer_1" fill="url(#color-17_62186_gr17)"><path d="M127.70429,172h11.01817c3.53656,0 6.35023,-3.00715 6.35023,-6.71302v-8.06207c0,-3.70587 -2.81635,-6.72377 -6.35023,-6.72377h-9.88679c-2.54224,0 -4.69481,-1.98864 -5.00655,-4.62763c-0.18812,-1.62316 0.24186,-3.17914 1.20931,-4.38039c0.90026,-1.10182 2.17945,-1.74141 3.50163,-1.74141h16.59174v5.36128c0,2.04777 1.08569,3.89129 2.84054,4.81037c1.84621,0.95939 4.0391,0.69871 5.60045,-0.65572l15.63773,-14.01994c1.75216,-1.48342 2.78948,-3.77842 2.78948,-6.24542c0,-2.46699 -1.03732,-4.762 -2.8486,-6.29648l-15.54368,-13.93932c-1.60167,-1.38668 -3.79455,-1.64466 -5.62464,-0.69603c-1.76559,0.92714 -2.85397,2.77067 -2.85397,4.81843v5.36397h-17.9838c-13.55503,0 -24.77744,11.84856 -25.01392,26.41135v0.00269c-0.11018,7.02744 2.41593,13.74852 7.10806,18.92706c4.84799,5.34247 11.57714,8.40605 18.46483,8.40605zM138.72245,155.87586c0.55091,0 1.03463,0.62615 1.03463,1.34368v8.06207c0,0.71752 -0.48372,1.34368 -1.03463,1.34368h-11.01817c-5.37203,0 -10.65,-2.42131 -14.48217,-6.64315c-3.77036,-4.16272 -5.802,-9.57237 -5.71332,-15.22925v0c0.18812,-11.64969 8.99459,-21.12532 19.63652,-21.12532h23.3612v-10.42157l15.1137,13.54966c0.6584,0.56166 1.00507,1.36249 1.00507,2.24663c0,0.88414 -0.34667,1.68497 -0.94864,2.19557l-15.21851,13.64103l0.04837,-10.46188h-21.96646c-2.94534,0 -5.74288,1.3598 -7.67778,3.73274c-1.88921,2.34606 -2.73036,5.32097 -2.37294,8.38993c0.63422,5.34784 5.08179,9.37619 10.34633,9.37619z"></path></g><g id="Layer_1" fill="#000000" opacity="0"><path d="M177.37647,129.0037c0,4.03104 -1.69304,7.76646 -4.62225,10.29258l-15.66729,14.02801c-1.85428,1.63929 -4.24602,2.52612 -6.71839,2.55299c0.05375,0.42998 0.08062,0.88683 0.08062,1.34368v8.06207c0,6.66465 -5.26722,12.09311 -11.71688,12.09311h-11.01817c-8.41143,0 -16.581,-3.70855 -22.46631,-10.15821c-5.5897,-6.2078 -8.62642,-14.24299 -8.49205,-22.62755c0.29561,-17.4947 13.92051,-31.71082 30.39401,-31.71082h12.60371c0,-4.05791 2.20363,-7.71272 5.75094,-9.56699c1.47805,-0.77933 3.11733,-1.18244 4.7835,-1.18244c2.49924,0 4.91786,0.9137 6.90651,2.63361l15.50605,13.89364c2.98297,2.55299 4.676,6.31529 4.676,10.34633z"></path></g></g><path d="M102.12794,172v-64.49373h69.87206v64.49373z" id="overlay-drag" fill="#ff0000" stroke="none" opacity="0"></path></g></svg>
                                        Registrar Muebles(venta)</a></li>

                            </ul>
                        </li>
                        <li class="treeview">
                            <a href="#"><img src="https://img.icons8.com/nolan/30/fast-cart.png"/> <span>Compras</span>                               
                            </a>
                            <ul class="treeview-menu">

                                <li><a href="#" id="compras"><img src="https://img.icons8.com/nolan/30/impossible-shapes.png"/>Piezas</a></li>
                            </ul>
                        </li>
                        <li class="treeview">
                            <a href="#"><svg xmlns="http://www.w3.org/2000/svg" x="0px" y="0px"
                                             width="30" height="30"
                                             viewBox="0 0 172 172"
                                             style=" fill:#000000;"><defs><linearGradient x1="32.25" y1="138.07838" x2="32.25" y2="144.49613" gradientUnits="userSpaceOnUse" id="color-1_3fgGIGKPxseM_gr1"><stop offset="0" stop-color="#8ab4ff"></stop><stop offset="1" stop-color="#e492ff"></stop></linearGradient><linearGradient x1="139.75" y1="138.07838" x2="139.75" y2="144.49613" gradientUnits="userSpaceOnUse" id="color-2_3fgGIGKPxseM_gr2"><stop offset="0" stop-color="#8ab4ff"></stop><stop offset="1" stop-color="#e492ff"></stop></linearGradient><linearGradient x1="86" y1="20.18581" x2="86" y2="150.57794" gradientUnits="userSpaceOnUse" id="color-3_3fgGIGKPxseM_gr3"><stop offset="0" stop-color="#1a6dff"></stop><stop offset="1" stop-color="#c822ff"></stop></linearGradient><linearGradient x1="32.25" y1="138.07838" x2="32.25" y2="144.49613" gradientUnits="userSpaceOnUse" id="color-4_3fgGIGKPxseM_gr4"><stop offset="0" stop-color="#8ab4ff"></stop><stop offset="1" stop-color="#e492ff"></stop></linearGradient><linearGradient x1="139.75" y1="138.07838" x2="139.75" y2="144.49613" gradientUnits="userSpaceOnUse" id="color-5_3fgGIGKPxseM_gr5"><stop offset="0" stop-color="#8ab4ff"></stop><stop offset="1" stop-color="#e492ff"></stop></linearGradient><linearGradient x1="86" y1="20.18581" x2="86" y2="150.57794" gradientUnits="userSpaceOnUse" id="color-6_3fgGIGKPxseM_gr6"><stop offset="0" stop-color="#1a6dff"></stop><stop offset="1" stop-color="#c822ff"></stop></linearGradient><linearGradient x1="133.06219" y1="7.15969" x2="133.06219" y2="68.95994" gradientUnits="userSpaceOnUse" id="color-7_3fgGIGKPxseM_gr7"><stop offset="0" stop-color="#6dc7ff"></stop><stop offset="1" stop-color="#e6abff"></stop></linearGradient><linearGradient x1="133.06246" y1="1.78529" x2="133.06246" y2="74.33971" gradientUnits="userSpaceOnUse" id="color-8_3fgGIGKPxseM_gr8"><stop offset="0" stop-color="#1a6dff"></stop><stop offset="1" stop-color="#c822ff"></stop></linearGradient></defs><g fill="none" fill-rule="nonzero" stroke="none" stroke-width="1" stroke-linecap="butt" stroke-linejoin="miter" stroke-miterlimit="10" stroke-dasharray="" stroke-dashoffset="0" font-family="none" font-weight="none" font-size="none" text-anchor="none" style="mix-blend-mode: normal"><path d="M0,172v-172h172v172z" fill="none" stroke="none"></path><g id="original-icon" stroke="none" opacity="0" visibility="hidden"><rect x="10" y="52" transform="scale(2.6875,2.6875)" width="4" height="2" fill="url(#color-1_3fgGIGKPxseM_gr1)"></rect><rect x="50" y="52" transform="scale(2.6875,2.6875)" width="4" height="2" fill="url(#color-2_3fgGIGKPxseM_gr2)"></rect><path d="M155.875,53.75v-5.375c0,-2.95625 -2.41875,-5.375 -5.375,-5.375h-1.075l-9.40625,-17.2c-1.34375,-2.6875 -4.03125,-4.3 -6.9875,-4.3h-93.79375c-2.95625,0 -5.64375,1.6125 -6.9875,4.3l-9.675,17.2h-1.075c-2.95625,0 -5.375,2.41875 -5.375,5.375v5.375c0,2.95625 2.41875,5.375 5.375,5.375v86h-5.375v5.375h139.75v-5.375h-5.375v-86c2.95625,0 5.375,-2.41875 5.375,-5.375zM36.81875,28.21875c0.5375,-0.80625 1.34375,-1.34375 2.41875,-1.34375h93.79375c1.075,0 1.88125,0.5375 2.41875,1.34375l8.0625,14.78125h-114.75625zM21.5,48.375h129v5.375h-129zM26.875,139.75h10.75v5.375h-10.75zM100.5125,91.375l-1.075,-1.075c-1.075,-1.075 -2.41875,-1.6125 -3.7625,-1.6125h-19.35c-1.34375,0 -2.6875,0.5375 -3.7625,1.6125l-1.075,1.075h-28.4875v-8.0625h86v8.0625zM134.10625,77.9375l-96.48125,-0.26875l0.26875,-5.10625l96.48125,0.26875l-0.26875,5.10625c0.26875,0 0.26875,0 0,0zM43,145.125v-48.375h86v48.375zM134.375,145.125v-5.375h10.75v5.375zM145.125,134.375h-10.75v-51.0625c2.95625,0 5.375,-2.41875 5.375,-5.64375v-5.10625c0,-2.95625 -2.41875,-5.64375 -5.64375,-5.64375h-96.2125c-2.95625,0 -5.64375,2.41875 -5.64375,5.64375v5.10625c0,2.95625 2.41875,5.375 5.375,5.64375v51.0625h-10.75v-75.25h118.25z" fill="url(#color-3_3fgGIGKPxseM_gr3)"></path></g><g id="subtracted-icon" stroke="none"><path d="M37.625,145.125v-5.375h-10.75v5.375z" fill="url(#color-4_3fgGIGKPxseM_gr4)"></path><path d="M145.125,145.125v-5.375h-10.75v5.375z" fill="url(#color-5_3fgGIGKPxseM_gr5)"></path><path d="M150.5,145.125h5.375v5.375h-139.75v-5.375h5.375v-86c-2.95625,0 -5.375,-2.41875 -5.375,-5.375v-5.375c0,-2.95625 2.41875,-5.375 5.375,-5.375h1.075l9.675,-17.2c1.34375,-2.6875 4.03125,-4.3 6.9875,-4.3h55.8015c-1.92748,1.27417 -3.42067,3.13616 -4.25389,5.375h-51.54761c-1.075,0 -1.88125,0.5375 -2.41875,1.34375l-8.0625,14.78125l69.16211,0l5.62442,5.375h-82.04278v5.375l83.40373,0l-0.99733,5.375h-77.0314v75.25h10.75v-51.0625c-2.95625,-0.26875 -5.375,-2.6875 -5.375,-5.64375v-5.10625c0,-3.225 2.6875,-5.64375 5.64375,-5.64375l64.57398,0c-0.29746,2.03771 -0.05283,4.03224 0.66488,5.82547l-65.23885,-0.18172l-0.26875,5.10625l69.70582,0.19417c1.81954,1.21958 3.90726,1.8512 6.08855,1.8512c1.8273,0 3.65459,-0.4837 5.29379,-1.3436l0.08062,-0.05374l0.08062,-0.02687l0.68695,-0.39291l14.54491,0.04052c0.26875,0 0.26875,0 0,0l0.26875,-5.10625l-5.92814,-0.01651l4.61595,-2.64019l6.68719,3.82487v3.66933c0,3.225 -2.41875,5.64375 -5.375,5.64375v51.0625h10.75v-57.30124l2.12623,1.21614l0.02687,0.02687l0.13436,0.05374c0.99106,0.5275 2.02967,0.90286 3.08754,1.12043zM26.875,145.125h10.75v-5.375h-10.75zM129,91.375v-8.0625h-86v8.0625h28.4875l1.075,-1.075c1.075,-1.075 2.41875,-1.6125 3.7625,-1.6125h19.35c1.34375,0 2.6875,0.5375 3.7625,1.6125l1.075,1.075zM129,145.125v-48.375h-86v48.375zM145.125,145.125v-5.375h-10.75v5.375z" fill="url(#color-6_3fgGIGKPxseM_gr6)"></path></g><g stroke="none"><g id="Layer_1"><path d="M151.44265,44.56553c-1.3436,1.31673 -1.93478,3.19777 -1.63919,5.07881l3.22464,18.89102c0,0.08062 0.02687,0.21498 -0.13436,0.34934c-0.1881,0.13436 -0.32246,0.05374 -0.37621,0.02687l-15.747,-8.35719c-1.1555,-0.61806 -2.44535,-0.91365 -3.70834,-0.91365c-1.26298,0 -2.55284,0.29559 -3.70834,0.91365l-15.747,8.35719c-0.05374,0.02687 -0.1881,0.10749 -0.37621,-0.02687c-0.16123,-0.13436 -0.13436,-0.29559 -0.13436,-0.34934l3.22464,-18.91789c0.29559,-1.85417 -0.29559,-3.73521 -1.61232,-5.05194l-13.78534,-13.54349c-0.02687,-0.05374 -0.16123,-0.16123 -0.08062,-0.37621c0.05374,-0.21498 0.21498,-0.24185 0.26872,-0.24185l18.97164,-2.76782c1.88104,-0.29559 3.49336,-1.45109 4.29952,-3.1709l8.35719,-17.06373c0.05374,-0.10749 0.13436,-0.24185 0.32246,-0.24185c0.1881,0 0.26872,0.13436 0.32246,0.24185l8.35719,17.06373c0.80616,1.71981 2.41848,2.90218 4.29952,3.1709l18.97164,2.76782c0.05374,0.02687 0.21498,0.05374 0.26872,0.24185c0.08062,0.21498 -0.05374,0.34934 -0.08062,0.37621z" fill="url(#color-7_3fgGIGKPxseM_gr7)"></path><path d="M152.68145,74.33971c-0.91634,0 -1.83805,-0.22304 -2.6872,-0.6718l-0.07524,-0.043l-16.85681,-9.62824l-16.8595,9.62555c-2.01271,1.06951 -4.32639,0.91365 -6.11069,-0.3789c-1.7843,-1.28717 -2.66302,-3.43962 -2.29487,-5.60819l3.54979,-19.22692l-14.16155,-13.52737c-1.59082,-1.56664 -2.13901,-3.81583 -1.45646,-5.90109c0.67986,-2.08258 2.45073,-3.57129 4.61661,-3.88838l19.16512,-2.59584l8.3975,-17.44262c0.9862,-2.02078 2.95861,-3.26764 5.15405,-3.26764c2.19544,0 4.16785,1.24686 5.14868,3.25151l8.40019,17.45606l19.13824,2.59584c2.19544,0.31978 3.96631,1.81117 4.64617,3.89375c0.68255,2.08527 0.13436,4.33446 -1.42959,5.87153l-14.18842,13.55155l3.54173,19.19199c0.37621,2.20888 -0.50251,4.35864 -2.28681,5.64581c-0.99964,0.72823 -2.17126,1.09638 -3.35094,1.09638zM152.53634,68.93038c0.06987,0.03493 0.19617,0.07255 0.34934,-0.04031c0.18004,-0.12899 0.15317,-0.29022 0.14242,-0.35202l-4.06305,-22.01086l16.26025,-15.52933c0.01612,-0.01612 0.13167,-0.12899 0.06181,-0.34127c-0.06987,-0.21229 -0.22572,-0.23379 -0.28753,-0.24185l-21.97593,-2.98279l-9.64974,-20.04652c-0.08868,-0.17467 -0.53475,-0.19348 -0.63149,0.01344l-9.64436,20.03308l-22.0028,2.98279c-0.03762,0.00537 -0.1881,0.02956 -0.25797,0.23916c-0.06987,0.21498 0.04568,0.32784 0.08868,0.37083l16.23338,15.50784l-4.07111,22.0458c-0.00269,0.0215 -0.03225,0.18273 0.15048,0.3144c0.17736,0.13167 0.3144,0.05643 0.37352,0.02687l19.44996,-11.10889z" fill="url(#color-8_3fgGIGKPxseM_gr8)"></path></g><g id="Layer_1" fill="#000000" opacity="0"><path d="M172.67215,38.7343l-12.0924,11.55496l3.03654,16.4188c0.72554,4.21891 -0.96739,8.38407 -4.43388,10.88316c-1.90791,1.39734 -4.16516,2.12289 -6.50303,2.12289c-1.80042,0 -3.60085,-0.45682 -5.26691,-1.3436l-0.13436,-0.05374l-0.02687,-0.02687l-14.18842,-8.11535l-14.18842,8.11535l-0.08062,0.02687l-0.08062,0.05374c-1.63919,0.8599 -3.46649,1.3436 -5.29379,1.3436c-2.33786,0 -4.56824,-0.72554 -6.47615,-2.12289c-3.46649,-2.4991 -5.15943,-6.63739 -4.43388,-10.93691l3.03654,-16.36505l-12.11928,-11.58184c-3.06341,-2.98279 -4.13829,-7.36293 -2.79469,-11.39373c1.31673,-4.0308 4.72947,-6.93298 9.00212,-7.55103l16.28444,-2.2035l7.14795,-14.86022c1.90791,-3.86957 5.72374,-6.28805 9.99639,-6.28805c4.27265,0 8.08847,2.39161 9.99639,6.28805l7.14795,14.86022l16.31131,2.2035c4.21891,0.61806 7.65852,3.52023 8.97525,7.55103c1.3436,4.0308 0.26872,8.38407 -2.82156,11.4206z"></path></g></g><path d="M95.44087,74.33971v-72.55442h75.24326v72.55442z" id="overlay-drag" fill="#ff0000" stroke="none" opacity="0"></path></g></svg>
                                <span>Bodega</span>                               
                            </a>
                            <ul class="treeview-menu">
                                <li><a href="#" id="almacenDePiezasNoUsadas"><img src="https://img.icons8.com/nolan/30/sketchfab.png"/>Almacén de Piezas</a></li>
                                <li><a href="#" id="almacenDeMueblesEnsamblados"><img src="https://img.icons8.com/nolan/30/table-1.png"/>Almacén de Muebles</a></li>
                            </ul>

                        </li>
                        <li class="treeview">
                            <a href="#"><img src="https://img.icons8.com/nolan/30/bearish.png"/><span>Reportes</span>
                            </a>
                            <ul class="treeview-menu">
                                <li><a href="#" id="historialMuebles">
                                        <svg xmlns="http://www.w3.org/2000/svg" x="0px" y="0px"
                                             width="30" height="30"
                                             viewBox="0 0 172 172"
                                             style=" fill:#000000;"><defs><linearGradient x1="38.96875" y1="126.033" x2="38.96875" y2="139.77419" gradientUnits="userSpaceOnUse" id="color-1_52147_gr1"><stop offset="0" stop-color="#8ab4ff"></stop><stop offset="1" stop-color="#e492ff"></stop></linearGradient><linearGradient x1="136.12456" y1="35.90231" x2="24.68738" y2="147.3395" gradientUnits="userSpaceOnUse" id="color-2_52147_gr2"><stop offset="0" stop-color="#1a6dff"></stop><stop offset="1" stop-color="#c822ff"></stop></linearGradient><linearGradient x1="38.96875" y1="126.033" x2="38.96875" y2="139.77419" gradientUnits="userSpaceOnUse" id="color-3_52147_gr3"><stop offset="0" stop-color="#8ab4ff"></stop><stop offset="1" stop-color="#e492ff"></stop></linearGradient><linearGradient x1="136.12456" y1="35.90231" x2="24.68738" y2="147.3395" gradientUnits="userSpaceOnUse" id="color-4_52147_gr4"><stop offset="0" stop-color="#1a6dff"></stop><stop offset="1" stop-color="#c822ff"></stop></linearGradient><linearGradient x1="134.06223" y1="85.79688" x2="134.06223" y2="154.11339" gradientUnits="userSpaceOnUse" id="color-5_52147_gr5"><stop offset="0" stop-color="#1a6dff"></stop><stop offset="1" stop-color="#c822ff"></stop></linearGradient><linearGradient x1="134.0625" y1="85.125" x2="134.0625" y2="155" gradientUnits="userSpaceOnUse" id="color-6_52147_gr6"><stop offset="0" stop-color="#1a6dff"></stop><stop offset="1" stop-color="#c822ff"></stop></linearGradient></defs><g fill="none" fill-rule="nonzero" stroke="none" stroke-width="1" stroke-linecap="butt" stroke-linejoin="miter" stroke-miterlimit="10" stroke-dasharray="" stroke-dashoffset="0" font-family="none" font-weight="none" font-size="none" text-anchor="none" style="mix-blend-mode: normal"><path d="M0,172v-172h172v172z" fill="none" stroke="none"></path><g id="original-icon" stroke="none" opacity="0" visibility="hidden"><path d="M38.96875,126.3125c-3.71066,0 -6.71875,3.00809 -6.71875,6.71875c0,3.71066 3.00809,6.71875 6.71875,6.71875c3.71066,0 6.71875,-3.00809 6.71875,-6.71875c0,-3.71066 -3.00809,-6.71875 -6.71875,-6.71875z" fill="url(#color-1_52147_gr1)"></path><path d="M107.38981,24.1875v0c5.39381,0 10.43825,1.87588 14.71406,5.45025l-17.52787,17.51444c-1.58025,1.57756 -2.451,3.6765 -2.451,5.9125c0,2.23331 0.87075,4.33494 2.44831,5.9125l8.45219,8.4495c1.58025,1.57756 3.67919,2.44831 5.9125,2.44831c2.23331,0 4.33494,-0.87075 5.9125,-2.44831l17.53056,-17.51713c3.82162,4.57412 5.68406,10.02706 5.40456,15.90194c-0.3225,6.74831 -3.56363,13.52888 -9.12944,19.092c-5.90444,5.90713 -13.08544,9.159 -20.21806,9.159c-5.31588,0 -10.36031,-1.82212 -14.58237,-5.2675l-4.02856,-3.28681l-3.4185,3.91837l-46.5905,53.39794c-2.69019,3.0745 -6.42044,4.84287 -10.50544,4.97994c-0.15588,0.00537 -0.31444,0.00806 -0.473,0.00806c-3.86194,0 -7.64056,-1.56412 -10.36838,-4.29194c-2.85144,-2.85144 -4.41019,-6.79669 -4.27581,-10.82794c0.13438,-4.03125 1.95112,-7.86631 4.97994,-10.51619l53.40869,-46.57437l3.90494,-3.40506l-3.25994,-4.02856c-6.32637,-7.81794 -7.14338,-18.75606 -2.03444,-27.22169c5.60075,-9.288 14.32169,-15.48806 23.3275,-16.58725c0.95675,-0.11288 1.92156,-0.172 2.86756,-0.172M107.38981,18.8125c-1.16369,0 -2.33544,0.07256 -3.51525,0.215c-10.63175,1.29806 -20.8335,8.45219 -27.28081,19.14575c-6.35863,10.535 -5.26212,23.83812 2.45906,33.37875l-53.40869,46.57169c-4.1495,3.63081 -6.63544,8.87413 -6.82088,14.38887c-0.18275,5.51206 1.94844,10.90856 5.848,14.80812c3.74906,3.74906 8.88488,5.86681 14.1685,5.86681c0.21769,0 0.43269,-0.00269 0.65037,-0.01075c5.58731,-0.18812 10.69088,-2.60419 14.37275,-6.81281l46.59319,-53.40331c5.30781,4.32956 11.56431,6.47687 17.97938,6.47687c8.31244,0 16.89363,-3.60394 24.02088,-10.7285c13.46706,-13.46437 14.35394,-32.11831 2.11238,-44.35719l-2.11238,-2.11237l-21.40594,21.38713c-0.58319,0.58319 -1.34644,0.87344 -2.11237,0.87344c-0.76594,0 -1.52919,-0.29025 -2.11237,-0.87344l-8.45219,-8.4495c-1.16638,-1.16638 -1.16638,-3.05837 0,-4.22475l21.40594,-21.38712l-2.11238,-2.11237c-5.64106,-5.64106 -12.73875,-8.64031 -20.27719,-8.64031zM82.52506,93.27506l-3.80013,-3.80013l-29.5625,29.5625l3.80013,3.80013z" fill="url(#color-2_52147_gr2)"></path></g><g id="subtracted-icon" stroke="none"><path d="M38.96875,126.3125c-3.71066,0 -6.71875,3.00809 -6.71875,6.71875c0,3.71066 3.00809,6.71875 6.71875,6.71875c3.71066,0 6.71875,-3.00809 6.71875,-6.71875c0,-3.71066 -3.00809,-6.71875 -6.71875,-6.71875z" fill="url(#color-3_52147_gr3)"></path><path d="M107.38981,24.1875c-0.946,0 -1.91081,0.05913 -2.86756,0.172c-9.00581,1.09919 -17.72675,7.29925 -23.3275,16.58725c-5.10894,8.46562 -4.29194,19.40375 2.03444,27.22169l3.25994,4.02856l-3.90494,3.40506l-53.40869,46.57437c-3.02881,2.64987 -4.84556,6.48494 -4.97994,10.51619c-0.13438,4.03125 1.42437,7.9765 4.27581,10.82794c2.72781,2.72781 6.50644,4.29194 10.36838,4.29194c0.15856,0 0.31712,-0.00269 0.473,-0.00806c4.085,-0.13706 7.81525,-1.90544 10.50544,-4.97994l46.5905,-53.39794l3.4185,-3.91837l4.02856,3.28681c0.84846,0.69238 1.73013,1.3192 2.64053,1.87885c-1.32899,1.24733 -2.57364,2.58353 -3.72436,3.99899c-0.78957,-0.52682 -1.56228,-1.09753 -2.31586,-1.71222l-46.59319,53.40331c-3.68187,4.20863 -8.78544,6.62469 -14.37275,6.81281c-0.21769,0.00806 -0.43269,0.01075 -0.65037,0.01075c-5.28363,0 -10.41944,-2.11775 -14.1685,-5.86681c-3.89956,-3.89956 -6.03075,-9.29606 -5.848,-14.80812c0.18544,-5.51475 2.67138,-10.75806 6.82088,-14.38887l53.40869,-46.57169c-7.72119,-9.54063 -8.81769,-22.84375 -2.45906,-33.37875c6.44731,-10.69356 16.64906,-17.84769 27.28081,-19.14575c1.17981,-0.14244 2.35156,-0.215 3.51525,-0.215c7.53844,0 14.63612,2.99925 20.27719,8.64031l2.11238,2.11237l-21.40594,21.38713c-1.16638,1.16638 -1.16638,3.05837 0,4.22475l8.45219,8.4495c0.58319,0.58319 1.34644,0.87344 2.11238,0.87344c0.76594,0 1.52919,-0.29025 2.11238,-0.87344l21.40594,-21.38713l2.11238,2.11238c10.35454,10.35227 11.31615,25.29428 3.21663,37.80319c-1.76525,-0.64101 -3.58757,-1.16202 -5.45705,-1.55312c3.30998,-4.59085 5.21408,-9.6998 5.45736,-14.79039c0.2795,-5.87487 -1.58294,-11.32781 -5.40456,-15.90194l-17.53056,17.51713c-1.57756,1.57756 -3.67919,2.44831 -5.9125,2.44831c-2.23331,0 -4.33225,-0.87075 -5.9125,-2.44831l-8.45219,-8.4495c-1.57756,-1.57756 -2.44831,-3.67919 -2.44831,-5.9125c0,-2.236 0.87075,-4.33494 2.451,-5.9125l17.52787,-17.51444c-4.27581,-3.57437 -9.32025,-5.45025 -14.71406,-5.45025M52.96256,122.83756l-3.80013,-3.80013l29.5625,-29.5625l3.80013,3.80013z" fill="url(#color-4_52147_gr4)"></path></g><g stroke="none"><g id="Layer_1"><path d="M130.03125,133.5c-0.01344,0 -0.02688,0 -0.04031,0c-0.76056,-0.01075 -1.4835,-0.344 -1.98337,-0.91644l-9.40625,-10.75c-0.97556,-1.118 -0.86269,-2.81381 0.25531,-3.79206c1.11263,-0.97825 2.80844,-0.86806 3.79206,0.25263l7.44438,8.50862l15.43969,-16.63025c1.00512,-1.08844 2.71169,-1.15294 3.79744,-0.13975c1.08575,1.0105 1.15025,2.71169 0.13975,3.80013l-17.46875,18.8125c-0.51063,0.54288 -1.22281,0.85462 -1.96994,0.85462z" fill="url(#color-5_52147_gr5)"></path><path d="M134.0625,155c-19.264,0 -34.9375,-15.6735 -34.9375,-34.9375c0,-19.264 15.6735,-34.9375 34.9375,-34.9375c19.264,0 34.9375,15.6735 34.9375,34.9375c0,19.264 -15.6735,34.9375 -34.9375,34.9375zM134.0625,90.5c-16.29969,0 -29.5625,13.26281 -29.5625,29.5625c0,16.29969 13.26281,29.5625 29.5625,29.5625c16.29969,0 29.5625,-13.26281 29.5625,-29.5625c0,-16.29969 -13.26281,-29.5625 -29.5625,-29.5625z" fill="url(#color-6_52147_gr6)"></path></g><g id="Layer_1" fill="#000000" opacity="0"><path d="M134.0625,79.75c-22.22831,0 -40.3125,18.08419 -40.3125,40.3125c0,22.22831 18.08419,40.3125 40.3125,40.3125c22.22831,0 40.3125,-18.08419 40.3125,-40.3125c0,-22.22831 -18.08419,-40.3125 -40.3125,-40.3125z"></path></g></g><path d="M99.125,155v-69.875h69.875v69.875z" id="overlay-drag" fill="#ff0000" stroke="none" opacity="0"></path></g></svg>
                                        Reportes Hostorial Ensables</a>
                                </li>
                                <li> <a href="#" id="historialPiezas"><img src="https://img.icons8.com/nolan/30/four-squares.png"/>Reporte historial de piezas</a>
                                </li>
                            </ul>
                        </li>
                    </ul>

                </section>
            </aside>

            <div class="content-wrapper">
                <section class="content-header">
                    <h1>
                        Ensamble de muebles
                        <small>Mi Mueblería</small>
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="logOut.jsp"> Inicio</a></li>
                        <li class="active">Panel de Fabricacion de muebles</li>
                    </ol>
                </section>

                <section class="content" style="background-color: #50d2ff;">
                    <div class="row">
                        <%
                            ConexionSQL.traerPiezasAgotadas();
                            while (ConexionSQL.result.next()) {
                        %>
                        <div  class="col-lg-3 col-xs-6">
                            <div class="small-box bg-info">
                                <div class="inner">
                                    <h3>Cantidad: <%=ConexionSQL.result.getString("menores")%></h3>

                                    <p>Pieza Agotandose menores a 5</p>
                                    <p><%=ConexionSQL.result.getString("tipo")%></p>
                                </div>
                                <div class="icon">
                                    <i class="ion ion-bag"></i>
                                    <a href="#" id="compraDeAgotadas"><img src="https://img.icons8.com/nolan/64/fast-cart.png" class="ion ion-bag"/></a>
                                </div>
                            </div>
                        </div>
                        <%
                            }
                            ConexionSQL.result.close();
                        %>

                    </div>
                </section>
                <fieldset>
                    <div  id="Contenido" style="
                          background-color: #c3d7fb;
                          ">


                        <script type="text/javascript" src="Js/BotonesFabrica.js"></script>
                    </div>
                </fieldset>

            </div>


            <footer class="main-footer ">
                <div class="pull-right hidden-xs">
                    Sociedad Anónima
                </div>
                <strong>Copyright &CompanyMuebles; 2021 <a href="#">MI</a>.</strong>
            </footer>

            <div class="control-sidebar-bg"></div>
        </div>

        <script src="Js/jquery.min.js"></script>
        <script src="Js/bootstrap.min.js"></script>
        <script src="Js/adminlte.min.js"></script>


    </body>
</html>
<%
    /*} else {
        response.sendRedirect("identificar.jsp");
    }*/
%>
