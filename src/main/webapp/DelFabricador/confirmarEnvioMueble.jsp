<%-- 
    Document   : confirmarEnvioMueble
    Created on : 26/08/2021, 11:51:50 PM
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html style="background-color: #adf3eb">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link href="Css/bootstrap-reboot.css" rel="stylesheet" type="text/css"/>

    </head>
    <body style="background-color: #adf1f3">
       <%
           HttpSession sesion = request.getSession();
            if (sesion.getAttribute("logueado") == null || sesion.getAttribute("logueado").equals("0")) {
                response.sendRedirect(request.getContextPath() + "/index.jsp");
            }
            if (!sesion.getAttribute("area").equals("1")) {
                response.sendRedirect(request.getContextPath() + "/index.jsp");
            }
        %>
        <div class="container">
            <nav class="navbar navbar-light bg-light">
                <div class="container-fluid">
                    <a class="navbar-brand">ENVIAR A SALA DE VENTAS</a>
                    <form class="d-flex" action="${pageContext.request.contextPath}/AreaFabrica.jsp" >
                        <a href="#"> <img src="https://img.icons8.com/ios-filled/50/000000/user.png"/> <%=sesion.getAttribute("usuario")%>
                        </a>
                        <button class="btn btn-outline-danger ml-2" type="submit" >Regresar</button>
                    </form>
                </div>
            </nav>
            <div class="row">
                <div class="col-sm">
                    <form class="row g-3" action="servletConfirmarEnvioMueble" method="post">
                        <div class="col-md-6">
                            <label for="nombreMueble" class="form-label">Estas seguro que quieres hacer la operación: Enviar: # <%=request.getParameter("id")%>, <%=request.getParameter("nombre")%>; a la sala de ventas?</label>
                            <div class="col-md-6">
                                <td><input type="hidden" name="id" value="<%=request.getParameter("id")%>"></td>

                                <a ><button type="submit" class="btn btn-primary ml-3 mb-3" name="enviarMueble" onclick="Mensaje()">Aceptar</button></a>
                                <script language="JavaScript" type="text/javascript">
                                    function Mensaje()
                                    {
                                        alert("SE HA REALIZADO CORRECTAMENTE");
                                    }
                                </script>

                            </div>
                        </div>
                    </form>
                </div>
            </div>

        </div>
    </body>
</html>
