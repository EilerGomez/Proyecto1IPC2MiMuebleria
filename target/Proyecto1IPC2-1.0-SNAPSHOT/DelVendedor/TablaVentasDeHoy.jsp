<%-- 
    Document   : TablaConsultas
    Created on : 29/08/2021, 08:41:30 PM
    Author     : HP
--%>

<%@page import="servletOfVentas.servletTraerConsultaCompras"%>
<%@page import="com.mycompany.proyecto1ipc2.ConSQLVentas"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Compras de hoy </title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@5.15.4/css/fontawesome.min.css" integrity="sha384-jLKHWM3JRmfMU0A5x5AkjWkw/EYfGUAGagvnfryNV3F9VqM98XiIH7VBGVoxVSc7" crossorigin="anonymous">

        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

    </head>
    <body style="    margin-top: 100px;
          background-color: #58667f;
          margin-left: 50px;
          margin-right: 50px;">
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
        <%
        java.sql.Date date = new java.sql.Date(new java.util.Date().getTime());
        %>
        <div class="container margin" style="    background-color: #f58080;">
             <br> <a href="<%=request.getContextPath()%>/AreaVentas.jsp" type="submit" class="btn btn-warning" style="margin-left: 1020px">Regresar</a>
            <div  class="row">
                <div class="col-sm">
                    <h2>COMPRAS DEL DIA DE HOY <%=date.toString()%></h2>
                    <table class="table table-hover">
                        <thead>
                            <tr>
                                <th scope="col">Codigo de venta</th>
                                <th scope="col">Codigo de mueble</th>
                                <th scope="col">Nombre mueble</th>
                                <th scope="col">Nit cliente</th>
                                <th scope="col">Nombre cliente</th>
                                <th scope="col">Apellido cliente</th>
                                <th scope="col">Fecha venta</th>
                            </tr>
                        </thead>
                        <tbody>

                            <%
                                
                                
                                ConSQLVentas.traerVentasDeHoy((date.toString()));
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
                            </tr>
                            <%

                                }
                                ConSQLVentas.resultado.close();
                            %>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div><!-- comment -->

        </div>
       
    </body>
</html>
