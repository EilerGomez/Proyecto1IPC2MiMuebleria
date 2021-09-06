<%-- 
    Document   : CargaDeDatos
    Created on : 1/09/2021, 03:56:24 PM
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html style="    margin-top: 200px;
      margin-left: 200px;
      margin-right: 200px;">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Carga de datos</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">

    </head>
    <body style="    background-color: #0f2f40;">
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
        <form style="    background-color: #8db5da;" action="cargaDeDatosServlet" method="post" enctype="multipart/form-data">
            <div class="mb-3">
                <label for="dataFile" class="form-label">Clic para adjuntar el archivo de carga</label>
                <input type="file" class="btn btn-file" id="exampleInputEmail1" name="dataFile" aria-describedby="emailHelp">

            </div>

            <label class="form-check-label" >Check me out</label>

            <a href="<%=request.getContextPath()%>/AreaAdministrador.jsp" class="btn btn-danger">Calcelar</a>
            <a href="DescargarErrores.jsp" class="btn btn-warning">Descargar errores</a>
            <button type="submit" class="btn btn-primary" onclick="Mensaje()">Aceptar</button>
            <script language="JavaScript" type="text/javascript">
                function Mensaje()
                {
                    alert("Advertencia: Se cargaron los archivos que estén correctamente escritos, puedes descargar tus errores y volverlos a insertar");
                }
            </script>

        </form>
    </body>
</html>
