<%-- 
    Document   : modificarMuebles
    Created on : 5/09/2021, 11:44:32 AM
    Author     : HP
--%>

<%@page import="com.mycompany.proyecto1ipc2.ConSQLAdmin"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
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
        <div class="col-sm">
            <h2>Muebles que puedes modificar</h2>
            <table class="table table-hover">
                <thead>
                    <tr>
                        <th scope="col">Identificador</th>
                        <th scope="col">Nombre</th>
                        <th scope="col">Precio de venta</th>
                        <th scope="col">Precio de compra</th>
                        <th scope="col">Modificar</th>

                    </tr>
                </thead>
                <tbody>

                    <%
                        try {
                            ConSQLAdmin.traerMueblesGenerados();
                            while (ConSQLAdmin.rs.next()) {
                    %>
                    <tr>
                        <th scope="row"><%=ConSQLAdmin.rs.getString(1)%></th>
                        <th><%=ConSQLAdmin.rs.getString(2)%></th>
                        <th><%=ConSQLAdmin.rs.getString(3)%></th>
                        <th><%=ConSQLAdmin.rs.getString(4)%></th>
                        <th><a href="DelAdministrador/modificarMuebleGenerado.jsp?id=<%=ConSQLAdmin.rs.getString("id")%>&nombre=<%=ConSQLAdmin.rs.getString(2)%>
                               &precioVenta=<%=ConSQLAdmin.rs.getString(3)%>&precioCompra=<%=ConSQLAdmin.rs.getString(4)%>">
                                <img src="https://img.icons8.com/color/48/000000/edit-property.png"/>
                            </a></th>
                    </tr>
                    <%
                            }
                            ConSQLAdmin.rs.close();
                        } catch (Exception e) {

                        }


                    %>
                    </tr>
                </tbody>
            </table>
        </div>
    </body>
</html>
