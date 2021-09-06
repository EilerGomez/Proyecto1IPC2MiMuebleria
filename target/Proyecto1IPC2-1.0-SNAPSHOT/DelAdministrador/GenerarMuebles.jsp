

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
        <div>
            <nav >
                <div class="container-fluid ml-10">
                    <h3>GENERAR NUEVO MUEBLE</h3>
                    <form method="POST" action="servletGenerarMuebles">
                        <div class="mb-3">
                            <label form="texto">Ingrese el nombre del mueble</label>
                        </div>
                        <div class="mb-3">
                            <input type="text" placeholder="ingrese el nombre del mueble" name="nombreMuebleGenerado" required="requerido">
                        </div>
                        <div class="mb-3">
                            <label form="number">Ingrese el precio de venta </label>
                        </div>
                        <div class="mb-3">
                            <input type="number" placeholder="ingrese el precio" name="precioMuebleGenerado" required="requerido">
                        </div>
                        <div class="mb-3">
                            <label form="number">Ingrese el precio de compra</label>
                        </div>
                        <div class="mb-3">
                            <input type="number" placeholder="ingrese el precio" name="costoCompraMueble" required="requerido">
                        </div>
                        <br><br>
                        <button type="submit" class="btn btn-primary" name="generarMuebles">Generar</button>
                    </form>
                </div>
            </nav>
        </div>
    </body>
</html>
