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
@WebServlet(name = "servletGenerarMuebles", urlPatterns = {"/servletGenerarMuebles"})
public class servletGenerarMuebles extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter mensaje = response.getWriter();
        try {
            if (request.getParameter("generarMuebles") != null) {
                String nombremueble = request.getParameter("nombreMuebleGenerado");
                double precio = Double.valueOf(request.getParameter("precioMuebleGenerado"));
                ConexionSQL.agregarMuebleVenta(nombremueble, precio);
            }
            response.sendRedirect("AreaFabrica.jsp");
        } catch (NumberFormatException e) {
            mensaje.printf("<html><body><center><h1>El término: " + request.getParameter("precioMuebleGenerado") + " no es un valor numérico</h1></center></body></html>");

        }

    }

}
