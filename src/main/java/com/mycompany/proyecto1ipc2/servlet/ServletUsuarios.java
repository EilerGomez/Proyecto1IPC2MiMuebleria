
package com.mycompany.proyecto1ipc2.servlet;

import com.mycompany.proyecto1ipc2.ConexionSQL;
import java.io.IOException;
import java.io.PrintWriter;
//import java.io.PrintWriter;
import static java.lang.System.out;
import java.sql.SQLException;
import java.util.Locale;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author HP
 */
@WebServlet(name = "ServletUsuarios", urlPatterns = {"/ServletUsuarios"})
public class ServletUsuarios extends HttpServlet {
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter mensaje = response.getWriter();
        String area = "3";
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
                        sesion.setAttribute("area", ConexionSQL.result.getString("area"));
                        sesion.setAttribute("apellido", ConexionSQL.result.getString("apellido"));
                        sesion.setAttribute("id", ConexionSQL.result.getString("id"));
                        response.setContentType("text/html;charset=UTF-8");
                        
                        if (ConexionSQL.result.getString("area").equals("3")) {
                            response.sendRedirect("AreaAdministrador.jsp");
                        } else if (ConexionSQL.result.getString("area").equals("2")) {
                            response.sendRedirect("AreaVentas.jsp");
                        } else if (ConexionSQL.result.getString("area").equals("1")) {
                            response.sendRedirect("AreaFabrica.jsp");
                        }
                        
                    }
               
                ConexionSQL.cerrarConexion();
                
               // mensaje.println("<div class=\"alert alert-danger\" role=\"alert\">Usuario no válido</div>");
                mensaje.printf("<html><body><center><h1>Usuario no válido</h1></center></body></html>");
                 
                /*response.sendRedirect(
                String.format("index.jsp", result)
                );*/

            } catch (NullPointerException e) {
                out.println(e);
            } catch (SQLException ex) {
                Logger.getLogger(ServletUsuarios.class.getName()).log(Level.SEVERE, null, ex);
            }
            
        }

    }

}
