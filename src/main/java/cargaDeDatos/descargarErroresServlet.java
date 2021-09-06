/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cargaDeDatos;

import java.io.File;
import java.io.FileWriter;
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
@WebServlet(name = "descargarErroresServlet", urlPatterns = {"/DelAdministrador/descargarErroresServlet"})
public class descargarErroresServlet extends HttpServlet {

    public static final String PATH = System.getProperty("user.home");

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String errores = request.getParameter("errores");
        try {
            String filePath = PATH + "/ArchivosDeEntrada/" + "errores.txt";
            FileWriter escribirErrores = new FileWriter(new File(filePath));
            escribirErrores.write(cargaDeDatosServlet.errores);
            escribirErrores.close();
            cargaDeDatosServlet.errores = "";
        } catch (IOException e) {

        }
         response.sendRedirect(request.getContextPath() + "/AreaAdministrador.jsp");
    }

}
