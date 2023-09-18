 <%@ include file="Dbconnection.jsp" %>
<%@page import="java.sql.*" %>
  
  <% response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); %>
  <% response.setHeader("Pragma", "no-cache"); %>
  <% response.setDateHeader("Expires", 0); %>
  
  <%@ page import="java.security.MessageDigest" %>
<%@ page import="java.math.BigInteger" %>
<%@ page import="java.security.NoSuchAlgorithmException" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pharmacy Management System || New Employee Add</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" />
    <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">


    <!-- local -->
    <link rel="stylesheet" href="dashboard.css">
    <style>
        .pre_loader {
            position: fixed;
            top: 0%;
            left: 0%;
            width: 100%;
            height: 100%;
            z-index: 10;
            background-color: var(--black);
        }
        
        .loading {
            position: absolute;
            left: 50%;
            top: 50%;
            height: 100px;
            width: 100px;
            transform: translate(-50%, -50%);
        }
    </style>
</head>
<%
    
 session = request.getSession(false);
    
    if(session == null){
        response.sendRedirect("login.jsp");
     }
     else {
     String username = (String)  session.getAttribute("username");
    String fname = (String) session.getAttribute("fname");
    String lname = (String)  session.getAttribute("lname");
    int user = (Integer) session.getAttribute("user_id");
    
      if(username != null && !username.isEmpty()){
      
      if (request.getMethod().equals("POST")) {
      
      String firstname = request.getParameter("firstname") ;
      String lastname =request.getParameter("lastname") ;
      String  email = request.getParameter("email");
      String phone =  request.getParameter("phone");
      String role =  request.getParameter("role");
      String userID =  request.getParameter("user_id");
      
//      String hashedPassword = hashPasswordMD5(password);
      

       
       %>
      


<body>
    <div class="pre_loader">
        <div class="loading">
            <div class="loader"></div>
        </div>
    </div>
    <div class="dashboard_grid_container">
        <div class="dash_grid_items">
            <div class="row" data-aos="fade-left" data-aos-duration="1000" data-aos-delay="3000">
                <%@include file="sidebar.html" %>
            </div>
        </div>
        <div class="dash_grid_items">
            <%@include file="topbar.jsp" %>
            <div class="grid_template_for_two">
                <div class="box_full_template_grid " style="--width:100%;--h:250px;" onkeyup="" data-aos="fade-right" data-aos-duration="1000" data-aos-delay="3000">
                    <div class="title" style="
                        margin-top: 20px;
                        ">
                        <h4 style="font-weight: 100;">Add New User</h4>
                    </div>
                    <div class="container" onkeyup="preview()">
                      <form  action="update_user.jsp" method="POST">
                          <input type="text" placeholder="Employee Name" name="firstname" id="firstname" value="<%= firstname %>">
                        <div class="" style="font-size: small;text-align: center;"></div>
                        <input type="text" placeholder="Enter Last Name" name="lastname" id="lastname" value="<%= lastname %>">
                        <div class="" style="font-size: small;text-align: center;"></div>
                        <input type="text" placeholder="Employee Email" name="email" id="employee_address" value="<%= email %>">
                        <div class="" style="font-size: small;text-align: center;"></div>
                        <input type="text" placeholder="Employee Contact eg. +255 628 272 363" name="phone" id="employee_contact" value="<%= phone %>">
                        <div class="" style="font-size: small;text-align: center;"></div>
                        <input type="text" placeholder="Role" name="role" id="password" value="<%= role %>">
                        <div class="" style="font-size: small;text-align: center;"></div>
                        <input type="hidden"  name="user_id" id="cpassword" value="<%= userID %>">
                        <div class="" style="font-size: small;text-align: center;"></div>
                        

                       <div class="button">
                           <button id="buttonGet" type="submit" >Complete</button>
                       </div>
                       </form>
                    </div>
                </div>
                <div class="box_full_template_grid " style="--width:100%;--h:250px;" id="donutchar" data-aos="fade-left" data-aos-duration="1000" data-aos-delay="3000">
                    <div class="title" style="
                        margin-top: 20px;
                        ">
                        <h4 style="font-weight: 100;">Employee Profile Preview</h4>
                    </div>
                    <div class="container mrg-100">
                        <div class="prev">
                            <span><span><i class="bi bi-check-circle" style="color:rgb(0, 218, 0);opacity:0%;"></i> Username: </span><span style="font-weight: 100;font-size: small;" class="previewme"></span></span>
                        </div>
                        <div class="prev">
                            <span><span><i class="bi bi-check-circle" style="color:rgb(0, 218, 0);opacity:0%;"></i>  Last Name: </span><span style="font-weight: 100;font-size: small;" class="previewme"></span></span>
                        </div>
                        <div class="prev">
                            <span><span><i class="bi bi-check-circle" style="color:rgb(0, 218, 0);opacity:0%;"></i> Email: </span><span style="font-weight: 100;font-size: small;" class="previewme"></span></span>
                        </div>
                        <div class="prev">
                            <span><span><i class="bi bi-check-circle" style="color:rgb(0, 218, 0);opacity:0%;"></i> Contact: </span><span style="font-weight: 100;font-size: small;" class="previewme"></span></span>
                        </div>
                        <div class="prev">
                            <span><span><i class="bi bi-check-circle" style="color:rgb(0, 218, 0);opacity:0%;"></i> Role: </span><span style="font-weight: 100;font-size: small;" class="previewme"></span></span>
                        </div>
<!--                        <div class="prev">
                            <span><span><i class="bi bi-check-circle" style="color:rgb(0, 218, 0);opacity:0%;"></i> Confirmation: </span><span style="font-weight: 100;font-size: small;" class="previewme"></span></span>
                        </div>-->
                        
                    </div>
                </div>

            </div>
        </div>
    </div>
    <script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
    <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script src="new_user.js"></script>
    <script>
        AOS.init({
            duration: 1500
        });
        jQuery.noConflict();
        setTimeout(() => {
            jQuery(".pre_loader").fadeOut({
                duration: 500,
                easing: 'linear'
            });
        }, 2000);
        // jQuery(".nested_list").ready(function(){
        //     jQuery(this).on("click", function(){
        //         jQuery(".list_dropdown").addClass("clicked");
        //     });
        // });
        google.charts.load("current", {
            packages: ["corechart"]
        });
        google.charts.setOnLoadCallback(drawChart);
        var total

        function drawChart() {
            var data = google.visualization.arrayToDataTable([
                ['Available Doses', 'Hours per Day'],
                ['Employeed', 11],
                ['Expired', 2],
                ['Sold', 2],
                ['Buy', 2]
            ]);

            var options = {
                title: 'GENERAL ACTIVITIES',
                pieHole: 0.3,
            };

            var chart = new google.visualization.PieChart(document.getElementById('donutchart'));
            chart.draw(data, options);
        }
    </script>
</body>


<%
        }
    
    
     
    }
  else {
   response.sendRedirect("login.jsp");
}
    }
    
    %>
    
</html>

<%!
    // Function to hash the password using MD5
    private String hashPasswordMD5(String password) {
        try {
            MessageDigest md = MessageDigest.getInstance("MD5");
            byte[] messageDigest = md.digest(password.getBytes());
            BigInteger number = new BigInteger(1, messageDigest);
            String md5 = number.toString(16);

            // Pad with zeros to ensure it's 32 characters long
            while (md5.length() < 32) {
                md5 = "0" + md5;
            }
            return md5;
        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException(e);
        }
    }
%>