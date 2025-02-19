<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Online Book Store</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap" rel="stylesheet">
</head>
<body>
    <!-- Navigation -->
    <div class="nav-container">
        <div class="nav-content">
            <div class="nav-brand">
                <h2 style="color: white;">BookStore</h2>
            </div>
            <div class="nav-links">
                <a href="${pageContext.request.contextPath}/books">Home</a>
                <a href="${pageContext.request.contextPath}/cart">Cart</a>
                <c:choose>
                    <c:when test="${sessionScope.username != null}">
                        <a href="${pageContext.request.contextPath}/logout">Logout</a>
                    </c:when>
                    <c:otherwise>
                        <a href="${pageContext.request.contextPath}/login">Login</a>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </div>

    <!-- Header Info -->
    <div class="header-info">
        <div class="datetime">
            Current Date and Time (UTC): 
            <%= java.time.LocalDateTime.now().format(java.time.format.DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss")) %>
        </div>
        <div class="user-info">
            Current User's Login: ${sessionScope.username != null ? sessionScope.username : "Guest"}
        </div>
    </div>

    <div class="container">
        <h1>Welcome to Online Book Store</h1>
        
        <div class="book-list">
            <c:forEach var="book" items="${books}">
                <div class="book-card">
                    <h3>${book.title}</h3>
                    <p><strong>Author:</strong> ${book.author}</p>
                    <p class="price">$${book.price}</p>
                    <p><strong>Available:</strong> ${book.quantity} copies</p>
                    <form action="cart" method="POST">
                        <input type="hidden" name="bookId" value="${book.id}">
                        <button type="submit" class="submit-btn">Add to Cart</button>
                    </form>
                </div>
            </c:forEach>
        </div>
    </div>
</body>
</html>