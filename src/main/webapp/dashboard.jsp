<%-- 
    Document   : dashboard
    Created on : 1 Sept 2023, 10:54:55?am
    Author     : user
--%>

  <%@ include file="Dbconnection.jsp" %>
  <%@page import="java.sql.*" %>
  <%-- Check if a session exists, if not, redirect to login page --%>
  
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Pharmacy Management System || Welcome</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" />
    <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">


    <!-- local -->
    <link rel="stylesheet" href="dashboard.css">
    </head>

    <%

    String username = (String)  session.getAttribute("username");
    String fname = (String) session.getAttribute("fname");
    String lname = (String)  session.getAttribute("lname");
    if(session == null){
        response.sendRedirect("login.jsp");
    }
    

    %>
    <body>
         <div class="dashboard_grid_container">
        <div class="dash_grid_items">
            <div class="row">
                <div class="col-xl-12 flex navtab">
                    <div class="profile">
                        <img src="https://th.bing.com/th/id/OIP.X0Bqsl6JQsvg2mSFr9JrcQHaHa?pid=ImgDet&rs=1" alt="" srcset="">
                    </div>
                    <div class="grid mt-20">
                        <span class="white"> <%= fname + " " + lname %> </span>
                        <div class="up">
                            <span class="gray small italic">Administrator</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="dash_grid_items">
            <div class="box_full" style="--width:97%">

            </div>
        </div>
    </div>
    <script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
        crossorigin="anonymous"></script>
    <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
    <script>
        AOS.init({
            duration:1500
        });
    </script>    
    </body>
</html>
