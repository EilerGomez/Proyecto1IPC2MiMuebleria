/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cargaDeDatos;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author HP
 */
public class ConCargaDatos {
     public static Connection conect = null;
    public static Statement stmt = null;
    public static ResultSet result = null;
    private static String driver = "com.mysql.cj.jdbc.Driver";
     public static void initConectionSQL() {
        try {
            Class.forName(driver);
            conect = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/mimuebleria", "eiler", "eiler123");
            //stmt = conection.createStatement();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ConCargaDatos.class.getName()).log(Level.SEVERE, null, ex);

        } catch (SQLException ex) {
            Logger.getLogger(ConCargaDatos.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
     public static void insertarUsuario(String nombre, String password, String area) {
        try {
            initConectionSQL();
            //stmt.executeUpdate("INSERT INTO usuarios VALUES('" + nombre + "','" + apellido + "','" + password + "','" + area + "');");
            PreparedStatement stmt = conect.prepareStatement("INSERT INTO usuarios (nombre,apellido,password,area) VALUES(?,?,?,?); ");
            stmt.setString(1, nombre);
            stmt.setString(2, "null");
            stmt.setString(3, password);
            stmt.setInt(4, Integer.parseInt(area));
            stmt.executeUpdate();
        } catch (SQLException x) {
            Logger.getLogger(ConCargaDatos.class.getName()).log(Level.SEVERE, null, x);
        } finally {
            if (conect != null) {
                try {
                    conect.close();
                } catch (SQLException ex) {

                }
            }
        }
    }
     public static void insertarPiezasCompradas(String nombre, String password, String area) {
        try {
            initConectionSQL();
            //stmt.executeUpdate("INSERT INTO usuarios VALUES('" + nombre + "','" + apellido + "','" + password + "','" + area + "');");
            PreparedStatement stmt = conect.prepareStatement("INSERT INTO usuarios (nombre,apellido,password,area) VALUES(?,?,?,?); ");
            stmt.setString(1, nombre);
            stmt.setString(2, "null");
            stmt.setString(3, password);
            stmt.setInt(4, Integer.parseInt(area));
            stmt.executeUpdate();
        } catch (SQLException x) {
            Logger.getLogger(ConCargaDatos.class.getName()).log(Level.SEVERE, null, x);
        } finally {
            if (conect != null) {
                try {
                    conect.close();
                } catch (SQLException ex) {

                }
            }
        }
    }
     public static void agregarPieza(String tipo, double costo) {

        try {
            initConectionSQL();
            PreparedStatement stmt = conect.prepareStatement("INSERT INTO piezas (tipo,costo,usada) VALUES(?,?,0); ");
            stmt.setString(1, tipo);
            stmt.setDouble(2, costo);
            stmt.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(ConCargaDatos.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (conect != null) {
                try {
                    conect.close();
                } catch (SQLException ex) {

                }
            }
        }
    }
      public static void agregarMuebleVenta(String nombreMueble, double precioVenta) {
        try {
            initConectionSQL();
            PreparedStatement stmt = conect.prepareStatement("insert into tiendamuebles(nombre,precio,precioCompra) values(?,?,?);");
            stmt.setString(1, nombreMueble);
            stmt.setDouble(2, precioVenta);
             stmt.setDouble(3,0);
            stmt.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ConCargaDatos.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (conect != null) {
                try {
                    conect.close();
                } catch (SQLException ex) {

                }
            }
        }
    }
      public static void agregarMuebleModificado(String nombreMueble, double precio,double precioCompraMueble, int id) {
        try {
            initConectionSQL();
            PreparedStatement stmt = conect.prepareStatement("update tiendamuebles set nombre=?,precio=?,precioCompra=? where id=?;");
            stmt.setString(1, nombreMueble);
            stmt.setDouble(2, precio);
             stmt.setDouble(3, precioCompraMueble);
             stmt.setInt(4, id);
            stmt.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ConCargaDatos.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (conect != null) {
                try {
                    conect.close();
                } catch (SQLException ex) {

                }
            }
        }
    }
      public static void agregarClientes(String nombre,String apellido,String nit,String direccion){
            try {
            initConectionSQL();
            PreparedStatement stmt = conect.prepareStatement("insert into clientes(nit,nombre,apellido,direccion) values(?,?,?,?);");
            stmt.setString(1, nit);
            stmt.setString(2, nombre);
             stmt.setString(3,apellido);
             stmt.setString(4,direccion);
            stmt.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ConCargaDatos.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (conect != null) {
                try {
                    conect.close();
                } catch (SQLException ex) {

                }
            }
        }
      }
    
}
