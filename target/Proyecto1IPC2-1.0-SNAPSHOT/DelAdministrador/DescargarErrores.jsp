<%-- 
    Document   : DescargarErrores
    Created on : 5/09/2021, 02:10:48 AM
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html style="background-color: #b56c6c;">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Descarga los errores de entrada</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

    </head>
    <body style="margin-top: 200px;
          margin-left: 200px;
          margin-right: 200px">
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
        <h1>Has tenido algunos errores en tu carga de datos; presiona en descargar, para descargarlos y modifcarlos
            <br><!-- comment -->
            Buscalos desde el home de tu ordenador como: errores en tu carpeta: <%=System.getProperty("user.home")%>/ArchivosDeEntrada y vuele a insertarlo si así lo deseas!</h1>
        <a href="<%=request.getContextPath()%>/AreaAdministrador.jsp" class="btn btn-danger"><img src="https://img.icons8.com/dusk/50/000000/back-sorting.png"/>Regresar</a>
        <a href="descargarErroresServlet?errores=<%=request.getParameter("errores")%>" class="btn btn-info" type="submit" ><img src="https://img.icons8.com/dusk/50/000000/download.png"/> Dowload</a>
    </body>
</html>
