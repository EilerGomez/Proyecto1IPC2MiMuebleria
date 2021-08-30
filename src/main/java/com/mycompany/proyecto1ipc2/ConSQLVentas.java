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
import javax.servlet.http.HttpSession;

/**
 *
 * @author HP
 */
public class ConSQLVentas {
      public static Connection conect = null;
    public static Statement st = null;
    public static ResultSet resultado = null;
    private static String driver = "com.mysql.cj.jdbc.Driver";

    public static void iniciarConexionData() {
        try {
            Class.forName(driver);
            conect = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/mimuebleria", "root", "mysql");
            st = conect.createStatement();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ConexionSQL.class.getName()).log(Level.SEVERE, null, ex);

        } catch (SQLException ex) {
            Logger.getLogger(ConexionSQL.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    public static void verificarNit(String nit){
          try {
            iniciarConexionData();
            resultado=st.executeQuery("select * from clientes where nit="+nit+";");
        } catch (SQLException x) {
            Logger.getLogger(ConexionSQL.class.getName()).log(Level.SEVERE, null, x);

        }
    }
    public static void traerMueblesAlaVenta(){
         try {
            iniciarConexionData();
            resultado=st.executeQuery("select * from muebles where aLaVenta=1 and vendido=0;");
        } catch (SQLException x) {
            Logger.getLogger(ConexionSQL.class.getName()).log(Level.SEVERE, null, x);

        }
    }
    public static void almacenarVenta(int codigoMueble,String nitCliente,HttpSession sesion,String fecha){
         try {
            iniciarConexionData();
            PreparedStatement query=conect.prepareStatement("INSERT INTO compraventa(codigoMueble,nitCliente,idUsuario,fechaVenta) values(?,?,?,?);");
            query.setInt(1, codigoMueble);
            query.setString(2, nitCliente);
            query.setInt(3, Integer.parseInt((String) sesion.getAttribute("id")));
            query.setDate(4,Date.valueOf(fecha));
            query.executeUpdate();
        } catch (SQLException x) {
            Logger.getLogger(ConexionSQL.class.getName()).log(Level.SEVERE, null, x);

        }
    }
    public static void guardarCliente(String nit,String nombre,String apellido,String direccion){
         try {
            iniciarConexionData();            
            PreparedStatement query=conect.prepareStatement("INSERT INTO clientes(nit,nombre,apellido,direccion) values(?,?,?,?)");
            query.setString(1, nit);
            query.setString(2, nombre);
            query.setString(3,apellido);
            query.setString(4, direccion);
            query.executeUpdate();
        } catch (SQLException x) {
            Logger.getLogger(ConexionSQL.class.getName()).log(Level.SEVERE, null, x);

        }finally {
            if (conect != null) {
                try {
                    conect.close();
                } catch (SQLException ex) {

                }
            }
        }
    }
    public static void verificarMuebleVendidoONo(int codigo){
          try {
            iniciarConexionData();
            PreparedStatement query=conect.prepareStatement("select * from muebles where aLaVenta=1 and vendido=0 and codigo=?;");
            query.setInt(1, codigo);
            resultado=query.executeQuery();
        } catch (SQLException x) {
            Logger.getLogger(ConexionSQL.class.getName()).log(Level.SEVERE, null, x);

        }
    }
    public static void cambiarEstadoMuebleVendido(int codigo){
          try {
            iniciarConexionData();
            PreparedStatement query=conect.prepareStatement("update muebles set vendido=1 where codigo=?;");
            query.setInt(1, codigo);
            query.executeUpdate();
        } catch (SQLException x) {
            Logger.getLogger(ConexionSQL.class.getName()).log(Level.SEVERE, null, x);

        }
    }
    public static void agregarGananciaCapital(double ganancia,String motivo,double sumaCapital,String fecha){
         try {
            iniciarConexionData();
            PreparedStatement pstmt = conect.prepareStatement("INSERT INTO inventario(gasto,ganancia,motivo,capital,fecha) values(0,?,?,?,?);");
            pstmt.setDouble(1, ganancia);
            pstmt.setString(2, motivo);
            pstmt.setDouble(3, sumaCapital);
            pstmt.setDate(4, Date.valueOf(fecha));
            pstmt.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ConexionSQL.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (conect != null) {
                try {
                    conect.close();
                } catch (SQLException ex) {

                }
            }
        }
    }
    public static void guardarFactura(int codigoFactura,String nitCliente,HttpSession sesion,String producto,double total,String fecha){
         try {
            iniciarConexionData();
            PreparedStatement pstmt = conect.prepareStatement("INSERT INTO facturas(codigoFactura,nitCliente,usuario,producto,total,fecha) values(?,?,?,?,?,?);");
            pstmt.setInt(1, codigoFactura);
            pstmt.setString(2, nitCliente);
            pstmt.setInt(3, Integer.parseInt((String) sesion.getAttribute("id")));
            pstmt.setString(4, producto);
            pstmt.setDouble(5, total);
            pstmt.setDate(6, Date.valueOf(fecha));
            pstmt.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ConexionSQL.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (conect != null) {
                try {
                    conect.close();
                } catch (SQLException ex) {

                }
            }
        }
    }
    public static void traerVentaParaFactura(String nitCliente){
         try {
            iniciarConexionData();
            PreparedStatement query=conect.prepareStatement("Select cv.codigoVenta,cv.nitCliente,c.nombre,c.apellido,cv.idUsuario,cv.codigoMueble,m.tipo,cv.fechaVenta FROM compraventa cv JOIN muebles m ON(cv.codigoMueble=m.codigo) JOIN clientes c ON(c.nit=cv.nitCliente) where cv.nitCliente=?;");
            query.setString(1, nitCliente);
            resultado=query.executeQuery();
        } catch (SQLException x) {
            Logger.getLogger(ConexionSQL.class.getName()).log(Level.SEVERE, null, x);

        }
    }
    public static void registrarDevolucion(int codigoMueble,String nitCliente,String fechaDevolucion,int codigoDevolucion,double perdida){
         try {
            iniciarConexionData();
            PreparedStatement pstmt = conect.prepareStatement("INSERT INTO devolucion(codigoDevolucion,codigoMueble,perdida,nitCliente,fechaDevolucion) values(?,?,?,?,?);");
            pstmt.setInt(1, codigoDevolucion);
            pstmt.setInt(2, codigoMueble);
            pstmt.setDouble(3, perdida);
            pstmt.setString(4, nitCliente);
            pstmt.setDate(5, Date.valueOf(fechaDevolucion));
            pstmt.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ConexionSQL.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (conect != null) {
                try {
                    conect.close();
                } catch (SQLException ex) {

                }
            }
        }
    }
    public static void compararFechas(String fechaActual,String fechaVenta, int codigoVenta){
         try {
            iniciarConexionData();
            PreparedStatement query=conect.prepareStatement("select DATEDIFF(DATE(?), DATE(?)) from compraventa where codigoVenta=?;");
            query.setDate(1, Date.valueOf(fechaActual));
            query.setDate(2, Date.valueOf(fechaVenta));
            query.setInt(3, codigoVenta);
            resultado=query.executeQuery();
        } catch (SQLException x) {
            Logger.getLogger(ConexionSQL.class.getName()).log(Level.SEVERE, null, x);

        }
    }
    public static String obtenerFechaVenta(int codigoVenta){
        String fecha=null;
         try {
             
            iniciarConexionData();
            PreparedStatement query=conect.prepareStatement("select * from compraventa where codigoVenta=?;");
            query.setInt(1, codigoVenta);
            resultado=query.executeQuery();
            while(resultado.next()){
                fecha=resultado.getString("fechaVenta");
            }
            resultado.close();
        } catch (SQLException x) {
            Logger.getLogger(ConexionSQL.class.getName()).log(Level.SEVERE, null, x);

        }
        return fecha;
    }
     public static String obtenerCodigoMueble(int codigoVenta){
        String codigoMueble="";
         try {
             
            iniciarConexionData();
            PreparedStatement query=conect.prepareStatement("select * from compraventa where codigoVenta=?;");
            query.setInt(1, codigoVenta);
            resultado=query.executeQuery();
            while(resultado.next()){
                codigoMueble=resultado.getString("codigoMueble");
            }
            resultado.close();
        } catch (SQLException x) {
            Logger.getLogger(ConexionSQL.class.getName()).log(Level.SEVERE, null, x);

        }
        return codigoMueble;
    }
    public static void eliminarVenta(int codigoVenta){
        try {
            iniciarConexionData();
            PreparedStatement pstmt = conect.prepareStatement("delete from compraventa where codigoVenta=?;");
            pstmt.setInt(1, codigoVenta);
            pstmt.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ConexionSQL.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (conect != null) {
                try {
                    conect.close();
                } catch (SQLException ex) {

                }
            }
        }
    }
    public static void modificarIdMueble(int codigoMueble,double nuevoCosto){
        try {
            iniciarConexionData();
            PreparedStatement query=conect.prepareStatement("update muebles set costo=?,vendido=0 where codigo=?;");
            query.setDouble(1, nuevoCosto);
            query.setInt(2, codigoMueble);
            query.executeUpdate();
        } catch (SQLException x) {
            Logger.getLogger(ConexionSQL.class.getName()).log(Level.SEVERE, null, x);

        }finally {
            if (conect != null) {
                try {
                    conect.close();
                } catch (SQLException ex) {

                }
            }
        }
    }
    public static String traerCostoVenta(String motivo){
        String ganancia=null;
         try {
             
            iniciarConexionData();
            PreparedStatement query=conect.prepareStatement("select * from inventario where motivo=?;");
            query.setString(1, motivo);
            resultado=query.executeQuery();
            while(resultado.next()){
                ganancia=resultado.getString("ganancia");
            }
            resultado.close();
        } catch (SQLException x) {
            Logger.getLogger(ConexionSQL.class.getName()).log(Level.SEVERE, null, x);

        }
         return ganancia;
        
    }
    public static void agregarDevolucionInventario(double gasto,double ganancia,String motivo,double capital,String fecha){
          try {
            iniciarConexionData();
            PreparedStatement pstmt = conect.prepareStatement("INSERT INTO inventario(gasto,ganancia,motivo,capital,fecha) values(?,?,?,?,?);");
            pstmt.setDouble(1, gasto);
            pstmt.setDouble(2, ganancia);
            pstmt.setString(3, motivo);
            pstmt.setDouble(4, capital);
            pstmt.setDate(5, Date.valueOf(fecha));
            pstmt.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ConexionSQL.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (conect != null) {
                try {
                    conect.close();
                } catch (SQLException ex) {

                }
            }
        }
    }
    public static String obtenerNitCliente(int codigoVenta){
         String nitCliente="";
         try {
             
            iniciarConexionData();
            PreparedStatement query=conect.prepareStatement("select * from compraventa where codigoVenta=?;");
            query.setInt(1, codigoVenta);
            resultado=query.executeQuery();
            while(resultado.next()){
                nitCliente=resultado.getString("nitCliente");
            }
            resultado.close();
        } catch (SQLException x) {
            Logger.getLogger(ConexionSQL.class.getName()).log(Level.SEVERE, null, x);

        }
        return nitCliente;
    }
    public static void traerConsultaCompras(String nitCliente,String fechaDe,String fechaHasta){
        try {
             Date fechade=Date.valueOf(fechaDe);
            iniciarConexionData();
            PreparedStatement query=conect.prepareStatement("select v.codigoVenta,v.codigoMueble,m.tipo, v.nitCliente,c.nombre,c.apellido,v.fechaVenta from compraventa v JOIN muebles m ON(m.codigo=v.codigoMueble) JOIN clientes c ON(c.nit=v.nitCliente)\n" +
                            " where v.nitCliente=? and v.fechaVenta >= ? and v.fechaVenta <= ?;");
            query.setString(1,nitCliente);
            query.setDate(2, fechade);
            query.setDate(3, Date.valueOf(fechaHasta));
            resultado=query.executeQuery(); 
        } catch (SQLException x) {
            Logger.getLogger(ConexionSQL.class.getName()).log(Level.SEVERE, null, x);

        }
    }
    public static void consultarDevoluciones(String nitCliente,String fechaDe,String fechaHasta){
        try {
             Date fechade=Date.valueOf(fechaDe);
            iniciarConexionData();
            PreparedStatement query=conect.prepareStatement(" SELECT d.codigoDevolucion,d.codigoMueble,m.tipo,d.nitCliente,c.nombre,c.apellido,d.fechaDevolucion FROM devolucion d JOIN muebles m ON(m.codigo=d.codigoMueble)\n" +
            " JOIN clientes c ON (c.nit=d.nitCliente) where d.nitCliente=? and d.fechaDevolucion >=? and d.fechaDevolucion <=?;");
            query.setString(1,nitCliente);
            query.setDate(2, fechade);
            query.setDate(3, Date.valueOf(fechaHasta));
            resultado=query.executeQuery(); 
        } catch (SQLException x) {
            Logger.getLogger(ConexionSQL.class.getName()).log(Level.SEVERE, null, x);

        }
    }
    public static void traerVentasDeHoy(String fechaHoy){
        try {
            
            iniciarConexionData();
            PreparedStatement query=conect.prepareStatement(" SELECT cv.codigoVenta,cv.codigoMueble,m.tipo,cv.nitCliente,c.nombre,c.apellido,cv.fechaVenta FROM compraventa cv JOIN muebles m ON(m.codigo=cv.codigoMueble) \n" +
                    "JOIN clientes c ON(c.nit=cv.nitCliente) where cv.fechaVenta=?;");
            query.setDate(1, Date.valueOf(fechaHoy));
            resultado=query.executeQuery(); 
        } catch (SQLException x) {
            Logger.getLogger(ConexionSQL.class.getName()).log(Level.SEVERE, null, x);

        }
    }
}
