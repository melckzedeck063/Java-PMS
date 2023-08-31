<%-- 
    Document   : Dbconnection.jsp
    Created on : 31 Aug 2023, 10:35:00 am
    Author     : user
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.*"%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String jdbcUrl = "jdbc:mysql://localhost:3306/PMS";
    String jdbcUsername = "root";
    String jdbcPassword = "";

    try {
        Class.forName("com.mysql.jdbc.Driver");
        
        Connection connection = DriverManager.getConnection(jdbcUrl, jdbcUsername, jdbcPassword);
        application.setAttribute("dbConnection", connection);
    } catch (Exception e) {
        e.printStackTrace();
    }
%>

