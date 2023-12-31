<%-- 
    Document   : register.jsp
    Created on : 31 Aug 2023, 10:43:42?am
    Author     : user
--%>


<%@page import ="java.sql.*" %>
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
    
    <%
        Connection connection = (Connection) application.getAttribute("dbConnection");

        if(connection != null){
            out.println("database connection established succesfully");
        }
        else {
            out.println("database connection failed");
        }
    %>
</head>

<body>
<!--    <div class="bubble" style="--width:100vw;--height:100vw;--top:-100%;--left:-60%;">
    </div>
    <div class="bubble" style="--width:100vw;--height:100vw;--top:-100%;--left:60%;">
    </div>
    <div class="container">
        <form class="registration_box" action="">
            <div class="reg_items">
                <div class="active" onclick="window.location='register.html'">Register</div>
                <div onclick="window.location='login.html'">Login</div>
            </div>
            <div class="title" style="margin: 20px;margin-top: 50px;">
                <h2><span>Register</span></h2>
            </div>
            <div class="inputs_grid">
                <div class="grid_items" style="--width: 100%;">
                    <input type="text" placeholder="Enter First Name" name="firstname">
                </div>
                <div class="grid_items" style="--width:80%">
                    <input type="text" placeholder="Enter Last Name" name="lastname">
                </div>

            </div>
            <div class="inputs_grid">
                <div class="grid_items" style="--width: 50%;">
                    <input type="text" placeholder="Phone Number" name="phonenumber">
                </div>
                <div class="grid_items" style="--width:100%">
                    <input type="email" placeholder="Enter Email" name="email">
                </div>

            </div>
            <div class="inputs_grid">
                <div class="grid_items" style="--width: 80%;">
                    <select name="gender">
                        <option value="default" selected>Choose Gender</option>
                        <option value="male">I'm a Male</option>
                        <option value="female">I'm a Female</option>
                    </select>
                </div>
                <div class="grid_items" style="--width:60%">
                    <input type="text" placeholder="Enter Company Name" name="company">
                </div>
            </div>
            <h5 style="margin: 20px;"><span> Credentials </span></h5>
            <div class="inputs_grid">
                <div class="grid_items" style="--width: 80%;">
                    <input type="password" placeholder="Enter Password" name="passcode">
                </div>
                <div class="grid_items" style="--width:100%">
                    <input type="password" placeholder="Confirm Password" name="cpasscode">
                </div>

            </div>
            <div class="btn">
                <button class="gradient">Submit</button>
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
    </script>-->
</body>

</html>
