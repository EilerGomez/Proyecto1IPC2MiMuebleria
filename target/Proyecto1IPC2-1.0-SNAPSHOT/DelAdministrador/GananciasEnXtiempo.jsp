<%-- 
    Document   : NuevaVenta
    Created on : 27/08/2021, 11:52:41 PM
    Author     : HP
--%>



<%@page import="java.sql.SQLException"%>

<!DOCTYPE html>
<html style="margin-left: 100px">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ganancias</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@5.15.4/css/fontawesome.min.css" integrity="sha384-jLKHWM3JRmfMU0A5x5AkjWkw/EYfGUAGagvnfryNV3F9VqM98XiIH7VBGVoxVSc7" crossorigin="anonymous">

    </head>
    <body style="background-color:  #a398c1;;
          margin-right: 200px;margin-left: 200px;">
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
        <div class="container margin">
            <div  class="row">
                <div class="col-sm">
                    <form method="post"action="DelAdministrador/tablaGananciasXTiempo.jsp" >
                        <h2>INGRESA LOS DATOS DE FECHAS PARA CONSULTAR LAS GANANCIAS</h2>

                        <div class="mb-3">

                            <h6>Verificar de:</h6>

                            <select class="form-select" aria-label="Default select example" name="comboanio">
                                <%
                                    for (int i = 2020; i <= 2030; i++) {
                                %>
                                <option value="<%=i%>"><%=i%></option>
                                <%
                                    }
                                %>
                            </select>
                            <select class="form-select" aria-label="Default select example" name="comboMes">
                                <%
                                    for (int i = 1; i <= 12; i++) {
                                %>
                                <option value="<%=i%>"><%=i%></option>
                                <%
                                    }
                                %>
                            </select>
                            <select class="form-select" aria-label="Default select example" name="comboDia">
                                <%
                                    for (int i = 1; i <= 31; i++) {
                                %>
                                <option value="<%=i%>"><%=i%></option>
                                <%
                                    }
                                %>
                            </select>
                            <h6>Verificar hasta:</h6>

                            <select class="form-select" aria-label="Default select example" name="comboanio2">
                                <%
                                    for (int i = 2020; i <= 2030; i++) {
                                %>
                                <option value="<%=i%>"><%=i%></option>
                                <%
                                    }
                                %>
                            </select>
                            <select class="form-select" aria-label="Default select example" name="comboMes2">
                                <%
                                    for (int i = 1; i <= 12; i++) {
                                %>
                                <option value="<%=i%>"><%=i%></option>
                                <%
                                    }
                                %>
                            </select>
                            <select class="form-select" aria-label="Default select example" name="comboDia2">
                                <%
                                    for (int i = 1; i <= 31; i++) {
                                %>
                                <option value="<%=i%>"><%=i%></option>
                                <%
                                    }
                                %>
                            </select>
                        </div>
                        <br><!-- comment -->
                        <div class="mb-3">

                            <a id="Consultar"><button type="submit" class="btn btn-primary" name="consultarDevolucion" onclick="Mensaje()">Consultar</button></a>
                        </div>
                        <script language="JavaScript" type="text/javascript">
                            function Mensaje()
                            {
                                alert("Advertencia: si te envía a la página principal: SE REALIZÓ CORRECTAMENTE; En el caso contrario te indicará el error");
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
