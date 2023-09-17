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
    int user = 0; // Default value if user_id is not set in the session

// Check if the user_id attribute is set in the session
     if (session.getAttribute("user_id") != null) {
           user = (Integer) session.getAttribute("user_id");
       }    
      if(username != null && !username.isEmpty()){
    
        
       
       String product= request.getParameter("product");
       String product_id = request.getParameter("product_id");
       String brand =  request.getParameter("brand");
       String buying =  request.getParameter("buying");
       String selling =  request.getParameter("selling");
       String unit =  request.getParameter("unit");
       String quantity =  request.getParameter("quantity");
       String expire =  request.getParameter("date");
      
       

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
                <div class="box_full_template_grid" style="--width:100%;--h:250px;" data-aos="fade-right" data-aos-duration="1000" data-aos-delay="3000">
                    <div class="title" style="
                        margin-top: 20px;
                        ">
                        <h4 style="font-weight: 100;">Update Item</h4>
                    </div>
                    <div class="container">
                        <form action="update_product.jsp" method="POST">
                            <input type="text" placeholder="Product Name" name="product"  value="<%= product %>" >
                        <div class=""></div>
                        <input type="text" placeholder="Brand Name" name="brand" value="<%= brand %>">
                        <div class=""></div>
                        <input type="text" placeholder="Buying Price" name="buying" value="<%= buying %>">
                        <div class=""></div>
                        <input type="text" placeholder="Selling Price " name="selling" value="<%= selling %>">
                        <div class=""></div>
                        <input type="text" placeholder="Product Quantity" name="quantity" value="<%= quantity %>">
                        <div class=""></div>
                        <input type="text" placeholder="Item Unit " name="unit" value="<%= unit %>">
                        <div class=""></div>
                        <input type="hidden" placeholder="Valid Until " name="product_id" value="<%= product_id %>">
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
            
         
          <script src="https://code.jquery.com/jquery-3.7.0.min.js "></script>
                        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js "
                            integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm "
                            crossorigin="anonymous "></script>
                        <script src="https://unpkg.com/aos@2.3.1/dist/aos.js "></script>
                        <script>
                            AOS.init({
                                duration: 1500
                            });
                            jQuery.noConflict();
                            setTimeout(() => {
                                jQuery(".pre_loader ").fadeOut({
                                    duration: 500,
                                    easing: 'linear'
                                });
                            }, 2000);
                            jQuery(".update .cancel button").on("click", () => {
                                jQuery(".update_box").fadeOut({
                                    duration: 500,
                                    easing: 'linear',
                                    done: function () {
                                        console.log("UPDATE CANCELED!");
                                    }
                                })
                            });
                            jQuery(".update_open").on("click", () => {
                                jQuery(".update_box").addClass("animate__animated animate_fadeInUp");
                                jQuery(".update_box").fadeIn({
                                    duration: 500,
                                    easing: 'linear',
                                    done: function () {
                                        console.log("UPDATE CANCELED!");
                                    }
                                });
                            });

                            jQuery(".selling .cancel button").on("click", () => {
                                jQuery(".selling_box").fadeOut({
                                    duration: 500,
                                    easing: 'linear',
                                    done: function () {
                                        console.log("UPDATE CANCELED!");
                                    }
                                })
                            });
                            jQuery(".selling_open").on("click", () => {
                                jQuery(".selling_box").addClass("animate__animated animate_fadeInUp");
                                jQuery(".selling_box").fadeIn({
                                    duration: 500,
                                    easing: 'linear',
                                    done: function () {
                                        console.log("SELL CANCELED!");
                                    }
                                });
                            });
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
