/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.proyecto1ipc2;

import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;

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

    public static void verificarUsuario(String usuario, String password) {
        try {
            iniciarConexion();
            result = stmt.executeQuery("select * from usuarios where usuario='" + usuario + "' and password='" + password + "';");
        } catch (SQLException x) {
            Logger.getLogger(ConexionSQL.class.getName()).log(Level.SEVERE, null, x);
        }
    }
}
