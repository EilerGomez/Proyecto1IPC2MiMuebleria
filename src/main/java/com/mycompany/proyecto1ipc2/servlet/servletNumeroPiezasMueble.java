/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.proyecto1ipc2.servlet;

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
@WebServlet(name = "servletNumeroPiezasMueble", urlPatterns = {"/servletNumeroPiezasMueble"})
public class servletNumeroPiezasMueble extends HttpServlet {

    public static int numeroPiezas=0;
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter mensaje = response.getWriter();

        try {
             numeroPiezas = Integer.parseInt(request.getParameter("cantidadPiezas"));
             request.setAttribute("numeroPiezas", numeroPiezas);
                RequestDispatcher rd;
                rd = request.getRequestDispatcher("/DelFabricador/EnsamblarMuebles.jsp");
                rd.forward(request, response);
                

        } catch (NumberFormatException e) {
            mensaje.printf("<html><body><center><h1>El término: "+request.getParameter("cantidadPiezas")+" no es un valor numérico</h1></center></body></html>");

        }

    }

}
