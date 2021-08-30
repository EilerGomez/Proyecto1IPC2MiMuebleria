<%@page import="com.mycompany.proyecto1ipc2.ConexionSQL"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html style="background-color: #7caaca;
      margin-top: 250px;
      margin-left: 400px;
      margin-right: 400px;">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>New User</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

    </head>
    <body>
        <div class="container">
            <div class="row" style="background-color: #50d7ff">
                <div class="col-sm">
                    <form action="ServletNuevoUsuario" method="post">
                        <div class="mb-3">
                            <label for="Nombre" class="form-label">Nombre del usuario</label>
                            <input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" name="nombre" placeholder="Puede ser solo uno" required="requerido">
                        </div>
                        <div class="mb-3">
                            <label for="Apellido" class="form-label">Apellido del usuario</label>
                            <input type="text" class="form-control" id="exampleInputEmail1"  name="apellido" placeholder="Puede ser solo uno" required="requerido">
                        </div>
                        <div class="mb-3">
                            <label for="password" class="form-label">Password del usuario</label>
                            <input type="password" class="form-control"   placeholder="Use una contraseña segura" name="password1" required="requerido">
                        </div>
                        <div class="mb-3">
                            <label for="password" class="form-label">Confirme su password</label>
                            <input type="password" class="form-control"   placeholder="Use una contraseña segura" name="password2" required="requerido">
                        </div>
                        <select class="form-select" aria-label="Default select example" id="combo" name="Combo_area_trabajo" required="requerido">
                            <option selected>Seleccione el area de trabajo</option>
                            <option value="1">Fábrica</option>
                            <option value="2">Puntos de venta</option>
                            <option value="3">Financiera y administración</option>
                        </select>
                        <div class="mb-3"></div> 
                        <div class="mb-3"></div>
                        <a class="btn btn-danger" href="AreaAdministrador.jsp">Cancelar<img src="https://img.icons8.com/color/48/000000/back-sorting.png"/></a>
                        <button type="submit" class="btn btn-primary" name="guardar">Guardar<img src="https://img.icons8.com/color/48/000000/save-all.png"/></button>
                    </form>
                </div>
            </div>
        </div>

    </body>
</html>
