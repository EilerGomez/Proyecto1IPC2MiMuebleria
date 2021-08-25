package com.mycompany.proyecto1ipc2.servlet;

import com.mycompany.proyecto1ipc2.ConexionSQL;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "ServletModificarUsuario", urlPatterns = {"/ServletModificarUsuario"})
public class ServletModificarUsuario extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter mensaje = response.getWriter();

        HttpSession sesion = request.getSession();
        if (sesion.getAttribute("logueado") == null || sesion.getAttribute("logueado").equals("0")) {
            response.sendRedirect("index.jsp");
        }
        if (request.getParameter("guardar") != null) {
            String nombre = request.getParameter("nombre");
            String apellido = request.getParameter("apellido");
            String password1 = request.getParameter("password1");
            String password2 = request.getParameter("password2");
            if (password1.equals(password2)) {
                ConexionSQL.modificarDatos(nombre, apellido, password1, sesion);
                sesion.setAttribute("usuario", nombre);
                response.sendRedirect("logOut.jsp");
            } else {
                mensaje.printf("<html><body><center><h1>Las Contraseñas no coinciden</h1></center></body></html>");
            }
        }
        if (request.getParameter("volver") != null) {

            Object areaPerteneciente1 = sesion.getAttribute("area");
            String areaPerteneciente = areaPerteneciente1.toString();
            if (areaPerteneciente.equals("1")) {
                response.sendRedirect("AreaFabrica.jsp");
            } else if (areaPerteneciente.equals("2")) {
                response.sendRedirect("AreaVentas.jsp");
            } else if (areaPerteneciente.equals("3")) {
                response.sendRedirect("AreaAdministracion.jsp");
            }
        }
    }

}
