<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.time.LocalDateTime" %>
<%@ page import="java.time.format.DateTimeFormatter" %>

<div class="header-info">
    <div class="datetime">
        Current Date and Time (UTC): 
        <%= LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss")) %>
    </div>
    <div class="user-info">
        Current User's Login: ${sessionScope.username != null ? sessionScope.username : "Guest"}
    </div>
</div>

<style>
.header-info {
    background-color: #2c3e50;
    color: white;
    padding: 10px 20px;
    display: flex;
    justify-content: space-between;
    align-items: center;
    font-size: 14px;
}

.datetime, .user-info {
    padding: 5px 10px;
    background-color: rgba(255, 255, 255, 0.1);
    border-radius: 4px;
}
</style>