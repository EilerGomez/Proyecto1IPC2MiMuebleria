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
@WebServlet(name = "ServletEnviarNitParaFacturaCliente", urlPatterns = {"/ServletEnviarNitParaFacturaCliente"})
public class ServletEnviarNitParaFacturaCliente extends HttpServlet {

    public static String nitCliente = "";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if (request.getParameter("enviarNit") != null) {
            nitCliente = request.getParameter("nitCliente");
            response.sendRedirect("DelVendedor/Facturas.jsp");
        }

    }

}
