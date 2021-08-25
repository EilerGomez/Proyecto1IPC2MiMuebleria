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
                    <h3>GENERAR NUEVA PIEZA</h3>
                    <form method="POST" action="AlmacenarPiezaVentaServlet">
                        <div class="mb-3">
                            <label form="texto">Ingrese el nombre de la pieza</label>
                        </div>
                        <div class="mb-3">
                            <input type="text" placeholder="ingrese el nombre de la pieza" name="nombrePiezaGenerada" required="requerido">
                        </div>
                        <div class="mb-3">
                            <label form="texto">Ingrese el precio de la pieza</label>
                        </div>
                        <div class="mb-3">
                            <input type="number" placeholder="ingrese el precio" name="precioPiezaGenerada" required="requerido">
                            <br><br>
                            <button type="submit" class="btn btn-primary" name="generarPiezaS">Generar</button>
                        </div>
                    </form>
                </div>
            </nav>
        </div>
    </body>
</html>
