/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.proyecto1ipc2.servlet;

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
import javax.servlet.http.HttpSession;

/**
 *
 * @author HP
 */
@WebServlet(name = "servletEnsamblarMueble", urlPatterns = {"/servletEnsamblarMueble"})
public class servletEnsamblarMueble extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter mensaje = response.getWriter();
        boolean seguirleyendo = true;
        String piezasUsadas = "";
        try {
            String nombreMueble = request.getParameter("comboNombreMuebleEnsamblar");
            String idPiezas[] = new String[servletNumeroPiezasMueble.numeroPiezas];
            double precio = Double.valueOf(request.getParameter("PrecioMueble"));
            if (request.getParameter("ensamblar") != null) {
                for (int i = 1; i <= servletNumeroPiezasMueble.numeroPiezas; i++) {
                    while (seguirleyendo == true) {
                        String id = request.getParameter("Pieza" + i);
                        ConexionSQL.traerIdPiezasVerificacion(id);
                        if (ConexionSQL.result != null) {
                            if (ConexionSQL.result.getString("usada").equals("0")) {
                                seguirleyendo = true;
                                idPiezas[i] = id;
                                piezasUsadas += "P" + idPiezas[i] + "/";
                            } else {
                                seguirleyendo = false;
                                mensaje.printf("<html><body><center><h1>La pieza: " + idPiezas[i] + " ya ha sido usada</h1></center></body></html>");
                            }
                        } else {
                            seguirleyendo = false;
                            mensaje.printf("<html><body><center><h1>La pieza: " + idPiezas[i] + " no existe dentro de las piezas compradas</h1></center></body></html>");
                        }
                    }
                    ConexionSQL.con.close();
                }
            }
            if (seguirleyendo == true) {
                HttpSession sesion = request.getSession();
                ConexionSQL.almacenarMueblesEnsamblados(piezasUsadas, sesion, precio, nombreMueble);
                for (int i = 1; i <= servletNumeroPiezasMueble.numeroPiezas; i++) {
                    ConexionSQL.cambiarUsoPiezas(idPiezas[i]);
                }
                response.sendRedirect("AreaFabrica.jsp");
            } else {
                response.sendRedirect("DelFabricador/EnsamblarMuebles.jsp");
            }
        } catch (NumberFormatException e) {
            mensaje.printf("<html><body><center><h1>El término: " + request.getParameter("precioMuebleGenerado") + " no es un valor numérico</h1></center></body></html>");
        } catch (SQLException ex) {
            Logger.getLogger(servletEnsamblarMueble.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

}
