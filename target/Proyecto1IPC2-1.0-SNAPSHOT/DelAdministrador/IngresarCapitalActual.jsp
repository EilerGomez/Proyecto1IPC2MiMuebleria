<%-- 
    Document   : IngresarCapitalActual
    Created on : 5/09/2021, 08:19:59 PM
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
                    <h3>INGRESE LA CAPITAL CON LA QUE CUENTA AHORA</h3>
                    <form method="POST" action="agregarCapitalServlet">
                        <div class="mb-3">
                            <label form="texto">Ingrese la cantidad en Quetzales</label>
                        </div>
                        <div class="mb-3">
                            <input type="number" placeholder="Capital actual" name="capitalActual" required="requerido">
                        </div>
                        
                        <br><br>
                        <button type="submit" class="btn btn-primary" name="grabar">Grabar</button>
                    </form>
                </div>
            </nav>
        </div>
    </body>
</html>
