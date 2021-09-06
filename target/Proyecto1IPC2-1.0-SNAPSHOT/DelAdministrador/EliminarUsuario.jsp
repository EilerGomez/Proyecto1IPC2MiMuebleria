


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html style="MARGIN-TOP: 200PX;
      BACKGROUND-COLOR: #418382;">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Suspender un Usuario</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

    </head>
    <body style="MARGIN-LEFT: 400PX;
          MARGIN-RIGHT: 400PX;">
        <%
            HttpSession sesion = request.getSession();
            if (sesion.getAttribute("logueado") == null || sesion.getAttribute("logueado").equals("0")) {
                response.sendRedirect(request.getContextPath() + "/index.jsp");
            }
            if (!sesion.getAttribute("area").equals("3")) {
                response.sendRedirect(request.getContextPath() + "/index.jsp");
            }
        %>
        <div class="container">
            <nav class="navbar navbar-light bg-light">
                <div class="container-fluid">
                    <form action="servletSuspenderUsuario" method="post">
                        <div class="mb-3">
                            <label for="nombre" class="form-label">Usuario a Modificar: #<%=request.getParameter("id")%>; <%=request.getParameter("nombre")%></label>
                            <label for="eiqueta" class="form-label">Para suspender coloca en el siguiente texto un numero mayor a 3 si deseas reintegrarlo escibe 1 para el area de fabrica, 2 para el area de ventas o 3 para el area de administracion</label>
                            <input type="number" class="form-control" name="nuevaArea"  >
                            <input type="hidden" name="idActual" value="<%=request.getParameter("id")%>">
                        </div>

                        <a href="<%=request.getContextPath()%>/AreaAdministrador.jsp" type="submit" class="btn btn-danger" name="volver"><img src="https://img.icons8.com/color/30/000000/back-sorting.png"/>Regresar</button>
                            <a href="#"><button type="submit" class="btn btn-warning ml-2" name="eliminar"><img src="https://img.icons8.com/office/30/000000/remove-user-male--v1.png"/>Eliminar del sistema</button></a>
                            <a href="#"><button type="submit" class="btn btn-primary" name="guardar" onclick="Mensaje()"><img src="https://img.icons8.com/dusk/30/000000/save--v2.png"/>Guardar</button></a>
                            <script>
                                function Mensaje()
                                {
                                    alert("Advertencia: si te envía a la página principal: SE REALIZÓ CORRECTAMENTE; En el caso contrario te indicará el error IMPORTANTE:\n\
                                REVISA LOS CAMBIOS QUE HAS HECHO EN LA TABLA DE USUARIOS");
                                }
                            </script>
                    </form>
                </div>
        </div>
    </div>
</body>
<%

%>
</html>
