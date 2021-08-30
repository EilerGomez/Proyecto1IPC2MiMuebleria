

<%@page import="com.mycompany.proyecto1ipc2.ConexionSQL"%>
<%@page import="com.mycompany.proyecto1ipc2.servlet.servletNumeroPiezasMueble"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ensamblar muebles</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link href="Css/bootstrap-reboot.css" rel="stylesheet" type="text/css"/>

    </head>
    <body style="background-color: #88cbd4">
        <%
            // validar usuario y contraseña:
            HttpSession sesion = request.getSession();
            if (sesion.getAttribute("logueado") == null || sesion.getAttribute("logueado").equals("0")) {
                response.sendRedirect("index.jsp");
            }
           String piezas[]= new String[servletNumeroPiezasMueble.numeroPiezas];
        %>
        <div class="container">
            <nav class="navbar navbar-light bg-light">
                <div class="container-fluid">
                    <a class="navbar-brand">CREAR UN NUEVO MUEBLE</a>
                    <form class="d-flex" action="AreaFabrica.jsp">
                        <a href="#"> <img src="https://img.icons8.com/ios-filled/50/000000/user.png"/> <%=sesion.getAttribute("usuario")%>
                        </a>
                        <button class="btn btn-outline-danger ml-2" type="submit" >Regresar</button>
                    </form>
                </div>
            </nav>
            <div class="row">
                <div class="col-sm">
                    <form class="row g-3" action="servletEnsamblarMueble" method="post">
                        <div class="col-md-6">
                            <label for="nombreMueble" class="form-label">Elija el mueble</label>
                            <select  class="form-select" aria-label="Default select example" name="comboNombreMuebleEnsamblar">
                                <%
                                    ConexionSQL.traerMueblesParaGenerar();
                                    while(ConexionSQL.result.next()){
                                %>
                                <option value="<%=ConexionSQL.result.getString("nombre")%>"><%=ConexionSQL.result.getString("nombre")%> (Q.<%=ConexionSQL.result.getString("precio")%>)</option>
                                <%
                                    }
                                ConexionSQL.result.close();

                                %>
                            </select>
                        </div>
                        <div class="col-md-6">
                            <label for="precio" class="form-label">Precio del mueble</label>
                            <input type="number" class="form-control" required="requerido" name="PrecioMueble">
                        </div>
                        <div class="col-md-6">
                            <label for="precio" class="form-label">Seleccione los id de las piezas</label>
                            <div>
                                <%
                                    for (int i = 1; i <= servletNumeroPiezasMueble.numeroPiezas; i++) {
                                        //piezas[i]=String.valueOf(i);
                                %>
                                <div>
                                    <input type="text" class="form-control" name="<%=String.valueOf(i)%>" placeholder="ingrese el id de la pieza <%=i%>" required="requerido"> <br>
                                </div>

                                <%
                                    }
                                %>
                            </div>
                        </div>
                            
                            <div class="col-md-6">
                                <div class="col-md-6">
                                    <h6> Ingrese la fecha en formato año/mes/día</h6>
                                </div>
                                <select class="form-select" aria-label="Default select example" name="comboanio">
                                    <%
                                    for(int i=2020; i<=2030;i++){
                                    %>
                                    <option value="<%=i%>"><%=i%></option>
                                    <%
                                        }
                                    %>
                                </select>
                                <select class="form-select" aria-label="Default select example" name="comboMes">
                                    <%
                                    for(int i=1; i<=12;i++){
                                    %>
                                    <option value="<%=i%>"><%=i%></option>
                                    <%
                                        }
                                    %>
                                </select>
                                 <select class="form-select" aria-label="Default select example" name="comboDia">
                                    <%
                                    for(int i=1; i<=31;i++){
                                    %>
                                    <option value="<%=i%>"><%=i%></option>
                                    <%
                                        }
                                    %>
                                </select>
                            </div>
                                <a ><button type="submit" class="btn btn-primary ml-3 mb-3" name="ensamblar">Aceptar</button></a>
                    </form>
                    <div class="btn">
                        <li><a href="#" id="traerTablaPiezas" class="btn btn-success"><img src="https://img.icons8.com/cute-clipart/30/000000/bulleted-list.png"/>Traer Piezas No Usadas</a></li>

                    </div>
                </div>
            </div>
            <div id="contenidoTabla">
                <script type="text/javascript" src="Js/traerEnsambleMuebles.js"></script>

            </div>
        </div>


    </body>
</html>
