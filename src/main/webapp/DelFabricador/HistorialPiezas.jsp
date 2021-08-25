

<%@page import="com.mycompany.proyecto1ipc2.ConexionSQL"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@5.15.4/css/fontawesome.min.css" integrity="sha384-jLKHWM3JRmfMU0A5x5AkjWkw/EYfGUAGagvnfryNV3F9VqM98XiIH7VBGVoxVSc7" crossorigin="anonymous">

        <title>Historial de piezas</title>
    </head>

    <body>
        <div class="container margin">
            <div  class="row">
                <div class="col-sm">
                    <h2>HISTORIAL DE PIEZAS USADAS Y NO USADAS</h2>
                    <table class="table table-dark">
                        <thead>
                            <tr>
                                <th scope="col">#</th>
                                <th scope="col">Tipo</th>
                                <th scope="col">Costo</th>
                                <th scope="col">Usada No(0) Si(1)</th>
                            </tr>
                        </thead>
                        <tbody>

                            <%
                                ConexionSQL.traerTablaPiezasHistorial();
                                while (ConexionSQL.result.next()) {
                            %>
                            <tr>
                                <th scope="row"><%=ConexionSQL.result.getString(1)%></th>
                                <th><%=ConexionSQL.result.getString(2)%></th>
                                <th><%=ConexionSQL.result.getString(3)%></th>
                                <th><%=ConexionSQL.result.getString(4)%></th>
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
