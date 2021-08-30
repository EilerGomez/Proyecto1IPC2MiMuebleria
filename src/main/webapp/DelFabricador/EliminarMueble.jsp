<%-- 
    Document   : EliminarPieza
    Created on : 27/08/2021, 04:04:13 PM
    Author     : HP
--%>

<%@page import="com.mycompany.proyecto1ipc2.ConexionSQL"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String area=request.getContextPath();
            int id=Integer.parseInt(request.getParameter("id"));
            ConexionSQL.eliminarMueble(id);
          response.sendRedirect(area+"/AreaFabrica.jsp");
          %>
    </body>
</html>
