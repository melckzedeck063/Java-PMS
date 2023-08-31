<%-- 
    Document   : login.jsp
    Created on : 30 Aug 2023, 11:07:45 am
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %> 

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pharmacy Management System || Welcome</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" />
    <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">


    <!-- local -->
    <link rel="stylesheet" href="index.css">
    <style>
        .msg{
            background: green;
            color: white;
            padding: 3px;
            width : 20%;
            margin: auto;
        }
    </style>
    
    <%
    if(request.getMethod().equals("POST")){
    
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    
         Connection conn = null;
    try {
        String url = "jdbc:mysql://localhost:3306/IPT1";
        String user = "root";
        String passcode = "";

        // Load the MySQL JDBC driver
        Class.forName("com.mysql.jdbc.Driver");

        // Establish the connection
        conn = DriverManager.getConnection(url, user, passcode);
        out.println("Connected to the database!");
        
        String select_query = "SELECT * FROM users WHERE email=? AND password =?";
        PreparedStatement preparedStatement = conn.prepareStatement(select_query);
        
        preparedStatement.setString(1, username);
        preparedStatement.setString(2, password);
        
        ResultSet resultSet = preparedStatement.executeQuery();
            conn.close();
     
     out.println("<p class='msg'> Login succesfull </p>");
     %>
     <script>
        setTimeout(() => {
            window.location  =  "newjsp.jsp";
        }, 4000);
     </script>
     <%
     out.println(resultSet);

    } catch (ClassNotFoundException e) {
        out.println("JDBC driver not found!");
    } catch (SQLException e) {
        out.println("Error connecting to the database: " + e.getMessage());
    } finally {
        // Close the connection
        if (conn != null) {
            try {
                conn.close();
            } catch (SQLException e) {
                out.println("Error connecting to the database: " + e.getMessage());
            }
        }
    }
    }
    else {
    
    }
    
%>    

</head>


<body>

       <div class="bubble" style="--width:100vw;--height:100vw;--top:-100%;--left:-60%;"></div>
    <div class="bubble" style="--width:100vw;--height:100vw;--top:-100%;--left:60%;">
    </div>
    <div class="container">
        <form class="registration_box" action="" method="POST">
            <div class="reg_items">
                <div onclick="window.location='register.html'">Register</div>
                <div class="active" onclick="window.location='login.html'">Login</div>
            </div>
            <div class="title" style="margin: 20px;margin-top: 50px;">
                <h2><span>Login</span></h2>
            </div>
            <div class="grid_items" style="--width: 90%;margin-left: 30px;margin-right: 30px;padding: 25px;margin-bottom: -10px;margin-top: -20px;">
                <input type="text" placeholder="Enter Email" name="email" style="padding: 25px;">
            </div>
            <div class="grid_items" style="--width: 90%;margin-left: 30px;margin-right: 30px;padding: 25px;margin-bottom: 10px;margin-top: -20px;">
                <input type="password" placeholder="Enter Password" name="passcode" style="padding: 25px;">
            </div>
            <div class="btn">
                <button class="gradient">Sign In</button>
            </div>
        </form>

    </div>


    <script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
        crossorigin="anonymous"></script>
    <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
    <script>
        AOS.init();
    </script>
    </body>

</html>