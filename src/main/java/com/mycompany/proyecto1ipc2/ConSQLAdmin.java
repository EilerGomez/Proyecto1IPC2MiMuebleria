/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.proyecto1ipc2;

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
public class ConSQLAdmin {
     public static Connection conection = null;
    public static Statement stmt = null;
    public static ResultSet rs = null;
    private static String driver = "com.mysql.cj.jdbc.Driver";

    public static void initConection() {
        try {
            Class.forName(driver);
            conection = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/mimuebleria", "root", "mysql");
            stmt = conection.createStatement();
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
}
