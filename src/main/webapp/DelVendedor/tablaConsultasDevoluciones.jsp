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
        <title>Devoluciones</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@5.15.4/css/fontawesome.min.css" integrity="sha384-jLKHWM3JRmfMU0A5x5AkjWkw/EYfGUAGagvnfryNV3F9VqM98XiIH7VBGVoxVSc7" crossorigin="anonymous">

        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

    </head>
    <body style="    margin-top: 100px;
          background-color: #5b7095;
          margin-left: 50px;
          margin-right: 50px;">
        <%
            String nitCliente = request.getParameter("nitCliente");
            String fechaDe = request.getParameter("comboanio") + "-" + request.getParameter("comboMes") + "-" + request.getParameter("comboDia");
            String fechaHasta = request.getParameter("comboanio2") + "-" + request.getParameter("comboMes2") + "-" + request.getParameter("comboDia2");
        %>
        <div class="container margin" style="    background-color: #ccb0b0;">
            <div  class="row">
                <div class="col-sm">
                    <h2>DEVOLUCIONES DEL CLIENTE</h2>
                    <table class="table table-hover">
                        <thead>
                            <tr>
                                <th scope="col">Codigo devolucion</th>
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
                                ConSQLVentas.consultarDevoluciones(nitCliente, fechaDe, fechaHasta);
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
                            <br> <a href="<%=request.getContextPath()%>/AreaVentas.jsp" type="submit" class="btn btn-danger" style="margin-left: 340px">Regresar</a>
    </body>
</html>
