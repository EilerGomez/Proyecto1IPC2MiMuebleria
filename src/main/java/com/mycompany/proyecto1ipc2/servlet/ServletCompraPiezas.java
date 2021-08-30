package com.mycompany.proyecto1ipc2.servlet;

import com.mycompany.proyecto1ipc2.ConexionSQL;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author HP
 */
@WebServlet(name = "ServletCompraPiezas", urlPatterns = {"/ServletCompraPiezas"})
public class ServletCompraPiezas extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter mensaje = response.getWriter();
        String tipo = request.getParameter("comboboxPiezas");
         String fecha = (request.getParameter("comboanio") + "-" + request.getParameter("comboMes") + "-" + request.getParameter("comboDia"));
        double precio = 0;
        double gasto = 0;
        double capital = 0;
        int cantidad = Integer.parseInt(request.getParameter("comboboxCantidadPiezas"));
        //double cantidadDble = Double.valueOf(cantidad);
        if (request.getParameter("ComprarPiezaS") != null) {
            HttpSession sesion = request.getSession();
            try {
                precio = Double.valueOf(request.getParameter("precio"));
                gasto = (precio);
                for (int i = 1; i <= cantidad; i++) {
                    ConexionSQL.agregarPieza(tipo, precio);

                    ConexionSQL.obtenerCapitalAnt();
                    while (ConexionSQL.result.next()) {
                        capital = Double.valueOf(ConexionSQL.result.getString("capital"));
                    }
                    ConexionSQL.con.close();
                    ConexionSQL.obteneridPieza();
                    while (ConexionSQL.result.next()) {
                        sesion.setAttribute("id", ConexionSQL.result.getString("id"));
                        ConexionSQL.agregarGastoAInventario(gasto, cantidad, sesion, capital,fecha);
                    }
                }
                ConexionSQL.con.close();

            } catch (SQLException ex) {
                Logger.getLogger(ServletCompraPiezas.class.getName()).log(Level.SEVERE, null, ex);
            } catch (NumberFormatException e) {
                mensaje.printf("<html><body><center><h1>El término: " + request.getParameter("precio") + " no es un valor numérico</h1></center></body></html>");

            }
        }

        response.sendRedirect("AreaFabrica.jsp");
    }

}
