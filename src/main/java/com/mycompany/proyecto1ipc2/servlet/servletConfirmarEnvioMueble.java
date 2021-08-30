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
@WebServlet(name = "servletConfirmarEnvioMueble", urlPatterns = {"/DelFabricador/servletConfirmarEnvioMueble"})
public class servletConfirmarEnvioMueble extends HttpServlet {

   

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String area=request.getContextPath();
        String direccion =area.substring(2, area.length());
        String nombre=request.getParameter("nombre");
        int id=Integer.parseInt(request.getParameter("id"));
        if(request.getParameter("enviarMueble")!=null){  
            ConexionSQL.enviarMuebleAVentas(id);
            //request.getRequestDispatcher(request.getContextPath()+"/Web Pages/AreaFabrica.jsp").forward(request, response);
           response.sendRedirect(area+"/AreaFabrica.jsp");
        }
         
    }


}
