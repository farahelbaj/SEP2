package org.example;

public class DatabaseInitializer {
    public static void main(String[] args) {
        System.out.println("Starting database initialization...");
        ResultService.initializeDatabase();
        System.out.println("Database initialization finished.");
    }
}