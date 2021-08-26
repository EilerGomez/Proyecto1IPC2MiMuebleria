/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.proyecto1ipc2;

import java.sql.*;
import java.time.LocalDate;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpSession;

/**
 *
 * @author HP
 */
public class ConexionSQL {

    public static Connection con = null;
    public static Statement stmt = null;
    public static ResultSet result = null;
    private static String driver = "com.mysql.cj.jdbc.Driver";

    public static void iniciarConexion() {
        try {
            Class.forName(driver);
            con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/mimuebleria", "root", "mysql");
            stmt = con.createStatement();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ConexionSQL.class.getName()).log(Level.SEVERE, null, ex);

        } catch (SQLException ex) {
            Logger.getLogger(ConexionSQL.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public static void cerrarConexion() {
        try {
            con.close();
            stmt.close();;
            result.close();
            con = null;
            stmt = null;
            result = null;
        } catch (SQLException ex) {
            Logger.getLogger(ConexionSQL.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public static void verificarUsuario(String usuario, String password, String area) {
        try {
            iniciarConexion();
            //result = stmt.executeQuery("select * from usuarios where nombre='" + usuario + "' and password='" + password + "' and area='" + area + "';");
            PreparedStatement query = con.prepareStatement("SELECT * FROM usuarios WHERE nombre like ? and password like ? and area like ?;");
            query.setString(1, "%" + usuario + "%");
            query.setString(2, "%" + password + "%");
            query.setString(3, "%" + area + "%");
            result = query.executeQuery();
        } catch (SQLException x) {
            Logger.getLogger(ConexionSQL.class.getName()).log(Level.SEVERE, null, x);

        }

    }

    public static void insertarNuevoUsuario(String nombre, String apellido, String password, String area) {
        try {
            iniciarConexion();
            //stmt.executeUpdate("INSERT INTO usuarios VALUES('" + nombre + "','" + apellido + "','" + password + "','" + area + "');");
            PreparedStatement stmt = con.prepareStatement("INSERT INTO usuarios (nombre,apellido,password,area) VALUES(?,?,?,?); ");
            stmt.setString(1, nombre);
            stmt.setString(2, apellido);
            stmt.setString(3, password);
            stmt.setString(4, area);
            stmt.executeUpdate();
        } catch (SQLException x) {
            Logger.getLogger(ConexionSQL.class.getName()).log(Level.SEVERE, null, x);
        } finally {
            if (con != null) {
                try {
                    con.close();
                } catch (SQLException ex) {

                }
            }
        }
    }

    public static void modificarDatos(String nombre, String apellido, String password, HttpSession sesion) {
        try {
            iniciarConexion();
            stmt.executeUpdate("update usuarios set nombre='" + nombre + "',apellido='" + apellido + "', password='" + password + "' where id='" + sesion.getAttribute("id") + "';");
            /* PreparedStatement query = con.prepareStatement("update usuarios set nombre =?, apellido = ?,password = ? where id = ?;");
            query.setString(1, "%" + nombre + "%");
            query.setString(2, "%" + apellido + "%");
            query.setString(3, "%" + password + "%");
            query.setString(4, "%" + sesion.getAttribute("id") + "%");*/

        } catch (SQLException x) {
            Logger.getLogger(ConexionSQL.class.getName()).log(Level.SEVERE, null, x);
        } finally {
            if (con != null) {
                try {
                    con.close();
                } catch (SQLException ex) {

                }
            }
        }
    }

    public static void agregarPieza(String tipo, double costo) {

        try {
            iniciarConexion();
            PreparedStatement stmt = con.prepareStatement("INSERT INTO piezas (tipo,costo,usada) VALUES(?,?,0); ");
            stmt.setString(1, tipo);
            stmt.setDouble(2, costo);
            stmt.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(ConexionSQL.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (con != null) {
                try {
                    con.close();
                } catch (SQLException ex) {

                }
            }
        }
    }

    public static void agregarGastoAInventario(double gasto, int cantidad,HttpSession sesion,double capital) {
        try {
            iniciarConexion();
             //result=stmt.executeQuery("Select * from piezas order by id desc limit 1 ;");
            String motivo=cantidad+"Cp"+result.getString("id")+"";
            /*result=stmt.executeQuery("SELECT MAX(id) AS id FROM piezas;");
            String idCompra=result.getString("id");
            String motivo=""+cantidad+"Cp"+idCompra;
            ResultSet result2=stmt.executeQuery("SELECT MAX(capital) AS capital FROM inventario;");
            double capitalAnterior=Double.valueOf(result2.getString("capital"));
            double capitalActual=capitalAnterior-gasto;
            
            PreparedStatement stmt2=con.prepareStatement("INSERT INTO inventario (gasto,ganancia,motivo,capital) values(?,?,?,?) ");
            stmt2.setDouble(1, gasto);
            stmt2.setDouble(2, 0);
            stmt2.setString(3, motivo);
            stmt2.setDouble(4, capitalActual);*/
            
            PreparedStatement pstmt=con.prepareStatement("INSERT INTO inventario(gasto,ganancia,motivo,capital) values(?,0,?,?);");
            pstmt.setDouble(1, gasto);
            pstmt.setString(2, motivo);
            pstmt.setDouble(3, capital-gasto);
            pstmt.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ConexionSQL.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (con != null) {
                try {
                    con.close();
                } catch (SQLException ex) {

                }
            }
        }
    }
    //obtener el ultimo id de una pieza
    public static void obteneridPieza(){
        try {
            iniciarConexion();
            result=stmt.executeQuery("Select * from piezas order by id desc limit 1 ;");
        } catch (SQLException ex) {
            Logger.getLogger(ConexionSQL.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    //obtener el capital anterior
    public static void obtenerCapitalAnt(){
        try {
            iniciarConexion();
            result=stmt.executeQuery("Select * from inventario order by id desc limit 1 ;");
        } catch (SQLException ex) {
            Logger.getLogger(ConexionSQL.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    public static void traerTablaPiezasHistorial(){
        try {
            iniciarConexion();
            result=stmt.executeQuery("Select * from piezas order by id desc;");
        } catch (SQLException ex) {
            Logger.getLogger(ConexionSQL.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    public static void traerPiezasNoUsadas(){
     try {
            iniciarConexion();
            result=stmt.executeQuery("Select * from piezas where usada=0;");
        } catch (SQLException ex) {
            Logger.getLogger(ConexionSQL.class.getName()).log(Level.SEVERE, null, ex);
        }   
    }
    
    public static void traerpiezasParaComprar(){
         try {
            iniciarConexion();
            result=stmt.executeQuery("Select * from tiendaPiezas order by nombre;");
        } catch (SQLException ex) {
            Logger.getLogger(ConexionSQL.class.getName()).log(Level.SEVERE, null, ex);
        } 
    }
    
    public static void agregarPiezaVenta(String nombre, double precio){
         try {
            iniciarConexion();
            //stmt.executeUpdate("INSERT INTO tiendapiezas(nombre,precio) values('"+nombre+"',"+precio+");");
            PreparedStatement stmt=con.prepareStatement("insert into tiendapiezas(nombre,precio) values(?,?);");
            stmt.setString(1, nombre);
            stmt.setDouble(2, precio);
            stmt.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ConexionSQL.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (con != null) {
                try {
                    con.close();
                } catch (SQLException ex) {

                }
            }
        }
    }
    public static void agregarMuebleVenta(String nombreMueble, double precio){
         try {
            iniciarConexion();
            PreparedStatement stmt=con.prepareStatement("insert into tiendamuebles(nombre,precio) values(?,?);");
            stmt.setString(1, nombreMueble);
            stmt.setDouble(2, precio);
            stmt.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ConexionSQL.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (con != null) {
                try {
                    con.close();
                } catch (SQLException ex) {

                }
            }
        }
    }
    public static void traerMueblesParaGenerar(){
        try {
            iniciarConexion();
            result=stmt.executeQuery("Select * from tiendamuebles order by nombre;");
        } catch (SQLException ex) {
            Logger.getLogger(ConexionSQL.class.getName()).log(Level.SEVERE, null, ex);
        } 
    }
    public static void traerIdPiezasVerificacion(String id){
         try {
            iniciarConexion();
            PreparedStatement query = con.prepareStatement("SELECT * FROM piezas WHERE id like ?;");
            query.setString(1, "%" +id + "%");  
            result=query.executeQuery();
         } catch (SQLException ex) {
            Logger.getLogger(ConexionSQL.class.getName()).log(Level.SEVERE, null, ex);
        } 
    }
    public static void almacenarMueblesEnsamblados(String piezasUsadas,HttpSession sesion, double costo, String nombre){
         try {
            iniciarConexion();
            PreparedStatement stmt=con.prepareStatement("insert into muebles(piezasUsadas,usuarioEnsamblador,fechaEnsamble,costo,tipo,aLaVenta,vendido) values(?,?,?,?,?,0,0);");
            stmt.setString(1, piezasUsadas);
            stmt.setInt(2, Integer.parseInt((String) sesion.getAttribute("id")));
            stmt.setDate(3, Date.valueOf(LocalDate.MAX));
            stmt.setDouble(4, costo);
            stmt.setString(5, nombre);
            stmt.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ConexionSQL.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (con != null) {
                try {
                    con.close();
                } catch (SQLException ex) {

                }
            }
        }
    }
    public static void cambiarUsoPiezas(String ids){
        int id=Integer.parseInt(ids);
        try {
            iniciarConexion();
            stmt.executeUpdate("update piezas set usada=1 where id="+id+";");
        } catch (SQLException ex) {
            Logger.getLogger(ConexionSQL.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (con != null) {
                try {
                    con.close();
                } catch (SQLException ex) {

                }
            }
        }
    }
}
