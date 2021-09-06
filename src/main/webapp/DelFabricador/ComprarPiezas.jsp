

<%@page import="com.mycompany.proyecto1ipc2.ConexionSQL"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@5.15.4/css/fontawesome.min.css" integrity="sha384-jLKHWM3JRmfMU0A5x5AkjWkw/EYfGUAGagvnfryNV3F9VqM98XiIH7VBGVoxVSc7" crossorigin="anonymous">

    </head>
    <body class="cuerpo">
        <%
            HttpSession sesion = request.getSession();
            if (sesion.getAttribute("logueado") == null || sesion.getAttribute("logueado").equals("0")) {
                response.sendRedirect(request.getContextPath() + "/index.jsp");
            }
            if (!sesion.getAttribute("area").equals("1")) {
                response.sendRedirect(request.getContextPath() + "/index.jsp");
            }
        %>
        <div>
            <nav >
                <div class="container-fluid ml-10">
                    <h3>PIEZAS DE VENTA</h3>
                    <form method="POST" action="ServletCompraPiezas">

                        <select class="form-select" aria-label="Default select example" id="comboPiezas" name="comboboxPiezas" >
                            <option selected>Seleccione La pieza</option>
                            <%
                                ConexionSQL.traerpiezasParaComprar();
                                while (ConexionSQL.result.next()) {
                            %>
                            <option value="<%=ConexionSQL.result.getString("nombre")%>"><%=ConexionSQL.result.getString("nombre")%>, <%=ConexionSQL.result.getString("precio")%> C/U</option>
                            <%
                                }
                                ConexionSQL.result.close();
                            %>

                        </select>
                        <div class="mb-3">
                            <div class="mb-3">
                                <label fomr="texto">Ingrese el precio de la pieza</label>
                            </div>
                            <input type="number" placeholder="Precio unidad-pieza" name="precio" required="requerido">
                            <div class="mb-3">
                                <label for="exampleInputPassword1" class="form-label">Ingrese la cantidad que desee comprar:</label>
                                <select class="form-select" aria-label="Default select example" name="comboboxCantidadPiezas">
                                    <%
                                        for (int i = 1; i <= 20; i++) {
                                    %>
                                    <option value="<%=i%>"><%=i%></option>
                                    <%
                                        }
                                    %>
                                </select>
                            </div>
                            <h6> Ingrese la fecha en formato año/mes/día</h6>

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
                        </div> <br>
                        <button type="submit" class="btn btn-primary" name="ComprarPiezaS">Comprar</button>
                    </form>
                </div>


                <br><br>

                </div>
            </nav>
        </div>
    </body>
</html>
