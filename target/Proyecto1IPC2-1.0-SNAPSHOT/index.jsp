<%@page import="java.sql.*"%>
<%@page import="com.mycompany.proyecto1ipc2.ConexionSQL"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="Css/estilo.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@5.15.4/css/fontawesome.min.css" integrity="sha384-jLKHWM3JRmfMU0A5x5AkjWkw/EYfGUAGagvnfryNV3F9VqM98XiIH7VBGVoxVSc7" crossorigin="anonymous">
        <title>Login</title>
    </head>
    <body>
        <div id="cuadro">
            <form method="POST" action= "ServletUsuarios">
                <p id="titulo"> INICIAR SESION</p>
                <hr>
                <br/><br/>
                <label id="subtitulo1">NOMBRE DE USUARIO</label>     
                <br/><br/>
                <input type="text" name="usuario" class="entrada" required="requerido" value="" placeholder="Su nombre"/>
                <br/><br/>
                <label id="subtitulo2">CONTRASEÑA</label>   
                <br/><br/>
                <input type="password" name="password" class="entrada" required="requerido" placeholder="Su contraseña"/>
                <br/><br/>
                <label id="subtitulo3">AREA A LA QUE PERTENECE</label>   
                <select class="form-select" aria-label="Default select example" id="combo" name="combobox" >
                    <option selected>Seleccione</option>
                    <option value="1">Fábrica</option>
                    <option value="2">Puntos de venta</option>
                    <option value="3">Financiera y administración</option>
                </select>
                <br/><br/>

                <button type="submit" class="btn btn-primary" name="boton" id="boton">Ingresar</button>
            </form>
            <%
                /*String area = "3";
                if (request.getParameter("combobox") != null) {
                    area = request.getParameter("combobox");
                }
                if (request.getParameter("boton") != null) {
                    String usuario = request.getParameter("usuario");
                    String password = request.getParameter("password");
                    HttpSession sesion = request.getSession();

                    try {
                        ConexionSQL.verificarUsuario(usuario, password, area);
                        while (ConexionSQL.result.next()) {
                            sesion.setAttribute("logueado", 1);
                            sesion.setAttribute("usuario", ConexionSQL.result.getString("nombre"));
                            sesion.setAttribute("apellido", ConexionSQL.result.getString("apellido"));
                            sesion.setAttribute("id", ConexionSQL.result.getString("id"));
                            if (area.equals("3")) {
                                response.sendRedirect("AreaAdministracion.jsp");
                            }else if(area.equals("2")){
                                 response.sendRedirect("AreaVentas.jsp");
                            }else if(area.equals("1")){
                                 response.sendRedirect("AreaFabrica.jsp");
                            }

                        }
                        ConexionSQL.cerrarConexion();
                        out.println("<div class=\"alert alert-danger\" role=\"alert\">Usuario no válido</div>");

                    } catch (NullPointerException e) {
                        out.println(e);
                    }

                }*/

            %>
            <br/>
            <p id="marca">MI MUEBLERIA/</p>
        </div>
    </body>
</html>
