
<%@page import="com.mycompany.proyecto1ipc2.ConexionSQL"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    HttpSession sesion = request.getSession();
    if (sesion.getAttribute("logueado") == null || sesion.getAttribute("logueado").equals("0")) {
        response.sendRedirect("index.jsp");
    }
    if(!sesion.getAttribute("area").equals("3")){
        response.sendRedirect("index.jsp");
    }
%>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Area de Administracion| Inicio</title>       
        <link rel="stylesheet" href="Css/bootstrap.min.css" type="text/css">


        <link href="Css/AdminLTE.min.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="Css/skin-blue.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    </head>

    <body class="hold-transition skin-blue sidebar-mini">
        <div class="wrapper">
            <!-- Main Header -->
            <header class="main-header"style="color: thistle";>
                <a href="#" class="logo">
                    <span class="logo-lg"><b>Administracion </b>Administracion</span>
                </a>

                <!-- Navegacion -->
                <nav class="navbar navbar-static-top" role="navigation" style="background-color: #6c98cc">
                    <!-- botón para abrir el menu-->
                    <a href="#"  data-toggle="push-menu" >

                       <img src="https://img.icons8.com/bubbles/64/000000/menu.png"/>
                    </a>
                    <div class="navbar-custom-menu">
                        <ul class="nav navbar-nav">
                            <li> <a href="NuevoUsuario.jsp"><img src="https://img.icons8.com/ios-glyphs/30/000000/add-user-male.png"/>Nuevo Usuario</a></li>                            
                            <li><a href="#" id="generarMuebles"><img src="https://img.icons8.com/nolan/30/office-chair-2.png"/>Generar muebles</a></li>
                            <li><a href="#" id="agregarCapital"><img src="https://img.icons8.com/fluency/30/000000/add-dollar.png"/>Agregar Capital</a></li>
                            <li><a href="DelAdministrador/CargaDeDatos.jsp" id="#"><img src="https://img.icons8.com/color-glass/30/000000/upload-to-ftp.png"/>Carga de datos</a></li>

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
                        <li class="active"><a href="#"><img src="https://img.icons8.com/fluency/30/000000/admin-settings-male.png"/></i> <span>Panel Administrativo</span></a></li>
                        <li class="treeview">
                            <a href="#"><img src="https://img.icons8.com/dusk/30/000000/blockchain-new-logo.png"/> <span>Registros</span>                               
                            </a>
                            <ul class="treeview-menu">

                                <li><a href="#" id="users"></i><img src="https://img.icons8.com/fluency/30/000000/group.png"/>Usuarios</a></li>
                                <li><a href="#" id="muebles"></i><img src="https://img.icons8.com/office/30/000000/office-chair-2.png"/>Muebles</a></li>
                            </ul>
                        </li>

                        

                    </ul>

                </section>
            </aside>

            <div class="content-wrapper" style="background-color: rgb(175 216 250)">
                <section class="content-header">
                    <h1>
                        Venta de muebles
                        <small>Mi Mueblería</small>
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="logOut.jsp"> Inicio</a></li>
                        <li class="active">Panel de Area de ventas de muebles</li>
                    </ol>
                </section>

                <section class="content">
                    <div class="row">

                        <div  class="col-lg-3 col-xs-6">
                            <div class="small-box bg-gray">
                                <div class="inner">
                                    <h3>Consultar compras</h3>

                                    <p>Consultas de compras en x tiempo</p>
                                </div>
                                <div class="icon">
                                    <i class="ion ion-bag"></i>
                                    <a href="#" id="verificarComprasXTiempo"><img src="https://img.icons8.com/nolan/64/fast-cart.png" class="ion ion-bag"/></a>
                                </div>
                            </div>
                        </div>
                        <div  class="col-lg-3 col-xs-6">
                            <div class="small-box bg-blue-active">
                                <div class="inner">
                                    <h3>Buscar devoluciones</h3>

                                    <p>Consulta las devoluciones en x tiempo</p>
                                </div>
                                <div class="icon">
                                    <i class="ion ion-bag"></i>
                                    <a href="#" id="verificarDevoluciones"><img src="https://img.icons8.com/fluency/60/000000/internal.png"/></a>
                                </div>
                            </div>
                        </div>
                        <div  class="col-lg-3 col-xs-6">
                            <div class="small-box bg-green-active">
                                <div class="inner">
                                    <h3> Buscar ganancias</h3>

                                    <p>Consulta las ganancias en x tiempo</p>
                                </div>
                                <div class="icon">
                                    <i class="ion ion-bag"></i>
                                    <a href="#" id="gananciasXTiempo"><img src="https://img.icons8.com/office/60/000000/cash.png"/></a>
                                </div>
                            </div>
                        </div>
                          <div  class="col-lg-3 col-xs-6">
                            <div class="small-box bg-purple-active">
                                <div class="inner">
                                    <h3>Usuario maxVenta</h3>

                                    <p>Consulta el usuario que genera mas ventas</p>
                                </div>
                                <div class="icon">
                                    <i class="ion ion-bag"></i>
                                    <a href="#" id="UsuarioReportesMaxVentaXTiempo"><img src="https://img.icons8.com/bubbles/60/000000/user-male.png"/></a>
                                </div>
                            </div>
                        </div>
                         <div  class="col-lg-3 col-xs-6">
                            <div class="small-box bg-light-blue-gradient">
                                <div class="inner">
                                    <h3>Mueble maxVenta</h3>

                                    <p>Consulta el mueble mas vendido</p>
                                </div>
                                <div class="icon">
                                    <i class="ion ion-bag"></i>
                                    <a href="#" id="muebleMasVendidoXTiempo"><img src="https://img.icons8.com/color/60/000000/desk.png"/></a>
                                </div>
                            </div>
                        </div>
                        <div  class="col-lg-3 col-xs-6">
                            <div class="small-box bg-purple-gradient">
                                <div class="inner">
                                    <h3>Mueble minVenta</h3>

                                    <p>Consulta el mueble menos vendido</p>
                                </div>
                                <div class="icon">
                                    <i class="ion ion-bag"></i>
                                    <a href="#" id="muebleMenosVendidoXTiempo"><img src="https://img.icons8.com/color/48/000000/interior-accesories.png"/></a>
                                </div>
                            </div>
                        </div>


                    </div>
                </section>
                <fieldset style="margin-left: 100px;
                          margin-right: 100px;">
                    <div  id="Contenido">

                        <script type="text/javascript" src="Js/BotonesAdministrador.js"></script>

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
