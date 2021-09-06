/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.proyecto1ipc2;

import java.sql.Connection;
import java.sql.Date;
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
public class ConSQLAdmin {
     public static Connection conection = null;
    public static Statement stmt = null;
    public static ResultSet rs = null;
    private static String driver = "com.mysql.cj.jdbc.Driver";

    public static void initConection() {
        try {
            Class.forName(driver);
            conection = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/mimuebleria", "eiler", "eiler123");
            //stmt = conection.createStatement();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ConexionSQL.class.getName()).log(Level.SEVERE, null, ex);

        } catch (SQLException ex) {
            Logger.getLogger(ConexionSQL.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    public static void traerUsuarios(){
         try {
             initConection();
             PreparedStatement query = conection.prepareStatement("Select * from usuarios;");
             rs=query.executeQuery();
         } catch (SQLException ex) {
             Logger.getLogger(ConSQLAdmin.class.getName()).log(Level.SEVERE, null, ex);
         } 
    }
    public static void modificarPermisoUsuario(int idActual,int areaNueva){
      try {
             initConection();
            PreparedStatement query=conection.prepareStatement("update usuarios set area=? where id=?");
            query.setInt(1, areaNueva);
            query.setInt(2, idActual);
            query.executeUpdate();
         } catch (SQLException ex) {
             Logger.getLogger(ConSQLAdmin.class.getName()).log(Level.SEVERE, null, ex);
         } finally {
            if (conection != null) {
                try {
                    conection.close();
                } catch (SQLException ex) {

                }
            }
        }
    }
    public static void traerVentasXtiempo(String fechaDe, String fechaHasta){
          try {
             initConection();
             PreparedStatement query = conection.prepareStatement("SELECT cv.codigoVenta,cv.codigoMueble,m.tipo,m.costo,cv.fechaVenta FROM compraventa cv JOIN muebles m ON(m.codigo=cv.codigoMueble) where cv.fechaVenta >=? and cv.fechaVenta <=?;");
             query.setDate(1, Date.valueOf(fechaDe));
              query.setDate(2, Date.valueOf(fechaHasta));
             rs=query.executeQuery();
         } catch (SQLException ex) {
             Logger.getLogger(ConSQLAdmin.class.getName()).log(Level.SEVERE, null, ex);
         }
    }
    public static void traerDevolucionXtiempo(String fechaDe, String fechaHasta){
         try {
             initConection();
             PreparedStatement query = conection.prepareStatement("select d.codigoDevolucion,d.codigoMueble,m.tipo,d.nitCliente,c.nombre,c.apellido,d.perdida,d.fechaDevolucion FROM devolucion d JOIN muebles m ON(d.codigoMueble=m.codigo) JOIN clientes c ON(d.nitCliente=c.nit) where d.fechaDevolucion>=? and d.fechaDevolucion<=?;");
             query.setDate(1, Date.valueOf(fechaDe));
              query.setDate(2, Date.valueOf(fechaHasta));
             rs=query.executeQuery();
         } catch (SQLException ex) {
             Logger.getLogger(ConSQLAdmin.class.getName()).log(Level.SEVERE, null, ex);
         }
    
    }
    public static void traerGananciasXtiempo(String fechaDe, String fechaHasta){
         try {
             initConection();
             PreparedStatement query = conection.prepareStatement("select cv.codigoVenta,cv.codigoMueble,m.tipo, m.costo, t.precioCompra,cv.fechaVenta FROM compraventa cv JOIN muebles m ON(cv.codigoMueble=m.codigo) \n" +
                "JOIN tiendaMuebles t ON(m.tipo=t.nombre) where cv.fechaVenta>=? and cv.fechaVenta<=?;");
             query.setDate(1, Date.valueOf(fechaDe));
              query.setDate(2, Date.valueOf(fechaHasta));
             rs=query.executeQuery();
         } catch (SQLException ex) {
             Logger.getLogger(ConSQLAdmin.class.getName()).log(Level.SEVERE, null, ex);
         }
    }
    public static void traerUsuarioMayorventa(String fechaDe,String fechaHasta){
         try {
             initConection();
             PreparedStatement query = conection.prepareStatement("SELECT cv.idUsuario, u.nombre,u.apellido, COUNT( idUsuario) maximo\n" +
                                       "FROM compraventa cv JOIN usuarios u ON(u.id=cv.idUsuario) where fechaVenta>=? and fechaVenta<=?\n" +
                                       "GROUP BY idUsuario\n" +
                                       "ORDER BY maximo DESC LIMIT 1;");
             query.setDate(1, Date.valueOf(fechaDe));
              query.setDate(2, Date.valueOf(fechaHasta));
             rs=query.executeQuery();
         } catch (SQLException ex) {
             Logger.getLogger(ConSQLAdmin.class.getName()).log(Level.SEVERE, null, ex);
         }
    }
    public static void traerVentasMaxPorUsuario(int idUsuario){
          try {
             initConection();
             PreparedStatement query = conection.prepareStatement("SELECT cv.codigoMueble, m.tipo,m.costo FROM compraventa cv JOIN muebles m ON(m.codigo=cv.codigoMueble) where cv.idUsuario=?;");
             query.setInt(1,idUsuario);
             rs=query.executeQuery();
         } catch (SQLException ex) {
             Logger.getLogger(ConSQLAdmin.class.getName()).log(Level.SEVERE, null, ex);
         }
    }
    public static void traerMuebleMasVendidoXtiempo(String fechaDe,String fechaHasta){
          try {
             initConection();
             PreparedStatement query = conection.prepareStatement("SELECT m.tipo, COUNT( tipo) maximo\n" +
                    "FROM muebles m JOIN compraventa cv ON(m.codigo=cv.codigoMueble) where m.vendido=1 and cv.fechaVenta >=? and cv.fechaVenta <=?\n" +
                    "GROUP BY tipo\n" +
                    "ORDER BY maximo desc LIMIT 1;");
             query.setDate(1, Date.valueOf(fechaDe));
              query.setDate(2, Date.valueOf(fechaHasta));
             rs=query.executeQuery();
         } catch (SQLException ex) {
             Logger.getLogger(ConSQLAdmin.class.getName()).log(Level.SEVERE, null, ex);
         }
    }
    public static void traerDetallesMuebleMasVendido(String tipo, String fechaDe,String fechaHasta){
         try {
             initConection();
             PreparedStatement query = conection.prepareStatement("SELECT cv.codigoMueble, m.tipo,m.costo FROM compraventa cv JOIN muebles m ON(m.codigo=cv.codigoMueble) where m.tipo=? and cv.fechaVenta>=? and cv.fechaVenta <=?;");
             query.setString(1,tipo);
             query.setDate(2,Date.valueOf(fechaDe));
              query.setDate(3,Date.valueOf(fechaHasta));             
             rs=query.executeQuery();
         } catch (SQLException ex) {
             Logger.getLogger(ConSQLAdmin.class.getName()).log(Level.SEVERE, null, ex);
         }
    }
    public static void traerMuebleMenosVendidoXtiempo(String fechaDe,String fechaHasta){
          try {
             initConection();
             PreparedStatement query = conection.prepareStatement("SELECT m.tipo, COUNT( tipo) maximo\n" +
                    "FROM muebles m JOIN compraventa cv ON(m.codigo=cv.codigoMueble) where m.vendido=1 and cv.fechaVenta >=? and cv.fechaVenta <=?\n" +
                    "GROUP BY tipo\n" +
                    "ORDER BY maximo asc LIMIT 1;");
             query.setDate(1, Date.valueOf(fechaDe));
              query.setDate(2, Date.valueOf(fechaHasta));
             rs=query.executeQuery();
         } catch (SQLException ex) {
             Logger.getLogger(ConSQLAdmin.class.getName()).log(Level.SEVERE, null, ex);
         }
    }
    public static void traerDetallesMuebleMenosVendido(String tipo, String fechaDe,String fechaHasta){
         try {
             initConection();
             PreparedStatement query = conection.prepareStatement("SELECT cv.codigoMueble, m.tipo,m.costo FROM compraventa cv JOIN muebles m ON(m.codigo=cv.codigoMueble) where m.tipo=? and cv.fechaVenta>=? and cv.fechaVenta <=?;");
             query.setString(1,tipo);
             query.setDate(2,Date.valueOf(fechaDe));
              query.setDate(3,Date.valueOf(fechaHasta));             
             rs=query.executeQuery();
         } catch (SQLException ex) {
             Logger.getLogger(ConSQLAdmin.class.getName()).log(Level.SEVERE, null, ex);
         }
    }
    public static void agregarMuebleVenta(String nombreMueble, double precio,double precioCompraMueble) {
        try {
            initConection();
            PreparedStatement stmt = conection.prepareStatement("insert into tiendamuebles(nombre,precio,precioCompra) values(?,?,?);");
            stmt.setString(1, nombreMueble);
            stmt.setDouble(2, precio);
             stmt.setDouble(3, precioCompraMueble);
            stmt.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ConexionSQL.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (conection != null) {
                try {
                    conection.close();
                } catch (SQLException ex) {

                }
            }
        }
    }
    public static void traerMueblesGenerados() {
        try {
             initConection();
             PreparedStatement query = conection.prepareStatement("Select * from tiendamuebles;");
             rs=query.executeQuery();
         } catch (SQLException ex) {
             Logger.getLogger(ConSQLAdmin.class.getName()).log(Level.SEVERE, null, ex);
         }
    }
    public static void eliminarUsuario(int id){
        try {
             initConection();
             Statement query = conection.createStatement();
             query.executeUpdate("delete from usuarios where id="+id+";");
         } catch (SQLException ex) {
             Logger.getLogger(ConSQLAdmin.class.getName()).log(Level.SEVERE, null, ex);
         } finally {
            if (conection != null) {
                try {
                    conection.close();
                } catch (SQLException ex) {

                }
            }
        }
    }
    public static void grabarCapital(double capital, Date fecha){
        try {
            initConection();
            PreparedStatement stmt = conection.prepareStatement("insert into inventario(gasto,ganancia,motivo,capital,fecha) values(?,?,?,?,?);");
            stmt.setDouble(1, 0);
            stmt.setDouble(2, 0);
            stmt.setString(3, "ninguno");
            stmt.setDouble(4, capital);
            stmt.setDate(5, fecha);
            stmt.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ConexionSQL.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (conection != null) {
                try {
                    conection.close();
                } catch (SQLException ex) {

                }
            }
        }
    }
}
