<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<nav class="navbar">
    <div class="nav-container">
        <a href="${pageContext.request.contextPath}/books" class="nav-logo">BookStore</a>
        <div class="nav-links">
            <a href="${pageContext.request.contextPath}/books">Home</a>
            <a href="${pageContext.request.contextPath}/cart">Cart</a>
            <a href="${pageContext.request.contextPath}/login">Login</a>
        </div>
    </div>
</nav>

<style>
.navbar {
    background-color: #2c3e50;
    padding: 1rem 0;
}

.nav-container {
    max-width: 1200px;
    margin: 0 auto;
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 0 20px;
}

.nav-logo {
    color: white;
    text-decoration: none;
    font-size: 1.5rem;
    font-weight: bold;
}

.nav-links a {
    color: white;
    text-decoration: none;
    margin-left: 20px;
    transition: color 0.3s;
}

.nav-links a:hover {
    color: #3498db;
}
</style>