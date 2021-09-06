package servletsOfAdmin;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

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
@WebServlet(name ="agregarCapitalServlet", urlPatterns = {"/agregarCapitalServlet"})
public class agregarCapitalServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        java.sql.Date date = new java.sql.Date(new java.util.Date().getTime());
        try {
            if(request.getParameter("grabar")!=null){
                double capital = Double.valueOf(request.getParameter("capitalActual"));
                ConSQLAdmin.grabarCapital(capital, date);
                response.sendRedirect(request.getContextPath()+"/AreaAdministrador.jsp");
            }
        } catch (NumberFormatException e) {
            PrintWriter mensaje = response.getWriter();
            mensaje.printf("<html><body><center><h1>El caracter que estas insertando no es un dígito</h1></center></body></html>");
        }
    }

}
