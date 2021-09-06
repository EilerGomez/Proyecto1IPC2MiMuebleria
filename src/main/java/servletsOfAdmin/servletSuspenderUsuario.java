/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servletsOfAdmin;

import com.mycompany.proyecto1ipc2.ConSQLAdmin;
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
@WebServlet(name = "servletSuspenderUsuario", urlPatterns = {"/DelAdministrador/servletSuspenderUsuario"})
public class servletSuspenderUsuario extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try{
             int idActual=Integer.parseInt(request.getParameter("idActual"));
        if(request.getParameter("guardar")!=null){
           
            int areaNueva =Integer.parseInt(request.getParameter("nuevaArea"));
            ConSQLAdmin.modificarPermisoUsuario(idActual, areaNueva);
            response.sendRedirect(request.getContextPath()+"/AreaAdministrador.jsp");
            
        }else if(request.getParameter("eliminar")!=null){
            ConSQLAdmin.eliminarUsuario(idActual);
            response.sendRedirect(request.getContextPath()+"/AreaAdministrador.jsp");
        }
        }catch(NumberFormatException ex){
             PrintWriter mensaje = response.getWriter();
            mensaje.printf("<html><body><center><h1>El caracter que estas insertando no es un dígito</h1></center></body></html>");
        }
    }

   
}
