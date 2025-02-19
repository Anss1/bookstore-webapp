package com.bookstore.dao;

import com.bookstore.model.Book;
import com.bookstore.util.DatabaseConnection;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class BookDAO {
    
    public List<Book> getAllBooks() throws SQLException {
        List<Book> books = new ArrayList<>();
        String sql = "SELECT * FROM books";
        
        try (Connection conn = DatabaseConnection.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            
            while (rs.next()) {
                Book book = new Book();
                book.setId(rs.getInt("id"));
                book.setTitle(rs.getString("title"));
                book.setAuthor(rs.getString("author"));
                book.setPrice(rs.getDouble("price"));
                book.setQuantity(rs.getInt("quantity"));
                books.add(book);
            }
        }
        return books;
    }
    
    public List<Book> searchBooks(String keyword) throws SQLException {
        List<Book> result = new ArrayList<>();
        String sql = "SELECT * FROM books WHERE title LIKE ? OR author LIKE ?";
        
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setString(1, "%" + keyword + "%");
            stmt.setString(2, "%" + keyword + "%");
            
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    Book book = new Book();
                    book.setId(rs.getInt("id"));
                    book.setTitle(rs.getString("title"));
                    book.setAuthor(rs.getString("author"));
                    book.setPrice(rs.getDouble("price"));
                    book.setQuantity(rs.getInt("quantity"));
                    result.add(book);
                }
            }
        }
        return result;
    }
}