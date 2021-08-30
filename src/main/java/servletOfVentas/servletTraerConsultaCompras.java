/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servletOfVentas;

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
@WebServlet(name = "servletTraerConsultaCompras", urlPatterns = {"/servletTraerConsultaCompras"})
public class servletTraerConsultaCompras extends HttpServlet {

   public static String nitCliente="";
   public static String fechaDe="";
   public static String fechaHasta="";

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        if (request.getParameter("conusltar") != null) {
            //trabajar aquí
            while (request.getParameter("consultar") != null) {
                nitCliente=request.getParameter("nitCliente");
                fechaDe=request.getParameter("comboanio")+"-"+request.getParameter("comboMes")+"-"+request.getParameter("comboDia");
                fechaHasta=request.getParameter("comboanio2")+"-"+request.getParameter("comboMes2")+"-"+request.getParameter("comboDia2");
                response.sendRedirect("DelVendedor/TablaConsultas.jsp");
            }

        }
    }

}
