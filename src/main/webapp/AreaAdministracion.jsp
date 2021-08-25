

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

        <title>Administracion</title>
    </head>
    <body>

        <%
            // validar usuario y contraseña:
            HttpSession sesion = request.getSession();
            if (sesion.getAttribute("logueado") == null || sesion.getAttribute("logueado").equals("0")) {
                response.sendRedirect("index.jsp");
            }
        %>
        <div class="container">
            <nav class="navbar navbar-light bg-light">
                <div class="container-fluid">
                    <a class="navbar-brand">AREA DE ADMINISTRACIÓN</a>
                    <form class="d-flex" action="logOut.jsp">
                        <a href="modificarUsuario.jsp"> <img src="https://img.icons8.com/ios-filled/50/000000/user.png"/> <%=sesion.getAttribute("usuario")%>
                        </a>
                        <button class="btn btn-outline-danger ml-2" type="submit" >log out</button>
                    </form>
                </div>
            </nav>
            <div class="row">
                <div class="col-sm">
                    <table class="table table-striped">
                        <thread>
                            <tr>
                                <th>
                                    <a href="NuevoUsuario.jsp"><img src="https://img.icons8.com/ios-glyphs/50/000000/add-user-male.png"/></a>
                                </th>
                            </tr>
                        </thread>
                    </table>

                </div>

            </div>
        </div>

    </body>
</html>
