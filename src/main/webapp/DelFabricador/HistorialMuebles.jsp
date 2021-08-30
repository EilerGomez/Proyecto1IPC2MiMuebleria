<%@page import="com.mycompany.proyecto1ipc2.ConexionSQL"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@5.15.4/css/fontawesome.min.css" integrity="sha384-jLKHWM3JRmfMU0A5x5AkjWkw/EYfGUAGagvnfryNV3F9VqM98XiIH7VBGVoxVSc7" crossorigin="anonymous">

    </head>
    <body>
        <div class="container margin">
            <div  class="row">
                <div class="col-sm">
                    <h2>HISTORIAL DE MUEBLES</h2>
                    <table class="table table-dark">
                        <thead>
                            <tr>
                                <th scope="col">#código</th>
                                <th scope="col">Piezas Usadas</th>
                                <th scope="col">Usuario ensamblador</th>
                                <th scope="col">Fecha de ensamble</th>
                                <th scope="col">Costo</th>
                                <th scope="col">Tipo</th><!-- comment -->
                                <th scope="col">En venta N(0) S(1)</th>
                                <th scope="col">Vendido N(0) S(1)</th>
                            </tr>
                        </thead>
                        <tbody>

                            <%
                                ConexionSQL.traerTablaMueblesHistorial();
                                while (ConexionSQL.result.next()) {
                            %>
                            <tr>
                                <th scope="row"><%=ConexionSQL.result.getString(1)%></th>
                                <th><%=ConexionSQL.result.getString(2)%></th>
                                <th><%=ConexionSQL.result.getString(3)%></th>
                                <th><%=ConexionSQL.result.getString(4)%></th>
                                <th><%=ConexionSQL.result.getString(5)%></th>
                                <th><%=ConexionSQL.result.getString(6)%></th>
                                <th><%=ConexionSQL.result.getString(7)%></th>
                                <th><%=ConexionSQL.result.getString(8)%></th>
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
