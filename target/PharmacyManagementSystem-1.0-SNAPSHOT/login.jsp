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

            .loader{
                position: relative;
                width: 30px;
                height: 30px;
                border-radius: 50px;
                border: 2px solid black;
                border-bottom-color: var(--blue);
                border-top-color: var(--blue);
                border-left-color: var(--green);
                left: 50%;
                transform: translateX(-50%);
                border-bottom-color: var(--milk);
                animation: 1s rotate linear infinite;
            }
            @keyframes rotate {
                0%{
                    transform: translateX(-50%) rotate(0deg);
                }
                100%{
                    transform: translateX(-50%) rotate(360deg);
                }
            }
            @-webkit-keyframes rotate {
                0%{
                    transform: translateX(-50%) rotate(0deg);
                }
                100%{
                    transform: translateX(-50%) rotate(360deg);
                }
            }
            @-moz-keyframes rotate {
                0%{
                    transform: translateX(-50%) rotate(0deg);
                }
                100%{
                    transform: translateX(-50%) rotate(360deg);
                }
            }
            .toUp{
                position:absolute;
                top: 5%;
                left: 50%;
                transform: translate(-50%, -5%);
                z-index: 10;

            }
            @keyframes fadeIn {
                0%{
                    opacity: 0%;
                }
                50%{
                    opacity: 100% !important;
                }
                100%{
                    opacity: 0%;
                }
            }
            @-webkit-keyframes fadeIn {
                0%{
                    opacity: 0%;
                }
                50%{
                    opacity: 100%;
                }
                100%{
                    opacity: 0%;
                }
            }
            @-moz-keyframes fadeIn {
                0%{
                    opacity: 0%;
                }
                50%{
                    opacity: 100%;
                }
                100%{
                    opacity: 0%;
                }
            }
            .toUp .toUpContainer{
                position: relative;
                border-radius: 10px;
                padding: 10px;
                color: var(--black);
                animation: .8s fadeIn ease;
                margin-top: 0px;
                background: var(--green);
            }

        </style>

        <%        if (request.getMethod().equals("POST")) {

                String username = request.getParameter("email");
                String password = request.getParameter("passcode");

                Connection connection = null;
                PreparedStatement preparedStatement = null;
                ResultSet resultSet = null;

                try {

                    connection = (Connection) application.getAttribute("dbConnection");

                    if (connection != null) {
                        if (username != "" && password != "") {

                            String select_query = "SELECT * FROM users WHERE email=? AND password =?";
                            preparedStatement = connection.prepareStatement(select_query);

                            preparedStatement.setString(1, username);
                            preparedStatement.setString(2, password);

                            resultSet = preparedStatement.executeQuery();
                            //                connection.close();

                            if (resultSet.next()) {

        %>
    <div class='toUp'>
        <div class='toUpContainer'>Login succesfull</div>
            
    </div>
    <script>
        setTimeout(() => {
            $('.toUp').fadeOut({
            duration: 1000, 
            easing: 'linear'
        });
         setTimeout(() => {
           window.location="dashboard.html";
        }, 2000);
        }, 3000);
    </script>
   
    <%                            } else {
                             %>
    <div class='toUp'>
        <div class='toUpContainer' style="background-color:red;">Credentials are Invalid!</div>
            
    </div>
    <script>
        setTimeout(() => {
            $('.toUp').fadeOut({
            duration: 1000, 
            easing: 'linear'
        });
        }, 3000);
    </script>
   
    <%       
                        }
                    }
                } else {
                     %>
    <div class='toUp'>
        <div class='toUpContainer' style="background-color:red;">Database Connection Failed!</div>
            
    </div>
    <script>
        setTimeout(() => {
            $('.toUp').fadeOut({
            duration: 1000, 
            easing: 'linear'
        });
        }, 3000);
    </script>
   
    <%       
                }

            } catch (SQLException e) {
                out.println("<div class='toUp' style='display: none;'><div class='toUpContainer'>" + e.getMessage() + "</div></div><script>jQuery.noConflict();jQuery('.topUp').fadeIn({duration:1000,easing:'linear'});</script>");

                out.println("<p class='err_msg'> " + e.getMessage() + "</p>");
            } finally {
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

        } else {

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
                <div onclick="window.location = 'register.html'">Register</div>
                <div class="active" onclick="window.location = 'login.html'">Login</div>
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
                <button class="gradient" id="buttonGet">Sign In</button>
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
                    document.getElementById("buttonGet").addEventListener("click", () => {
                        const loader = document.createElement("div");
                        loader.setAttribute("class", "loader");
                        document.getElementById("buttonGet").innerHTML = "";
                        document.getElementById("buttonGet").append(loader);
                        setTimeout(() => {
                            window.location = "dashboard.html";
                        }, 4000);
                    });
    </script>
</body>


</html>