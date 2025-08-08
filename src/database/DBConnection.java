/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package database;

import configuration.Configuration;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author kotar
 */
public class DBConnection {

    private static DBConnection instance;
    private Connection connection;

    private DBConnection() {
    }

    public static DBConnection getInstance() {
        if (instance == null) {
            instance = new DBConnection();
        }
        return instance;
    }

    public Connection getConnection() {
        try {
            if (connection == null || connection.isClosed()) {
                String url = Configuration.getInstance().getProperty("url");
                String user = Configuration.getInstance().getProperty("user");
                String password = Configuration.getInstance().getProperty("password");
                connection = DriverManager.getConnection(url, user, password);
                connection.setAutoCommit(false);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DBConnection.class.getName()).log(Level.SEVERE, null, ex);
        }
        return connection;
    }

}
