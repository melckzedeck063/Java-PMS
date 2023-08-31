<%-- 
    Document   : login.jsp
    Created on : 30 Aug 2023, 11:07:45?am
    Author     : user
--%>

<%@page import="java.sql.*" %> 
<%@ include file="Dbconnection.jsp" %>

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
        .err_msg{
            background: red;
            color: white;
            padding: 3px;
            width : 20%;
            margin: auto;
        }
    </style>
    
    <%    
if(request.getMethod().equals("POST")){
    
    String username = request.getParameter("email");
    String password = request.getParameter("passcode");
    
    Connection connection = null;
    PreparedStatement preparedStatement = null;
    ResultSet resultSet = null;
    
        
    try {
        
        connection = (Connection) application.getAttribute("dbConnection");

        if(connection != null){
            if(username != "" && password != ""){

            String select_query = "SELECT * FROM users WHERE email=? AND password =?";
            preparedStatement = connection.prepareStatement(select_query);
            
            preparedStatement.setString(1, username);
            preparedStatement.setString(2, password);
            
            resultSet = preparedStatement.executeQuery();
//                connection.close();
         
             if(resultSet.next()){
             out.println("<p class='msg'> Login succesfull </p>");
              %>
          <script>
            setTimeout(() => {
                window.location  =  "register.jsp";
            }, 4000);
            </script>
         <%
        }
        else {
           out.println("<p class='err_msg'> Login failed please try again </p>");
        }
             }
            }
        else {          
             out.println(" <p class='err_msg'> Database connection failed </p>");      
        }

    } catch (SQLException e) {
        
       out.println("<p class='err_msg'> " + e.getMessage()+ "</p>");
          } 
         finally {
        try {
            if (resultSet != null) {
                resultSet.close();
            }
            if (preparedStatement != null) {
                preparedStatement.close();
            }
            if (connection != null) {
                connection.close();
            }
        } catch (SQLException e) {
            // Handle exception if necessary
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