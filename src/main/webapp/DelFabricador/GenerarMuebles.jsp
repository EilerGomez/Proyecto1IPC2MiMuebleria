<%-- 
    Document   : GenerarMuebles
    Created on : 25/08/2021, 10:25:58 PM
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
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
                            <label form="texto">Ingrese el precio del mueble</label>
                        </div>
                        <div class="mb-3">
                            <input type="number" placeholder="ingrese el precio" name="precioMuebleGenerado" required="requerido">
                            <br><br>
                            <button type="submit" class="btn btn-primary" name="generarMuebles">Generar</button>
                        </div>
                    </form>
                </div>
            </nav>
        </div>
    </body>
</html>
