/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cargaDeDatos;

import com.google.protobuf.ByteString.Output;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileWriter;

import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author HP
 */
@WebServlet(name = "cargaDeDatosServlet", urlPatterns = {"/DelAdministrador/cargaDeDatosServlet"})
@MultipartConfig(location = "")
public class cargaDeDatosServlet extends HttpServlet {

  
    String cadenaSobrante = "";
    public static String errores = "";
    public static final String PATH = System.getProperty("user.name");

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Part filePart = request.getPart("dataFile");
        String fileName = filePart.getName();
        InputStream fileStream = filePart.getInputStream();
        //  System.out.println(fileName);

        System.out.println(fileName);
        System.out.println(filePart);
        System.out.println(fileStream);
        System.out.println(System.getProperty("file.separator"));

        try (BufferedReader in = new BufferedReader(new InputStreamReader(fileStream))) {
            String line = in.readLine();
            while (line != null) {

                if (analizarLinea(line).equals("USUARIO")) {
                    guardarUSuario(line);
                } else if (analizarLinea(line).equals("PIEZA")) {
                    guardarPieza(line);
                } else if (analizarLinea(line).equals("MUEBLE")) {
                    guardarMueble(line);
                } else if (analizarLinea(line).equals("CLIENTE")) {
                    analizarCliente(line);
                } else {
                    errores = errores + line + "\n";
                }
                line = in.readLine();
                //System.out.println(cadenaSobrante);
                //cadenaSobrante = "";
            }
            System.out.println("errores:\n" + errores);

            // que se abra una ventana para descargar los errores
            if (errores.equals("")) {
                response.sendRedirect(request.getContextPath() + "/AreaAdministrador.jsp");
            } else {
                request.getRequestDispatcher("DescargarErrores.jsp?errores=" + errores).forward(request, response);
            }

        } catch (Exception ex) {
            // manejo de error
        }
    }

    public String analizarLinea(String linea) {
        String loque = "";
        String nombreFinal = "";
        for (int i = 0; i < linea.length(); i++) {
            if (linea.substring(i, i + 1).equals("(")) {
                i = linea.length() + 1;
            } else {
                if (linea.substring(linea.length() - 1, linea.length()).equals(")")) {
                    nombreFinal += linea.subSequence(i, i + 1);
                    cadenaSobrante = (String) linea.substring(i + 1, linea.length());
                } else {

                    i = linea.length() + 1;
                    nombreFinal = "error";
                }
            }
        }
        return nombreFinal;
    }

    public void guardarUSuario(String linea) {
        String partes[] = linea.substring(8, linea.length() - 1).split(",");
        if (partes[0].charAt(0) == '"' && partes[0].charAt(partes[0].length() - 1) == '"' && partes[1].charAt(0) == '"' && partes[1].charAt(partes[1].length() - 1) == '"' && partes[2].matches("[+-]?\\d*(\\.\\d+)?")) {
            //aqui va agregar usuarios a la base da datos xplis

            /* System.out.println("Usuario:");
            System.out.println(partes[0].substring(1, partes[0].length() - 1));
            System.out.println(partes[1].substring(1, partes[1].length() - 1));
            System.out.println(partes[2]);*/
            ConCargaDatos.insertarUsuario(partes[0].substring(1, partes[0].length() - 1), partes[1].substring(1, partes[1].length() - 1), partes[2]);
        } else {
            errores = errores + linea + "\n";
        }

    }

    public void guardarPieza(String linea) {
        String partes[] = linea.substring(6, linea.length() - 1).split(",");
        if (partes[0].charAt(0) == '"' && partes[0].charAt(partes[0].length() - 1) == '"' && partes[1].matches("[+-]?\\d*(\\.\\d+)?")) {
            //se guardan las piezas compradas solo compradas
            /*System.out.println("Piezas:");
            System.out.println(partes[0].substring(1, partes[0].length() - 1));
            System.out.println(partes[1]);*/
            ConCargaDatos.agregarPieza(partes[0].substring(1, partes[0].length() - 1), Double.valueOf(partes[1]));
        } else {
            errores = errores + linea + "\n";
        }
    }

    public void guardarMueble(String linea) {
        String partes[] = linea.substring(7, linea.length() - 1).split(",");
        if (partes[0].charAt(0) == '"' && partes[0].charAt(partes[0].length() - 1) == '"' && partes[1].matches("[+-]?\\d*(\\.\\d+)?")) {
            //se guardan los muebles que pueden ser comprados
            System.out.println("Muebles:");
            System.out.println(partes[0].substring(1, partes[0].length() - 1));
            System.out.println(partes[1]);
            ConCargaDatos.agregarMuebleVenta(partes[0].substring(1, partes[0].length() - 1), Double.valueOf(partes[1]));
        } else {
            errores = errores + linea + "\n";
        }
    }

    public void analizarCliente(String linea) {
        try {

            int cantPartes = 0;
            String partes[] = linea.substring(8, linea.length() - 1).split(",");
            for (String cant : partes) {
                cantPartes++;
            }
            String nombre = "";
            String nit = "";
            String direccion = "";
            nombre = partes[0].substring(1, partes[0].length() - 1);
            nit = partes[1].substring(1, partes[1].length() - 1);

            switch (cantPartes) {
                case 3:
                    if (partes[0].charAt(0) == '"' && partes[0].charAt(partes[0].length() - 1) == '"' && partes[1].charAt(0) == '"' && partes[1].charAt(partes[1].length() - 1) == '"'
                            && partes[2].charAt(0) == '"' && partes[2].charAt(partes[2].length() - 1) == '"') {
                        //se guardan los muebles que pueden ser comprados
                        //System.out.println("Clientes:");
                        direccion = partes[2].substring(1, partes[2].length() - 1);
                        /* System.out.println(nombre);
                        System.out.println(nit);
                        System.out.println(direccion);*/
                        ConCargaDatos.agregarClientes(nombre, nombre, nit, direccion);
                    } else {
                        errores = errores + linea + "\n";
                    }
                    break;
                case 4:
                    if (partes[0].charAt(0) == '"' && partes[0].charAt(partes[0].length() - 1) == '"' && partes[1].charAt(0) == '"' && partes[1].charAt(partes[1].length() - 1) == '"'
                            && partes[2].charAt(0) == '"' && partes[2].charAt(partes[2].length() - 1) == '"' && partes[3].charAt(0) == '"' && partes[3].charAt(partes[3].length() - 1) == '"') {
                        //se guardan los muebles que pueden ser comprados
                        //System.out.println("Clientes:");
                        direccion=partes[2].substring(1, partes[2].length() - 1) + "," + partes[3].substring(1, partes[3].length() - 1);
                        /*System.out.println(nombre);
                        System.out.println(nit);
                        System.out.println(direccion);*/
                          ConCargaDatos.agregarClientes(nombre, nombre, nit, direccion);
                    } else {
                        errores = errores + linea + "\n";
                    }
                    break;
                case 5:
                    if (partes[0].charAt(0) == '"' && partes[0].charAt(partes[0].length() - 1) == '"' && partes[1].charAt(0) == '"' && partes[1].charAt(partes[1].length() - 1) == '"'
                            && partes[2].charAt(0) == '"' && partes[2].charAt(partes[2].length() - 1) == '"' && partes[3].charAt(0) == '"' && partes[3].charAt(partes[3].length() - 1) == '"'
                            && partes[4].charAt(0) == '"' && partes[4].charAt(partes[4].length() - 1) == '"') {
                        //se guardan los muebles que pueden ser comprados
                        //System.out.println("Clientes:");
                        direccion=partes[2].substring(1, partes[2].length() - 1) + "," + partes[3].substring(1, partes[3].length() - 1) + "," + partes[4].substring(1, partes[4].length() - 1);
                        /*  System.out.println(nombre);
                        System.out.println(nit);
                        System.out.println(direccion);*/
                        ConCargaDatos.agregarClientes(nombre, nombre, nit, direccion);
                    } else {
                        errores = errores + linea + "\n";
                    }
                    break;
                default:
                    break;
            }
        } catch (Exception e) {

        }
    }

}
