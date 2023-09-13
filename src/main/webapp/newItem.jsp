<%@ include file="Dbconnection.jsp" %>
<%@page import="java.sql.*" %>
  
  <% response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); %>
  <% response.setHeader("Pragma", "no-cache"); %>
  <% response.setDateHeader("Expires", 0); %>
  

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pharmacy Management System || New Item</title>
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
        .msg{
            background: green;
            color: white;
            padding: 3px;
            width : 20%;
            margin: auto;
        }
        .err{
            background: red;
            color: white;
            padding: 3px;
            width : 20%;
            margin: auto;
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
    int user = 0; // Default value if user_id is not set in the session

// Check if the user_id attribute is set in the session
     if (session.getAttribute("user_id") != null) {
           user = (Integer) session.getAttribute("user_id");
       }    
      if(username != null && !username.isEmpty()){
    
        if (request.getMethod().equals("POST")) {
       
       String productName= request.getParameter("product");
       String brandName =  request.getParameter("brand");
       String buying_price =  request.getParameter("b_price");
       String selling_price =  request.getParameter("s_price");
       String unit =  request.getParameter("unit");
       String quantity =  request.getParameter("quantity");
       String expire_date =  request.getParameter("date");
       
       Connection connection =  null;
       PreparedStatement preparedStatement =  null;
       ResultSet resultSet = null;
       
      try{
         connection =  (Connection)  application.getAttribute("dbConnection");
         if(connection != null){
         if(productName  != "" && brandName != "" && unit  != "" && quantity != "" && expire_date  != ""){
         
         String insert_query = "INSERT INTO products (product_name, brand_name,buying_price,selling_price, quantity, unit, date_expired, registered_by) "
         + "VALUES(?, ?, ?, ?, ?, ?,?,?)";
         
         preparedStatement = connection.prepareStatement(insert_query);
         preparedStatement.setString(1,productName);
         preparedStatement.setString(2,brandName);
         preparedStatement.setString(3,buying_price);
         preparedStatement.setString(4,selling_price);
         preparedStatement.setString(5,quantity);
         preparedStatement.setString(6,unit);
         preparedStatement.setString(7,expire_date);
         preparedStatement.setInt(8,user);
         
         int rowsAffected = preparedStatement.executeUpdate(); // Perform the INSERT operation

                    if (rowsAffected > 0) {
                        out.println("<p class='msg'>Registration successful</p>");
                    } else {
                        out.println("<p class='err_msg'>Registration failed</p>");
                    }
                } else {
                    out.println("<p class='err_msg'>All fields are required</p>");
                }         
   }
 }
    catch(Exception e){
     out.println("<p> Error : " + e.getMessage() + " </p>");
    }
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
                <div class="col-xl-12 flex navtab">
                    <div class="title">
                        <h5>Phar<span style="color: var(--milk);">macy</span></h5>
                    </div>
                </div>
                <div class="col-xl-12">
                    <ul class="menu">
                        <li>
                            <a href="dashboard.jsp" class="dropdown">
                                <i class="bi bi-buildings-fill"></i>
                                <span> Dashboard</span>
                            </a>
                        </li>
                        <li class="nested_list">
                            <a class="dropdown">
                                <i class="bi bi-collection-fill"></i>
                                <span>Store <i class="bi bi-arrow-right-circle-fill drop"></i></span>
                            </a>
                            <ul class="list_dropdown">
                                <li><a href="store.html"><i class="bi bi-chevron-double-right"></i> In Store</a></li>
                                <li><a href="newItem.html"><i class="bi bi-chevron-double-right"></i> New Item</a></li>
                            </ul>
                        </li>
                        <li class="nested_list">
                            <a class="dropdown">
                                <i class="bi bi-people-fill"></i>
                                <span>Employees <i class="bi bi-arrow-right-circle-fill drop"></i></span>
                            </a>
                            <ul class="list_dropdown">
                                <li><a href="allEmployee.html"><i class="bi bi-chevron-double-right"></i> All Employees</a></li>
                                <li><a href="newEmployee.html"><i class="bi bi-chevron-double-right"></i> Add Employee</a></li>
                            </ul>
                        </li>
                        <li>
                            <a href="profile.html" class="dropdown">
                                <i class="bi bi-person-fill"></i>
                                <span> Profile</span>
                            </a>
                        </li>
                        <li>
                            <a href="sales.html" class="dropdown">
                                <i class="bi bi-box-seam-fill"></i>
                                <span> Sales</span>
                            </a>
                        </li>
                        <li>
                            <a href="reports.html" class="dropdown">
                                <i class="bi bi-body-text"></i>
                                <span> Reports</span>
                            </a>
                        </li>

                        <li>
                            <a href="logout.jsp" class="dropdown">
                                <i class="bi bi-shield-fill"></i>
                                <span> Log Out</span>
                            </a>
                        </li>
                        <!-- <li><a href=""></a></li> -->
                    </ul>
                </div>
            </div>
        </div>
        <div class="dash_grid_items">
            <div class="box_full banner_gradient" style="--width:100%">
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
                                <span class="white">John Doe</span>
                                <div class="up">
                                    <span class="gray small italic">Administrator</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="grid_templated">
                <div class="box_full_template_grid " style="--width:100%; -h:150px;" data-aos="flip-down" data-aos-duration="1000" data-aos-delay="3000">
                    <div class="title text-center mt-2">
                        <h5><span>AVAILABLE</span></h5>
                    </div>
                    <div class="number">
                        <div class="title text-center mt-2">
                            <h1><span>95/90</span></h1>
                        </div>
                    </div>
                </div>
                <div class="box_full_template_grid " style="--width:100%;--h:150px;" data-aos="flip-down" data-aos-duration="1000" data-aos-delay="3000">
                    <div class="title text-center mt-2">
                        <h5><span>EMPLOYED</span></h5>
                    </div>
                    <div class="number">
                        <div class="title text-center mt-2">
                            <h1><span>123</span></h1>
                        </div>
                    </div>
                </div>
                <div class="box_full_template_grid " style="--width:100%;--h:150px;" data-aos="flip-down" data-aos-duration="1000" data-aos-delay="3000">
                    <div class="title text-center mt-2">
                        <h5><span>EXPIRED</span></h5>
                    </div>
                    <div class="number">
                        <div class="title text-center mt-2">
                            <h1><span>95%</span></h1>
                        </div>
                    </div>
                </div>
                <div class="box_full_template_grid " style="--width:100%;--h:150px;" data-aos="flip-down" data-aos-duration="1000" data-aos-delay="3000">
                    <div class="title text-center mt-2">
                        <h5><span>SOLD</span></h5>
                    </div>
                    <div class="number">
                        <div class="title text-center mt-2">
                            <h1><span>55/70</span></h1>
                        </div>
                    </div>
                </div>
            </div>
            <div class="grid_template_for_two">
                <div class="box_full_template_grid" style="--width:100%;--h:250px;" data-aos="fade-right" data-aos-duration="1000" data-aos-delay="3000">
                    <div class="title" style="
                        margin-top: 20px;
                        ">
                        <h4 style="font-weight: 100;">Add New Item</h4>
                    </div>
                    <div class="container">
                        <form action="" method="POST">
                        <input type="text" placeholder="Product Name" name="product">
                        <div class=""></div>
                        <input type="text" placeholder="Brand Name" name="brand">
                        <div class=""></div>
                        <input type="text" placeholder="Buying Price" name="b_price">
                        <div class=""></div>
                        <input type="text" placeholder="Selling Price " name="s_price">
                        <div class=""></div>
                        <input type="text" placeholder="Product Quantity" name="quantity">
                        <div class=""></div>
                        <input type="text" placeholder="Item Unit " name="unit">
                        <div class=""></div>
                        <input type="date" placeholder="Valid Until " name="date">
                        <div class=""></div>

                       <div class="button">
                           <button type="submit" id="bottonGet">Complete</button>
                       </div>
                        </form>
                    </div>
                </div>
                <div class="box_full_template_grid" style="--width:100%;--h:250px;" id="donutchar" data-aos="fade-left" data-aos-duration="1000" data-aos-delay="3000">
                    <div class="banner_img" style="background-image: url(https://plus.unsplash.com/premium_photo-1661281397737-9b5d75b52beb?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1469&q=80);background-size: cover;">
                        <div class="shado" style="position: relative;width: 100%;height:100%;background-color: rgba(0, 68, 255, 0.226);"></div>
                    </div>
                    <div class="" style="margin-bottom: 10px;">
                        <div class="title">
                            <h1><span>Attention!</span></h1>
                            <span>Remember, your role as a pharmacist is to safeguard the health and well-being of your patients. Adhering to the law and maintaining the highest ethical standards in your practice is not only a legal requirement but also a moral obligation</span>
                            <div class="button">
                                <a href="https://www.who.int/health-topics/medicines">read more</a>
                            </div>
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
  else {
   response.sendRedirect("login.jsp");
}
    }
    

    %>

</html>