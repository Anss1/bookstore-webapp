package com.bookstore.util;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/error")
public class ErrorHandler extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processError(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processError(request, response);
    }

    private void processError(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Get error details
        Throwable throwable = (Throwable) request
                .getAttribute("jakarta.servlet.error.exception");
        Integer statusCode = (Integer) request
                .getAttribute("jakarta.servlet.error.status_code");
        String servletName = (String) request
                .getAttribute("jakarta.servlet.error.servlet_name");

        request.setAttribute("error", throwable);
        request.setAttribute("statusCode", statusCode);
        request.setAttribute("servletName", servletName);

        request.getRequestDispatcher("/WEB-INF/views/error.jsp")
               .forward(request, response);
    }
}