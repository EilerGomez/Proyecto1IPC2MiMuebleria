

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="container">
            <div class="row">
                <div class="col-sm">
                    <form method="post" action="ServletEnviarNitParaFacturaCliente">
                        <div>
                            <label>Ingreser el nit del Cliente</label>
                            <input type="txt" name="nitCliente">
                        </div>
                        <a><button type="submit" class="btn btn-primary" name="enviarNit">Aplicar</button></a>
                    </form>
                </div>   
            </div>   
        </div>
    </body>
</html>
