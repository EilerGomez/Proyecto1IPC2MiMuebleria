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
        <title>Devolución en intervalo de tiempo </title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@5.15.4/css/fontawesome.min.css" integrity="sha384-jLKHWM3JRmfMU0A5x5AkjWkw/EYfGUAGagvnfryNV3F9VqM98XiIH7VBGVoxVSc7" crossorigin="anonymous">

        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

    </head>
    <body style="    margin-top: 100px;
          background-color:   #5c70b2;
          margin-left: 50px;
          margin-right: 50px;">
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

        <%
            String fechaDe = request.getParameter("comboanio") + "-" + request.getParameter("comboMes") + "-" + request.getParameter("comboDia");
            String fechaHasta = request.getParameter("comboanio2") + "-" + request.getParameter("comboMes2") + "-" + request.getParameter("comboDia2");
        %>

        <div class="container margin" style="    background-color: #f58080;">
            <div  class="row">
                <div class="col-sm">
                    <h2>DEVOLUCIÓN EN INTERVALO DE TIEMPO</h2>
                    <table class="table table-hover">
                        <thead>
                            <tr>
                                <th scope="col">Codigo Devolucion</th>
                                <th scope="col">Codigo de mueble</th>
                                <th scope="col">Nombre mueble</th>
                                <th scope="col">Nit Cliente</th>
                                <th scope="col">Nombre del cliente</th>
                                <th scope="col">Apellido</th>
                                <th scope="col">Pérdida</th>
                                <th scope="col">Fecha</th>

                            </tr>
                        </thead>
                        <tbody>

                            <%try{
                                ConSQLAdmin.traerDevolucionXtiempo(fechaDe, fechaHasta);
                                while (ConSQLAdmin.rs.next()) {
                            %>
                            <tr>
                                <th scope="row"><%=ConSQLAdmin.rs.getString(1)%></th>
                                <th><%=ConSQLAdmin.rs.getString(2)%></th>
                                <th><%=ConSQLAdmin.rs.getString(3)%></th>
                                <th><%=ConSQLAdmin.rs.getString(4)%></th>
                                <th><%=ConSQLAdmin.rs.getString(5)%></th>
                                <th><%=ConSQLAdmin.rs.getString(6)%></th>
                                <th><%=ConSQLAdmin.rs.getString(7)%></th>
                                <th><%=ConSQLAdmin.rs.getString(8)%></th>
                            </tr>
                            <%

                                }
                                ConSQLAdmin.rs.close();
                            }catch(SQLException e){

                            }
                            %>

                        </tbody>
                    </table>
                </div>
            </div><!-- comment -->

        </div>
        <br> <a href="<%=request.getContextPath()%>/AreaAdministrador.jsp" type="submit" class="btn btn-warning" style="margin-left: 340px">Regresar</a>
    </body>
</html>
