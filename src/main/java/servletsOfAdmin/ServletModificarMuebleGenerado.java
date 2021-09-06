/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servletsOfAdmin;

import cargaDeDatos.ConCargaDatos;
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
@WebServlet(name = "ServletModificarMuebleGenerado", urlPatterns = {"/DelAdministrador/ServletModificarMuebleGenerado"})
public class ServletModificarMuebleGenerado extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
                PrintWriter mensaje = response.getWriter();

        try {
            String nombre = request.getParameter("nombre");
            int id = Integer.parseInt(request.getParameter("id"));
            double precioVenta = Double.valueOf(request.getParameter("precioVenta"));
            double precioCompra = Double.valueOf(request.getParameter("precioCompra"));
            if (request.getParameter("guardar") != null) {
                ConCargaDatos.agregarMuebleModificado(nombre, precioVenta, precioCompra, id);
                response.sendRedirect(request.getContextPath()+"/AreaAdministrador.jsp");
            }else if(request.getParameter("volver")!=null){
                 response.sendRedirect(request.getContextPath()+"/AreaAdministrador.jsp");
            }
        }catch(NumberFormatException e){
                        mensaje.printf("<html><body><center><h1>Pueda que uno de los términos: "+request.getParameter("precioVenta")+", o"+request.getParameter("precioCompra")+" no sea un valor numérico asegurate de haber escrito correctamente</h1></center></body></html>");

        }

    }

}
