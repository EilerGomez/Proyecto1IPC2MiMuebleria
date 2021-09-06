<%-- 
    Document   : modificarMuebleGenerado
    Created on : 5/09/2021, 11:58:20 AM
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html style="    background-color: #00c9ff;">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Modificar Mueble</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

    </head>
    <body style="margin-top: 200px;
          margin-left: 400px;
          margin-right: 400px;">
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
        <div class="container" style="background-color: #ffdb7f">
            <nav class="navbar navbar-light bg-light">
                <div class="container-fluid" style="background-color: aqua;">
                    <form action="ServletModificarMuebleGenerado" method="post">
                        <div class="mb-3">
                            <label for="nombre" class="form-label">Nombre</label>
                            <input type="text" class="form-control" name="nombre" value="<%=request.getParameter("nombre")%>">
                            <input type="hidden" name="id" value="<%=request.getParameter("id")%>">
                        </div>
                        <div class="mb-3">
                            <label for="apellido" class="form-label">Precio de venta</label>
                            <input type="number" class="form-control" name="precioVenta" value="<%=request.getParameter("precioVenta")%>">
                        </div>
                        <div class="mb-3">
                            <label for="apellido" class="form-label">Precio de Compra</label>
                            <input type="number" class="form-control" name="precioCompra" value="<%=request.getParameter("precioCompra")%>">
                        </div>

                        <button type="submit" class="btn btn-danger" name="volver"><img src="https://img.icons8.com/color/30/000000/back-sorting.png"/>Regresar</button>
                        <button type="submit" class="btn btn-primary" name="guardar"><img src="https://img.icons8.com/dusk/30/000000/save--v2.png"/>Guardar</button>
                    </form>
                </div>
        </div>

    </body>
</html>
