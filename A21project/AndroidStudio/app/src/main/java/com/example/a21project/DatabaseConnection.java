package com.example.a21project;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnection {
    private static final String url = "jdbc:postgresql://192.168.0.106:5432/a21project";
    private static final String login = "postgres";
    private static final String password = "AvC4DG5Z";

    public static Connection getConnection() {
        Connection connection = null;
        try {
            // Загрузка драйвера PostgreSQL
            Class.forName("org.postgresql.Driver");
            connection = DriverManager.getConnection(url, login, password);
        } catch (ClassNotFoundException e) {
            System.err.println("Драйвер PostgreSQL JDBC не найден.");
            e.printStackTrace();
        } catch (SQLException e) {
            System.err.println("Не удалось установить соединение: " + e.getMessage());
            e.printStackTrace();
        }
        return connection;
    }
}