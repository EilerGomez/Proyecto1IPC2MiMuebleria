/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.proyecto1ipc2.servlet;

import com.mycompany.proyecto1ipc2.ConexionSQL;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author HP
 */
@WebServlet(name = "AlmacenarPiezaVentaServlet", urlPatterns = {"/AlmacenarPiezaVentaServlet"})
public class AlmacenarPiezaVentaServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter mensaje = response.getWriter();
        try{
               if (request.getParameter("generarPiezaS") != null) {

            String piezaGenerada = request.getParameter("nombrePiezaGenerada");
            double precioGenerada = Double.valueOf(request.getParameter("precioPiezaGenerada"));
            ConexionSQL.agregarPiezaVenta(piezaGenerada, precioGenerada);

        }
        response.sendRedirect("AreaFabrica.jsp");
        }catch (NumberFormatException e) {
            mensaje.printf("<html><body><center><h1>El término: " + request.getParameter("precioPiezaGenerada") + " no es un valor numérico</h1></center></body></html>");

        }
     

    }

}
