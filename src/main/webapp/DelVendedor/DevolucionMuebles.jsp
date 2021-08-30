<%-- 
    Document   : NuevaVenta
    Created on : 27/08/2021, 11:52:41 PM
    Author     : HP
--%>

<%@page import="com.mycompany.proyecto1ipc2.ConexionSQL"%>
<%@page import="java.sql.SQLException"%>
<%@page import="com.mycompany.proyecto1ipc2.ConSQLVentas"%>
<%@page import="servletOfVentas.servletVerificarNitCliente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html style="margin: 100px">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Devolucion de un mueble</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link href="Css/bootstrap-reboot.css" rel="stylesheet" type="text/css"/>

    </head>
    <body style="background-color: #aabbe5">
        <%

            // validar usuario y contraseña:
            HttpSession sesion = request.getSession();
            if (sesion.getAttribute("logueado") == null || sesion.getAttribute("logueado").equals("0")) {
                response.sendRedirect("index.jsp");
            }
        %>
        <div class="container margin">
            <div  class="row">
                <div class="col-sm">
                    <form method="post"action="servletRegistrarDevolucion" >
                        <h2>INGRESA LOS DATOS PARA REGISTRAR LA DEVOLUCIÓN</h2>
                        <div class="mb-3">
                            <label for="text" class="form-label">Código de la compra o factura</label>
                            <input type="number" class="form-control" name="codigoFactura" placeholder="Ingrese el código de la factura" required="requerido">
                        </div>
                        
                            <div class="mb-3">

                                <h6> Ingrese la fecha DE HOY en formato año/mes/día</h6>

                                <select class="form-select" aria-label="Default select example" name="comboanio">
                                    <%
                                        for (int i = 2020; i <= 2030; i++) {
                                    %>
                                    <option value="<%=i%>"><%=i%></option>
                                    <%
                                        }
                                    %>
                                </select>
                                <select class="form-select" aria-label="Default select example" name="comboMes">
                                    <%
                                        for (int i = 1; i <= 12; i++) {
                                    %>
                                    <option value="<%=i%>"><%=i%></option>
                                    <%
                                        }
                                    %>
                                </select>
                                <select class="form-select" aria-label="Default select example" name="comboDia">
                                    <%
                                        for (int i = 1; i <= 31; i++) {
                                    %>
                                    <option value="<%=i%>"><%=i%></option>
                                    <%
                                        }
                                    %>
                                </select>
                            </div>
                            <div class="mb-3">
                                <a href="<%=request.getContextPath()%>/AreaVentas.jsp" type="submit" class="btn btn-danger">Regresar</a>
                                <a> <button type="submit" class="btn btn-primary" name="BtnaceptaDevolucion" onclick="Mensaje()">Aceptar</button></a>
                            </div>
                            <script language="JavaScript" type="text/javascript">
                                function Mensaje()
                                {
                                    alert("Advertencia: si te envía a la página principal: SE REALIZÓ CORRECTAMENTE; En el caso contrario te indicará el error");
                                }
                            </script>
                    </form>
                </div>
            </div>
        </div>
    </body>
    <%
        servletVerificarNitCliente.nombre = "";
        servletVerificarNitCliente.apellido = "";
        servletVerificarNitCliente.direccion = "";
    %>
</html>
