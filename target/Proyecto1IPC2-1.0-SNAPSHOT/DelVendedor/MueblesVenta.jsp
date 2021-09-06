<%-- 
    Document   : MueblesVenta
    Created on : 28/08/2021, 02:50:33 PM
    Author     : HP
--%>

<%@page import="com.mycompany.proyecto1ipc2.ConSQLVentas"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@5.15.4/css/fontawesome.min.css" integrity="sha384-jLKHWM3JRmfMU0A5x5AkjWkw/EYfGUAGagvnfryNV3F9VqM98XiIH7VBGVoxVSc7" crossorigin="anonymous">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

    </head>
    <body>
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
            <div  class="row">
                <div class="col-sm">
                    <h2>MUEBLES A LA VENTA</h2>
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th scope="col">#código</th>
                                <th scope="col">Piezas Usadas</th>
                                <th scope="col">Usuario ensamblador</th>
                                <th scope="col">Fecha de ensamble</th>
                                <th scope="col">Costo</th>
                                <th scope="col">Tipo</th>

                            </tr>
                        </thead>
                        <tbody>

                            <%
                                ConSQLVentas.traerMueblesAlaVenta();
                                while (ConSQLVentas.resultado.next()) {
                            %>
                            <tr>
                                <th scope="row"><%=ConSQLVentas.resultado.getString(1)%></th>
                                <th><%=ConSQLVentas.resultado.getString(2)%></th>
                                <th><%=ConSQLVentas.resultado.getString(3)%></th>
                                <th><%=ConSQLVentas.resultado.getString(4)%></th>
                                <th><%=ConSQLVentas.resultado.getString(5)%></th>
                                <th><%=ConSQLVentas.resultado.getString(6)%></th>
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
        </div>
    </body>
</html>
