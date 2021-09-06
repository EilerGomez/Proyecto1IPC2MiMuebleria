<%-- 
    Document   : TablaConsultas
    Created on : 29/08/2021, 08:41:30 PM
    Author     : HP
--%>


<%@page import="java.sql.SQLException"%>
<%@page import="com.mycompany.proyecto1ipc2.ConSQLAdmin"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ventas maximas en intervalo de tiempo</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@5.15.4/css/fontawesome.min.css" integrity="sha384-jLKHWM3JRmfMU0A5x5AkjWkw/EYfGUAGagvnfryNV3F9VqM98XiIH7VBGVoxVSc7" crossorigin="anonymous">

        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

    </head>
     <%

            // validar usuario y contraseña:
            HttpSession sesion = request.getSession();
            if (sesion.getAttribute("logueado") == null || sesion.getAttribute("logueado").equals("0")) {
                response.sendRedirect(request.getContextPath() + "/index.jsp");
            }
            if (!sesion.getAttribute("area").equals("3")) {
                response.sendRedirect(request.getContextPath() + "/index.jsp");
            }
        %>
    <body style="    margin-top: 100px;
          background-color:    #e6d7c9;
          margin-left: 50px;
          margin-right: 50px;">

        <%
            String fechaDe = request.getParameter("comboanio") + "-" + request.getParameter("comboMes") + "-" + request.getParameter("comboDia");
            String fechaHasta = request.getParameter("comboanio2") + "-" + request.getParameter("comboMes2") + "-" + request.getParameter("comboDia2");
           String nombreMueble="";
        %>

        <div class="container margin" style="    background-color:#c9c9e6; ">
            <div  class="row">
                <div class="col-sm">

                    <%  try {
                            ConSQLAdmin.traerMuebleMasVendidoXtiempo(fechaDe, fechaHasta);
                            while (ConSQLAdmin.rs.next()) {
                    %>
                    <h2>Mueble mas vendido: <%=ConSQLAdmin.rs.getString(1)%>; <%=ConSQLAdmin.rs.getString(2)%></h2>
                    <%
                            nombreMueble += (ConSQLAdmin.rs.getString(1));
                        }
                        ConSQLAdmin.rs.close();
                    %>

                    <table class="table table-hover">
                        <thead>
                            <tr>
                                <th scope="col">Codigo Mueble</th>
                                <th scope="col">Nombre mueble</th>
                                <th scope="col">Precio Unitario</th>

                            </tr>
                        </thead>
                        <tbody>

                            <%
                                
                                ConSQLAdmin.traerDetallesMuebleMasVendido(nombreMueble,fechaDe,fechaHasta);
                                while (ConSQLAdmin.rs.next()) {

                            %>
                            <tr>
                                <th scope="row"><%=ConSQLAdmin.rs.getString(1)%></th>
                                <th><%=ConSQLAdmin.rs.getString(2)%></th>
                                <th><%=ConSQLAdmin.rs.getString(3)%></th>

                            </tr>
                            <%                                }
                                    ConSQLAdmin.rs.close();
                                } catch (SQLException e) {

                                }
                            %>

                        </tbody>
                    </table>
                </div>
            </div><!-- comment -->

        </div>
        <br> <a href="<%=request.getContextPath()%>/AreaAdministrador.jsp" type="submit" class="btn btn-primary" style="margin-left: 340px">Regresar</a>
    </body>
</html>
