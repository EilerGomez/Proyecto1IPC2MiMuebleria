<%-- 
    Document   : PasarMuebleAventa
    Created on : 26/08/2021, 11:43:39 PM
    Author     : HP
--%>

<%@page import="com.mycompany.proyecto1ipc2.ConexionSQL"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h3>Presiona la figura para registrar los muebles a las ventas, si deseas editarlos ve al almacén de muebles</h3>
        <h2>No se aceptarán cambios despues de haber hecho su elección</h2>
        <div class="container margin">
            <div  class="row">
                <div class="col-sm">
                    <h2>ESTOS MUEBLES NO ESTAN AGREGADOS A LAS VENTAS</h2>
                    <table class="table table-dark">
                        <thead>
                            <tr>
                                <th scope="col">#código</th>
                                <th scope="col">Piezas Usadas</th>
                                <th scope="col">Usuario ensamblador</th>
                                <th scope="col">Fecha de ensamble</th>
                                <th scope="col">Costo</th>
                                <th scope="col">Tipo</th>
                                <th scope="col">Enviar a ventas</th>

                            </tr>
                        </thead>
                        <tbody>

                            <%
                                ConexionSQL.traerMueblesNoAlaVenta();
                                while (ConexionSQL.result.next()) {
                            %>

                            <tr>
                                <th scope="row"><%=ConexionSQL.result.getString(1)%></th>
                                <th ><%=ConexionSQL.result.getString(2)%></th>
                                <th><%=ConexionSQL.result.getString(3)%></th>
                                <th><%=ConexionSQL.result.getString(4)%></th>
                                <th><%=ConexionSQL.result.getString(5)%></th>
                                <th><%=ConexionSQL.result.getString(6)%></th>

                                <th><a href="DelFabricador/confirmarEnvioMueble.jsp?id=<%=ConexionSQL.result.getString(1)%>&nombre=<%=ConexionSQL.result.getString(6)%>"> <img src="https://img.icons8.com/nolan/30/send-file.png"/></a></th>


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
