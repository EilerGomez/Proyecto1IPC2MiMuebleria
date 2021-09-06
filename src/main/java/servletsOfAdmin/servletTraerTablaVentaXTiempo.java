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
@WebServlet(name = "servletTraerTablaVentaXTiempo", urlPatterns = {"/DelAdministrador/servletTraerTablaVentaXTiempo"})
public class servletTraerTablaVentaXTiempo extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if (request.getParameter("consultarVentaXtiempo") != null) {
            String fechaDe = request.getParameter("comboanio") + "-" + request.getParameter("comboMes") + "-" + request.getParameter("comboDia");
            String fechaHasta = request.getParameter("comboanio2") + "-" + request.getParameter("comboMes2") + "-" + request.getParameter("comboDia2");
            ConSQLAdmin.traerVentasXtiempo(fechaDe, fechaHasta);
            response.sendRedirect("tablaVentasXTiempo.jsp");
        }

    }

}
