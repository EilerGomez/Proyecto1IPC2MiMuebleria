/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
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
@WebServlet(name = "servletEditarPiezas", urlPatterns = {"/DelFabricador/servletEditarPiezas"})
public class servletEditarPiezas extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter mensaje = response.getWriter();

        try {
            int id = Integer.parseInt(request.getParameter("id"));
            String tipo = request.getParameter("tipo");
            double costo = Double.valueOf(request.getParameter("costo"));
            if (request.getParameter("editar") != null) {
                ConexionSQL.modificarPieza(id, tipo, costo);
                response.sendRedirect(request.getContextPath() + "/AreaFabrica.jsp");
            }
        } catch (NumberFormatException e) {
            mensaje.printf("<html><body><center><h1>El término: costo=" + request.getParameter("costo") + "" + " no es un valor numérico asegurate de haber escrito correctamente</h1></center></body></html>");
        }

    }

}
