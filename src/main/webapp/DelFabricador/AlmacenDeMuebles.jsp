

<%@page import="com.mycompany.proyecto1ipc2.ConexionSQL"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Almacen muebles</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@5.15.4/css/fontawesome.min.css" integrity="sha384-jLKHWM3JRmfMU0A5x5AkjWkw/EYfGUAGagvnfryNV3F9VqM98XiIH7VBGVoxVSc7" crossorigin="anonymous">

    </head>
    <body>
        <%
           HttpSession sesion = request.getSession();
            if (sesion.getAttribute("logueado") == null || sesion.getAttribute("logueado").equals("0")) {
                response.sendRedirect(request.getContextPath() + "/index.jsp");
            }
            if (!sesion.getAttribute("area").equals("1")) {
                response.sendRedirect(request.getContextPath() + "/index.jsp");
            }
        %>
        <div class="container margin">
            <div  class="row">
                <div class="col-sm">
                    <h2>MUEBLES QUE NO ESTAN AÚN AGREGADOS A LA VENTA</h2>
                    <table class="table table-dark">
                        <thead>
                            <tr>
                                <th scope="col">#código</th>
                                <th scope="col">Piezas Usadas</th>
                                <th scope="col">Usuario ensamblador</th>
                                <th scope="col">Fecha de ensamble</th>
                                <th scope="col">Costo</th>
                                <th scope="col">Tipo</th>
                                <th scope="col">Acciones</th>

                            </tr>
                        </thead>
                        <tbody>

                            <%
                                ConexionSQL.traerMueblesNoAlaVenta();
                                while (ConexionSQL.result.next()) {
                            %>
                            <tr>
                                <th scope="row"><%=ConexionSQL.result.getString(1)%></th>
                                <th><%=ConexionSQL.result.getString(2)%></th>
                                <th><%=ConexionSQL.result.getString(3)%></th>
                                <th><%=ConexionSQL.result.getString(4)%></th>
                                <th><%=ConexionSQL.result.getString(5)%></th>
                                <th><%=ConexionSQL.result.getString(6)%></th>
                                <th><a  href="DelFabricador/EditarMueble.jsp?id=<%=ConexionSQL.result.getString(1)%>&piezas=<%=ConexionSQL.result.getString(2)%>&usuario=<%=ConexionSQL.result.getString(3)%>
                                        &fecha=<%=ConexionSQL.result.getString(4)%>&costo=<%=ConexionSQL.result.getString(5)%>&tipo=<%=ConexionSQL.result.getString(6)%>"><img src="https://img.icons8.com/nolan/30/edit-property.png"/></a>
                                    <a class="icon mb-3" href="DelFabricador/EliminarMueble.jsp?id=<%=ConexionSQL.result.getString(1)%>"><img src="https://img.icons8.com/nolan/30/delete-property.png"/></a>
                                </th>
                            </tr>
                            <%

                                }
                                ConexionSQL.result.close();
                            %>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </body>
</html>
