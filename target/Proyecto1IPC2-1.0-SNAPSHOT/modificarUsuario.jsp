

<%@page import="com.mycompany.proyecto1ipc2.ConexionSQL"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Datos del usuario</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

    </head>
    <body>
        <%
            HttpSession sesion = request.getSession();
            if (sesion.getAttribute("logueado") == null || sesion.getAttribute("logueado").equals("0")) {
                response.sendRedirect("index.jsp");
            }
        %>
        <div class="container">
            <nav class="navbar navbar-light bg-light">
                <div class="container-fluid">
                    <form action="ServletModificarUsuario" method="post">
                        <div class="mb-3">
                            <label for="nombre" class="form-label">Nombre</label>
                            <input type="text" class="form-control" name="nombre" value="<%=sesion.getAttribute("usuario")%>">
                        </div>
                        <div class="mb-3">
                            <label for="apellido" class="form-label">Apellido</label>
                            <input type="text" class="form-control" name="apellido" value="<%=sesion.getAttribute("apellido")%>">
                        </div>
                        <div class="mb-3">
                            <label for="contraseña" class="form-label">Contraseña</label>
                            <input type="password" class="form-control" name="password1">
                        </div>
                        <div class="mb-3">
                            <label for="contraseña" class="form-label">Confirmar Contraseña</label>
                            <input type="password" class="form-control" name="password2">
                        </div>
                        <button type="submit" class="btn btn-danger" name="volver"><img src="https://img.icons8.com/color/30/000000/back-sorting.png"/>Regresar</button>
                        <button type="submit" class="btn btn-primary" name="guardar"><img src="https://img.icons8.com/dusk/30/000000/save--v2.png"/>Guardar</button>
                    </form>
                </div>
        </div>
    </div>
</body>
<%
  
%>
</html>
