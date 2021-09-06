<%-- 
    Document   : AlmacenDeMuebles
    Created on : 26/08/2021, 10:54:34 PM
    Author     : HP
--%>

<%@page import="com.mycompany.proyecto1ipc2.ConSQLVentas"%>
<%@page import="servletOfVentas.ServletEnviarNitParaFacturaCliente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Facturas de los clientes</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@5.15.4/css/fontawesome.min.css" integrity="sha384-jLKHWM3JRmfMU0A5x5AkjWkw/EYfGUAGagvnfryNV3F9VqM98XiIH7VBGVoxVSc7" crossorigin="anonymous">
        <link href="Css/bootstrap-reboot.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

    </head>
    <body style="margin-top: 100px; background-color: #bddae2">
         <%

            // validar usuario y contraseña:
            HttpSession sesion = request.getSession();
            if (sesion.getAttribute("logueado") == null || sesion.getAttribute("logueado").equals("0")) {
                response.sendRedirect(request.getContextPath() + "/index.jsp");
            }
            if (!sesion.getAttribute("area").equals("2")) {
                response.sendRedirect(request.getContextPath() + "/index.jsp");
            }
        %>
        <div class="container margin">
            <nav class="navbar navbar-light bg-light">
                <div class="container-fluid">
                    <a class="navbar-brand">Registro de Facturas</a>
                    <form class="d-flex" action="<%=request.getContextPath()%>/AreaVentas.jsp">
                        <a href="#"> <img src="https://img.icons8.com/ios-filled/50/000000/user.png"/> <%=sesion.getAttribute("usuario")%>
                        </a>
                        <button class="btn btn-outline-danger ml-2" type="submit" >Regresar</button>
                    </form>
                </div>
            </nav>
            <div  class="row" style="background-color: #4ab7e6">
                <div class="col-sm">
                    <h2>FACTURAS DE LOS CLIENTES</h2>
                    <table class="table table-hover">
                        <thead>
                            <tr>
                                <th scope="col">#Factura</th>
                                <th scope="col">Nit cliente</th>
                                <th scope="col">Nombre</th>
                                <th scope="col">Apellido</th>
                                <th scope="col">Usuario</th>
                                <th scope="col">Código del mueble</th>
                                <th scope="col">Nombre</th>
                                <th scope="col">Fecha</th>
                                <th scope="col">Observar Detalles</th>

                            </tr>
                        </thead>
                        <tbody>

                            <%
                                ConSQLVentas.traerVentaParaFactura(ServletEnviarNitParaFacturaCliente.nitCliente);
                                while (ConSQLVentas.resultado.next()) {
                            %>
                            <tr>
                                <th scope="row"><%=ConSQLVentas.resultado.getString(1)%></th>
                                <th><%=ConSQLVentas.resultado.getString(2)%></th>
                                <th><%=ConSQLVentas.resultado.getString(3)%></th>
                                <th><%=ConSQLVentas.resultado.getString(4)%></th>
                                <th><%=ConSQLVentas.resultado.getString(5)%></th>
                                <th><%=ConSQLVentas.resultado.getString(6)%></th>
                                <th><%=ConSQLVentas.resultado.getString(7)%></th>
                                <th><%=ConSQLVentas.resultado.getString(8)%></th>
                                <th><a id="VerFactura" style="margin-left: 50px" class="margin-r-5" href="VistaImprimirFactura.jsp?numFac=<%=ConSQLVentas.resultado.getString(1)%>&nit=<%=ConSQLVentas.resultado.getString(2)%>&nombreCliente=<%=ConSQLVentas.resultado.getString(3)%>
                                       &apellido=<%=ConSQLVentas.resultado.getString(4)%>&usuario=<%=ConSQLVentas.resultado.getString(5)%>&idMueble=<%=ConSQLVentas.resultado.getString(6)%>
                                       &tipoMueble=<%=ConSQLVentas.resultado.getString(7)%> &fecha=<%=ConSQLVentas.resultado.getString(8)%>"><img src="https://img.icons8.com/nolan/30/view-details.png"/></a>
                                </th>
                            </tr>
                            <%

                                }
                                ConSQLVentas.resultado.close();
                            %>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            <div id="ContenidoFactura">
                <script type="text/javascript" src="<%=request.getContextPath()%>/Js/traerVistaImprimirFactura.js"></script>
            </div>
        </div>
    </body>
</html>
