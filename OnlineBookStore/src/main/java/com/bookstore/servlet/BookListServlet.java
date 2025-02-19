package com.bookstore.servlet;

import com.bookstore.dao.BookDAO;
import com.bookstore.model.Book;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "BookListServlet", urlPatterns = {"/books"}, loadOnStartup = 1)
public class BookListServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private BookDAO bookDAO;
    
    @Override
    public void init() throws ServletException {
        super.init();
        bookDAO = new BookDAO();
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            List<Book> books = bookDAO.getAllBooks();
            request.setAttribute("books", books);
            request.getRequestDispatcher("/WEB-INF/views/bookList.jsp")
                   .forward(request, response);
        } catch (SQLException e) {
            throw new ServletException("Error retrieving books", e);
        }
    }
}