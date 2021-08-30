

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
                    <form method="post" action="servletVerificarNitCliente">
                        <div>
                            <label>Ingrese el nit del cliente</label>
                            <input type="text" name="nitClienteVeridicar">
                        </div>
                        <a  id="cargarEnsamble" href="DelVendedor/NuevaVenta.jsp"><button style="font-size: 20px" type="submit" class="btn btn-primary" name="botonVerificar"><svg xmlns="http://www.w3.org/2000/svg" x="0px" y="0px"
                                    width="30" height="30"
                                    viewBox="0 0 64 64"
                                    style=" fill:#000000;"><path d="M 53 13 L 53 27.072266 L 31.210938 13.699219 L 29 15 L 29 27.085938 L 7.2109375 13.699219 L 5 15 L 5 49 L 7.2109375 50.300781 L 29 36.914062 L 29 49 L 31.210938 50.300781 L 53 36.927734 L 53 51 L 59 51 L 59 13 L 53 13 z"></path></svg>
                                ir</button></a>
                    </form>
                    <div id="contenidoEnsamblar">


                    </div>
                </div>   
            </div>   
        </div>
    </body>
</html>
