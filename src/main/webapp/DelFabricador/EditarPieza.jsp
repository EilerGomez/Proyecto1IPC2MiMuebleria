<%-- 
    Document   : EditarPieza
    Created on : 27/08/2021, 04:59:36 PM
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html style="margin-top: 50px">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link href="Css/bootstrap-reboot.css" rel="stylesheet" type="text/css"/>

        <title>Editar Piezas</title>
    </head>
    <body bgcolor="#90b9e2">
        <%
            HttpSession sesion = request.getSession();
            if (sesion.getAttribute("logueado") == null || sesion.getAttribute("logueado").equals("0")) {
                response.sendRedirect(request.getContextPath() + "/index.jsp");
            }
        %>

        <div class="container margin">
            <div  class="row">
                <div class="col-sm">
                    <form class="row g-3 margin-r-5" method="post" action="servletEditarPiezas">
                        <div class="mb-3">
                            <input type="hidden" name="id" value="<%=request.getParameter("id")%>">
                        </div>
                        <div class="mb-3">
                            <label for="text" class="form-label">Tipo</label>
                            <input type="text" class="form-control" value="<%=request.getParameter("tipo")%>" required="Requerido" name="tipo">
                        </div>

                        <div class="mb-3">
                            <label for="text" class="form-label">Costo de compra</label>
                            <input type="number" class="form-control" value="<%=request.getParameter("costoCompra")%>" required="Requerido" name="costo">
                        </div>

                        <br><p>
                        <div class="col">
                            <a type="submit" class="btn btn-danger" href="${pageContext.request.contextPath}/AreaFabrica.jsp">Cancelar</a>
                            <button type="submit" class="btn btn-primary" name="editar" onclick="Mensaje()">Editar</button>
                        </div>
                        <script language="JavaScript" type="text/javascript">
                            function Mensaje()
                            {
                                alert("SE HA REALIZADO CORRECTAMENTE");
                            }
                        </script>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
