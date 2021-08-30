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
import java.sql.Date;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
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
@WebServlet(name = "serlvletVenderMueble", urlPatterns = {"/DelVendedor/serlvletVenderMueble"})
public class serlvletVenderMueble extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            boolean hayCliente = false;
            boolean estaVendido = true;
            boolean aLaVenta = true;
            HttpSession sesion = request.getSession();
            String nitCliente = (request.getParameter("nitCliente"));
            String nombreCliente = request.getParameter("nombreCliente");
            String apellidoCliente = request.getParameter("apellidoCliente");
            String direccionCliente = request.getParameter("direccionCliente");
            int codigoMueble = Integer.parseInt(request.getParameter("idMueble"));
            double costoMueble = 0;
            String motivo = "VM" + codigoMueble;
            String fecha = (request.getParameter("comboanio") + "-" + request.getParameter("comboMes") + "-" + request.getParameter("comboDia"));
            if (request.getParameter("BtnaceptarVenta") != null) {
                try {
                    ConSQLVentas.verificarNit(nitCliente);
                    while (ConSQLVentas.resultado.next()) {
                        hayCliente = true;
                    }
                    ConSQLVentas.resultado.close();
                    ConSQLVentas.verificarMuebleVendidoONo(codigoMueble);
                    while (ConSQLVentas.resultado.next()) {
                        estaVendido = false;
                        if (ConSQLVentas.resultado.getString("aLaVenta").equals("0")) {
                            aLaVenta = false;
                        } else {
                            aLaVenta = true;
                            costoMueble = Double.valueOf(ConSQLVentas.resultado.getString("costo"));
                        }
                    }
                    ConSQLVentas.resultado.close();
                    if (estaVendido == false && aLaVenta == true) {
                        if (hayCliente == false) {
                            ConSQLVentas.guardarCliente(nitCliente, nombreCliente, apellidoCliente, direccionCliente);
                            ConSQLVentas.resultado.close();
                            ConSQLVentas.almacenarVenta(codigoMueble, nitCliente, sesion, fecha);
                            ConSQLVentas.cambiarEstadoMuebleVendido(codigoMueble);
                            ConSQLVentas.agregarGananciaCapital(costoMueble, motivo, capitalGanancia(costoMueble), fecha);
                            response.sendRedirect(request.getContextPath() + "/AreaVentas.jsp");
                        } else if (hayCliente == true) {
                            ConSQLVentas.cambiarEstadoMuebleVendido(codigoMueble);
                            ConSQLVentas.almacenarVenta(codigoMueble, nitCliente, sesion, fecha);
                            ConSQLVentas.agregarGananciaCapital(costoMueble, motivo, capitalGanancia(costoMueble), fecha);

                            ConSQLVentas.resultado.close();
                            response.sendRedirect(request.getContextPath() + "/AreaVentas.jsp");
                        }
                    } else {
                        PrintWriter mensaje = response.getWriter();
                        mensaje.printf("<html><body><center><h1>Pueda que el mueble haya sido vendido o que no exista<br>"
                                + "Para ver los muebles disponibles clic en el botón Almacén de muebles a la venta</h1></center></body></html>");

                    }

                    //if(ConSQLVentas.resultado.getString(1)==null){
                    // ConSQLVentas.almacenarVenta(codigoMueble, nitCliente, sesion, fecha);
                    //}
                } catch (SQLException ex) {
                    Logger.getLogger(serlvletVenderMueble.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        } catch (NumberFormatException ex) {
            PrintWriter mensaje = response.getWriter();
            mensaje.printf("<html><body><center><h1>Pueda que el id del mueble u otro término no se reconozca como dígito<br>"
                    + "por favor revisa bien tus datos! </h1></center></body></html>");
        }
    }

    public double capitalGanancia(double costoMueble) {
        //obtener un metodo para el capital desde el conexionSQL
        double capitalGanancia = 0;
        ConexionSQL.obtenerCapitalAnt();
        try {
            while (ConexionSQL.result.next()) {
                capitalGanancia = Double.valueOf(ConexionSQL.result.getString("capital")) + costoMueble;
            }
            ConexionSQL.result.close();
        } catch (SQLException ex) {
            Logger.getLogger(serlvletVenderMueble.class.getName()).log(Level.SEVERE, null, ex);
        }
        return capitalGanancia;
    }

}
