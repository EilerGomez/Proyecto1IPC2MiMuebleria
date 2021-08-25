package com.mycompany.proyecto1ipc2.servlet;

import com.mycompany.proyecto1ipc2.ConexionSQL;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author HP
 */
@WebServlet(name = "ServletNuevoUsuario", urlPatterns = {"/ServletNuevoUsuario"})
public class ServletNuevoUsuario extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter mensaje = response.getWriter();
        String area = "";
        if (request.getParameter("Combo_area_trabajo") != null) {
            area = request.getParameter("Combo_area_trabajo");
        }
        if (request.getParameter("guardar") != null) {
            String nombre = request.getParameter("nombre");
            String apellido = request.getParameter("apellido");
            
            String password = request.getParameter("password2");
            if (password.equals(request.getParameter("password1"))) {
                ConexionSQL.insertarNuevoUsuario(nombre, apellido, password, area);
                response.sendRedirect("AreaAdministracion.jsp");
                //ConexionSQL.cerrarConexion();
            } else {
                mensaje.printf("<html><body><center><h1>Las Contraseñas no coinciden</h1></center></body></html>");

                // ConexionSQL.cerrarConexion();
            }
            //ConexionSQL.cerrarConexion();
        }

    }

}
