package com.DB;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBconnect {
	private static Connection connection;

    public static Connection getConnection() {
        
        try {
            // Load the MySQL JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Set up connection parameters
            String url = "jdbc:mysql://localhost:3306/parkingmanagementsystem";
            String username = "root"; // MySQL username
            String password = "9841"; // MySQL password

            // Establish the connection
            connection = DriverManager.getConnection(url, username, password);
            System.out.println("Connected to the database.");
        } catch (ClassNotFoundException e) {
            System.err.println("Error: MySQL JDBC driver not found!");
            e.printStackTrace();
        } catch (SQLException e) {
            System.err.println("Error: Failed to connect to the database!");
            e.printStackTrace();
        }

        return connection;
    }
}
