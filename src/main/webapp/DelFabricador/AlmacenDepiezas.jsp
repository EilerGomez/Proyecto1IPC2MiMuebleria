<%-- 
    Document   : AlmacenDepiezas
    Created on : 24/08/2021, 12:29:57 AM
    Author     : HP
--%>

<%@page import="com.mycompany.proyecto1ipc2.ConexionSQL"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@5.15.4/css/fontawesome.min.css" integrity="sha384-jLKHWM3JRmfMU0A5x5AkjWkw/EYfGUAGagvnfryNV3F9VqM98XiIH7VBGVoxVSc7" crossorigin="anonymous">

        <title>JSP Page</title>
    </head>
    <body>
        <div class="container margin">
            <div  class="row">
                <div class="col-sm">
                    <h2>PIEZAS NO USADAS SERVICIO EXCLUSIVO PARA ENSAMBLADORES</h2>
                    <table class="table table-dark">
                        <thead>
                            <tr>
                                <th scope="col">#</th>
                                <th scope="col">Tipo</th>
                                <th scope="col">Costo de compra</th>
                                <th scope="col">Acciones-</th>

                            </tr>
                        </thead>
                        <tbody>

                            <%
                                ConexionSQL.traerPiezasNoUsadas();
                                while (ConexionSQL.result.next()) {
                            %>
                            <tr>
                                <th scope="row"><%=ConexionSQL.result.getString(1)%></th>
                                <th><%=ConexionSQL.result.getString(2)%></th>
                                <th><%=ConexionSQL.result.getString(3)%></th>
                                <th><a  href="DelFabricador/EditarPieza.jsp?id=<%=ConexionSQL.result.getString(1)%>&tipo=<%=ConexionSQL.result.getString(2)%>&costoCompra=<%=ConexionSQL.result.getString(3)%>
                                        "><img src="https://img.icons8.com/nolan/30/edit-property.png"/></a>
                                    <a class="icon mb-3" href="DelFabricador/EliminarPieza.jsp?id=<%=ConexionSQL.result.getString(1)%>"><img src="https://img.icons8.com/nolan/30/delete-property.png"/></a>
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
</body>
</html>
