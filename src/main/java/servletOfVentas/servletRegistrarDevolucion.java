/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servletOfVentas;

import com.mycompany.proyecto1ipc2.ConSQLVentas;
import com.mycompany.proyecto1ipc2.ConexionSQL;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author HP
 */
@WebServlet(name = "servletRegistrarDevolucion", urlPatterns = {"/DelVendedor/servletRegistrarDevolucion"})
public class servletRegistrarDevolucion extends HttpServlet {
   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        try {
            int codigoVenta = Integer.parseInt(request.getParameter("codigoFactura"));

           // String nitCliente = request.getParameter("nitCliente");
            String fechaActual = (request.getParameter("comboanio") + "-" + request.getParameter("comboMes") + "-" + request.getParameter("comboDia"));
            if (request.getParameter("BtnaceptaDevolucion") != null) {
                if (ConSQLVentas.obtenerFechaVenta(codigoVenta) != null) {
                    ConSQLVentas.compararFechas(fechaActual, ConSQLVentas.obtenerFechaVenta(codigoVenta), codigoVenta);
                    while (ConSQLVentas.resultado.next()) {
                        if (Integer.parseInt(ConSQLVentas.resultado.getString(1)) <= 8) {

                            ConSQLVentas.registrarDevolucion(Integer.parseInt(ConSQLVentas.obtenerCodigoMueble(codigoVenta)), ConSQLVentas.obtenerNitCliente(codigoVenta), fechaActual, codigoVenta,perdida(codigoVenta));
                            agregarDineroInventario(codigoVenta, fechaActual);
                            ModificarIdMueble(codigoVenta);
                            ConSQLVentas.eliminarVenta(codigoVenta);

                            response.sendRedirect(request.getContextPath() + "/AreaVentas.jsp");
                            // eliminar mueble y ponerlo en un lugar mejor
                        } else {
                            PrintWriter mensaje = response.getWriter();
                            mensaje.printf("<html><body><center><h1>Lo Sentimos, esta venta se hizo hace mas de una semana; no se puede devolver!!!!! Gracias </h1></center></body></html>");
                        }
                    }
                    ConSQLVentas.resultado.close();
                } else {

                    PrintWriter mensaje = response.getWriter();
                    mensaje.printf("<html><body><center><h1>EL registro de venta no existe por favor revisa </h1></center></body></html>");
                }
            }
        } catch (NumberFormatException ex) {

            PrintWriter mensaje = response.getWriter();
            mensaje.printf("<html><body><center><h1>Pueda que el id del mueble u otro término no se reconozca como dígito<br>"
                    + "por favor revisa bien tus datos! </h1></center></body></html>");
        } catch (SQLException ex) {
            Logger.getLogger(servletRegistrarDevolucion.class.getName()).log(Level.SEVERE, null, ex);
        } catch (NullPointerException ex) {

            PrintWriter mensaje = response.getWriter();
            mensaje.printf("<html><body><center><h1>Pueda que la venta no exista, por favor inserte correctamente el número de venta o factura</h1></center></body></html>");
        }

    }

    public void ModificarIdMueble(int codigoVenta) {

        String motivo = "VM" + Integer.parseInt(ConSQLVentas.obtenerCodigoMueble(codigoVenta));
        ConSQLVentas.modificarIdMueble(Integer.parseInt(ConSQLVentas.obtenerCodigoMueble(codigoVenta)),Math.round((Double.valueOf(ConSQLVentas.traerCostoVenta(motivo)) - (Double.valueOf(ConSQLVentas.traerCostoVenta(motivo)) / 3.00))*100.0)/100.0);
    }

    public void agregarDineroInventario(int codigoVenta, String fecha) {
        try {
            double Nuevacapital = 0;
            String motivo = "VM" + Integer.parseInt(ConSQLVentas.obtenerCodigoMueble(codigoVenta));
            String nuevoMotivo = "DM" + Integer.parseInt(ConSQLVentas.obtenerCodigoMueble(codigoVenta));
            double perdida = Math.round((Double.valueOf(ConSQLVentas.traerCostoVenta(motivo)) / 3)*100.0)/100.0;
            ConexionSQL.obtenerCapitalAnt();
            while (ConexionSQL.result.next()) {
                Nuevacapital = Double.valueOf(ConexionSQL.result.getString("capital")) - perdida;
            }
            ConexionSQL.result.close();

            ConSQLVentas.agregarDevolucionInventario(Double.valueOf(ConSQLVentas.traerCostoVenta(motivo)), -perdida, nuevoMotivo, Nuevacapital, fecha);
        } catch (SQLException ex) {
            Logger.getLogger(servletRegistrarDevolucion.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    public double perdida(int codigoVenta){
         String motivo = "VM" + Integer.parseInt(ConSQLVentas.obtenerCodigoMueble(codigoVenta));
        double perdida = Math.round((Double.valueOf(ConSQLVentas.traerCostoVenta(motivo)) / 3)*100.0)/100.0;
        return perdida;
    }

}
