<%-- 
    Document   : cantidadPiezasMueble
    Created on : 25/08/2021, 05:28:16 PM
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ensamblar Muebles</title>
        
    </head>

    <body>
        <div class="container">
            <div class="row">
                <div class="col-sm">
                    <form method="post" action="servletNumeroPiezasMueble">
                        <div>
                            <label>Ingreser la cantidad de piezas del mueble</label>
                            <input type="number" name="cantidadPiezas">
                        </div>
                        <a id="cargarEnsamble"><button type="submit" class="btn btn-primary" name="cantidadPiezasMueble">Aplicar</button></a>
                    </form>
                    <div id="contenidoEnsamblar">


                    </div>
                </div>   
            </div>   
        </div>
    </body>
</html>
