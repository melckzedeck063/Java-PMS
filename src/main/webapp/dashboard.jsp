<%-- 
    Document   : dashboard
    Created on : 1 Sept 2023, 10:54:55?am
    Author     : user
--%>

  <%@ include file="Dbconnection.jsp" %>
  <%@page import="java.sql.*" %>
  
  <% response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); %>
  <% response.setHeader("Pragma", "no-cache"); %>
  <% response.setDateHeader("Expires", 0); %>

  <%-- Check if a session exists, if not, redirect to login page --%>
  
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Pharmacy Management System || Welcome</title>
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
        if(username != null && !username.isEmpty()){
        
         Connection connection = null;
    Statement statement = null;
    ResultSet resultSet = null;
    int rowCount = 0;
         
           try {
        connection = (Connection) application.getAttribute("dbConnection");

        if (connection != null) {
            statement = connection.createStatement();
            String countQuery = "SELECT COUNT(*) FROM products"; // Replace 'your_table' with your actual table name
            resultSet = statement.executeQuery(countQuery);

            if (resultSet.next()) {
                rowCount = resultSet.getInt(1); // Get the count from the first column
            }
        
    
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
            <div class="box_full" style="--width:100%">
                <div class="container">
                    <div class="row" data-aos="fade-left" data-aos-duration="1000" data-aos-delay="3000">
                        <div class="col-10 flex">
                            <div class="input Search">
                                <input type="text" placeholder="Search Package Name">
                            </div>
                        </div>
                        <div class="col-2 flex">
                            <div class="profile">
                                <img src="https://th.bing.com/th/id/OIP.X0Bqsl6JQsvg2mSFr9JrcQHaHa?pid=ImgDet&rs=1" alt="" srcset="">
                            </div>
                            <div class="grid mt-20">
                                <span class="white"><%= fname + " " + lname %></span>
                                <div class="up">
                                    <span class="gray small italic">Administrator</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="grid_templated">
                <div class="box_full_template_grid " style="--width:100%; -h:150px;" data-aos="flip-up" data-aos-duration="1000" data-aos-delay="3000">
                    <div class="title text-center mt-2">
                        <h5><span>AVAILABLE ITEMS</span></h5>
                    </div>
                    <div class="number">
                        <div class="title text-center mt-2">
                            <h1><span> <%= rowCount %></span></h1>
                        </div>
                    </div>
                </div>
                <div class="box_full_template_grid " style="--width:100%;--h:150px;" data-aos="flip-up" data-aos-duration="1000" data-aos-delay="3000">
                    <div class="title text-center mt-2">
                        <h5><span>EMPLOYED</span></h5>
                    </div>
                    <div class="number">
                        <div class="title text-center mt-2">
                            <h1><span>123</span></h1>
                        </div>
                    </div>
                </div>
                <div class="box_full_template_grid " style="--width:100%;--h:150px;" data-aos="flip-up" data-aos-duration="1000" data-aos-delay="3000">
                    <div class="title text-center mt-2">
                        <h5><span>EXPIRED</span></h5>
                    </div>
                    <div class="number">
                        <div class="title text-center mt-2">
                            <h1><span>95%</span></h1>
                        </div>
                    </div>
                </div>
                <div class="box_full_template_grid " style="--width:100%;--h:150px;" data-aos="flip-up" data-aos-duration="1000" data-aos-delay="3000">
                    <div class="title text-center mt-2">
                        <h5><span>SOLD</span></h5>
                    </div>
                    <div class="number">
                        <div class="title text-center mt-2">
                            <h1><span>550</span></h1>
                        </div>
                    </div>
                </div>
            </div>
            <div class="grid_template_for_two">
                <div class="box_full_template_grid " style="--width:100%;--h:250px;" data-aos="fade-right" data-aos-duration="1000" data-aos-delay="3000">
                    <div class="number">
                        <div class="title text-center" style="margin-top: 10px;">
                            <!-- <div class="loader"></div> -->
                            <div class="title">
                                <h3><span class="slim">Employeed People</span></h3>
                            </div>

                            
                            <div class="row" style="margin: 10px;justify-content: center;">
                                <div class="col-sm-3 flex" style="box-shadow: 0px 0px 10px 0px rgba(0, 0, 0, 0.1);margin: 4px;padding: 8px;border-radius: 10px;" data-aos="fade-up" data-aos-duration="1000" data-aos-delay="3000">
                                    <div class="profile">
                                        <img src="https://www.pngall.com/wp-content/uploads/5/Profile-Avatar-PNG.png" alt="" srcset="">
                                    </div>
                                
                                <div class="p-10" style="margin-top: 10px;padding-bottom: -10px !important;position: relative;">
                                    <span class="">John Doe</span>
                                    <div style="margin-top: -7px;">
                                        <span class="gray small">Administrator</span>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-3 flex" style="box-shadow: 0px 0px 10px 0px rgba(0, 0, 0, 0.1);margin: 4px;padding: 8px;border-radius: 10px;" data-aos="fade-up" data-aos-duration="1000" data-aos-delay="3000">
                                    <div class="profile">
                                        <img src="https://www.pngall.com/wp-content/uploads/5/Profile-Avatar-PNG.png" alt="" srcset="">
                                    </div>
                                
                                <div class="p-10" style="margin-top: 10px;padding-bottom: -10px !important;position: relative;">
                                    <span class="">John Doe</span>
                                    <div style="margin-top: -7px;">
                                        <span class="gray small">Administrator</span>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-3 flex" style="box-shadow: 0px 0px 10px 0px rgba(0, 0, 0, 0.1);margin: 4px;padding: 8px;border-radius: 10px;" data-aos="fade-up" data-aos-duration="1000" data-aos-delay="3000">
                                <div class="profile">
                                    <img src="https://www.pngall.com/wp-content/uploads/5/Profile-Avatar-PNG.png" alt="" srcset="">
                                </div>
                            
                            <div class="p-10" style="margin-top: 10px;padding-bottom: -10px !important;position: relative;">
                                <span class="">John Doe</span>
                                <div style="margin-top: -7px;">
                                    <span class="gray small">Administrator</span>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-3 flex" style="box-shadow: 0px 0px 10px 0px rgba(0, 0, 0, 0.1);margin: 4px;padding: 8px;border-radius: 10px;" data-aos="fade-up" data-aos-duration="1000" data-aos-delay="3000">
                            <div class="profile">
                                <img src="https://www.pngall.com/wp-content/uploads/5/Profile-Avatar-PNG.png" alt="" srcset="">
                            </div>
                        
                        <div class="p-10" style="margin-top: 10px;padding-bottom: -10px !important;position: relative;">
                            <span class="">John Doe</span>
                            <div style="margin-top: -7px;">
                                <span class="gray small">Administrator</span>
                            </div>
                        </div>
                    </div>


                            </div>
                            <div class="more text-center" style="margin:10px;margin-top: -10px;" data-aos="fade-right" data-aos-duration="1000" data-aos-delay="3000">
                                <a href="allEmployee.html" class="small">View All</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="box_full_template_grid " style="--width:100%;--h:250px;" id="donutchart" data-aos="fade-left" data-aos-duration="1000" data-aos-delay="3000">
                    <div class="number">
                        <div class="title text-center mt-5">
                            <div class="loader"></div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
    <script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
    <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
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
    } catch (SQLException e) {
        e.printStackTrace();
    }
    
    }
  else {
   response.sendRedirect("login.jsp");
}
    }
    

    %>


</html>