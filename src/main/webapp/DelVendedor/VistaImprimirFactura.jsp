<%-- 
    Document   : VistaImprimirFactura
    Created on : 29/08/2021, 12:02:15 AM
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html style="background-color: #5e627b"
      <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

</head>
<body style="background-color: #586580">
     <%

            // validar usuario y contraseña:
            HttpSession sesion = request.getSession();
            if (sesion.getAttribute("logueado") == null || sesion.getAttribute("logueado").equals("0")) {
                response.sendRedirect(request.getContextPath() + "/index.jsp");
            }
            if (!sesion.getAttribute("area").equals("2")) {
                response.sendRedirect(request.getContextPath() + "/index.jsp");
            }
        %>
    <section style="margin-left: 200px;
             margin-right: 200px;
             margin-top: 300px;">
        <p class="lh-base" style="font-size: 30px;
           background-color: #b6bede;">Numero de Factura: <%=request.getParameter("numFac")%><br>
            Con identificador de nit: <%=request.getParameter("nit")%><br>                  
            A nombre de: <%=request.getParameter("nombreCliente")%> <%=request.getParameter("apellido")%><br>
            Atendido por el Usuario: <%=request.getParameter("usuario")%><br>
            Comprando el mueble con identificador: <%=request.getParameter("idMueble")%><br>
            Nombandose:  <%=request.getParameter("tipoMueble")%><br><br>
        </p>
        <p class="text-end" style="margin-left: 330px;
           background-color: #7feaea;
           font-size: 30px;
           }">Fecha: <%=request.getParameter("fecha")%></p>
        <a class="btn btn-warning" href="Facturas.jsp">Regresar</a>
        <a class="btn btn-primary" href="#">Imprimir</a>
    </section>
</body>
</html>
