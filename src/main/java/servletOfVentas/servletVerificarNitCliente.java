/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servletOfVentas;

import com.mycompany.proyecto1ipc2.ConSQLVentas;
import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
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
@WebServlet(name = "servletVerificarNitCliente", urlPatterns = {"/servletVerificarNitCliente"})
public class servletVerificarNitCliente extends HttpServlet {

    public static String nit;
    public static String nombre = "";
    public static String apellido = "";
    public static String direccion = "";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        if (request.getParameter("botonVerificar") != null) {

            nit = (request.getParameter("nitClienteVeridicar"));
            try {
                ConSQLVentas.verificarNit(servletVerificarNitCliente.nit);
                while (ConSQLVentas.resultado.next()) {
                        nombre = ConSQLVentas.resultado.getString("nombre");
                        apellido = ConSQLVentas.resultado.getString("apellido");
                        direccion = ConSQLVentas.resultado.getString("direccion");
                   

                }

                ConSQLVentas.resultado.close();

            } catch (SQLException ex) {
                out.print("ha sucedido un error");
            }
            response.sendRedirect("DelVendedor/NuevaVenta.jsp");
        }
    }

}
