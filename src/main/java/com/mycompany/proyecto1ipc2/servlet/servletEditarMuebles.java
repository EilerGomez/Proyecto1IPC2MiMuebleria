/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.proyecto1ipc2.servlet;

import com.mycompany.proyecto1ipc2.ConexionSQL;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.time.LocalDate;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author HP
 */
@WebServlet(name = "servletEditarMuebles", urlPatterns = {"/DelFabricador/servletEditarMuebles"})
public class servletEditarMuebles extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter mensaje = response.getWriter();

        try {
            int id = Integer.parseInt(request.getParameter("id"));
            String piezas = request.getParameter("piezasUser");
            Date fecha = Date.valueOf(request.getParameter("fecha"));
            double costo = Double.valueOf(request.getParameter("costo"));
            String tipo = request.getParameter("tipo");
            if(request.getParameter("editar")!=null){
            ConexionSQL.editarMueble(piezas, id, costo, tipo, fecha);
            response.sendRedirect(request.getContextPath()+"/AreaFabrica.jsp");
            }
            
        } catch (NumberFormatException e) {
            mensaje.printf("<html><body><center><h1>El término: costo=" +request.getParameter("costo")+""  + " no es un valor numérico asegurate de haber escrito correctamente</h1></center></body></html>");
        }

    }

}
