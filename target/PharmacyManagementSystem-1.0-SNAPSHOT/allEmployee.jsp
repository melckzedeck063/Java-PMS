
<%@page import="java.sql.*" %> 
<%@ include file="Dbconnection.jsp" %>
<% response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); %>
<% response.setHeader("Pragma", "no-cache"); %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
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
      
       Connection connection =  null;
       PreparedStatement preparedStatement =  null;
       ResultSet resultSet = null;
      
       
       try{
         connection =  (Connection)  application.getAttribute("dbConnection");
         if(connection != null){
         
        
      
         
         
    
      
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
                                <span class="white">John Doe</span>
                                <div class="up">
                                    <span class="gray small italic">Administrator</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="" >
                <div class=" grid_templated ">
                <div class="box_full_template_grid " style="--width:100%; -h:150px; " data-aos="flip-up" data-aos-duration="1000" data-aos-delay="3000">
                    <div class="title text-center mt-2 ">
                        <h5><span>AVAILABLE</span></h5>
                    </div>
                    <div class="number ">
                        <div class="title text-center mt-2 ">
                            <h1><span>95/90</span></h1>
                        </div>
                    </div>
                </div>
                <div class="box_full_template_grid " style="--width:100%;--h:150px; " data-aos="flip-up" data-aos-duration="1000" data-aos-delay="3000">
                    <div class="title text-center mt-2 ">
                        <h5><span>EXPIRED</span></h5>
                    </div>
                    <div class="number ">
                        <div class="title text-center mt-2 ">
                            <h1><span>95%</span></h1>
                        </div>
                    </div>
                </div>
                <div class="box_full_template_grid " style="--width:100%;--h:150px; " data-aos="flip-up" data-aos-duration="1000" data-aos-delay="3000">
                    <div class="title text-center mt-2 ">
                        <h5><span>SOLD</span></h5>
                    </div>
                    <div class="number ">
                        <div class="title text-center mt-2 ">
                            <h1><span>55/70</span></h1>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class=" container ">
            <div class="common-grid " style="--grid-template:auto auto auto auto auto auto auto" data-aos="fade-right" data-aos-duration="1000" data-aos-delay="3000">
                <div class="grid-item " style="background-color: var(--shadow);padding-left: 10px;padding-right: 10px; ">
                    <div class="title ">
                        <h5><span>First Name</span></h5>
                    </div>
                </div>
                <div class="grid-item " style="background-color: var(--shadow);padding-left: 10px;padding-right: 10px; ">
                    <div class="title ">
                        <h5><span>Last Name</span></h5>
                    </div>
                </div>
                <div class="grid-item " style="background-color: var(--shadow);padding-left: 10px;padding-right: 10px; ">
                    <div class="title ">
                        <h5><span>Username</span></h5>
                    </div>
                </div>
                <div class="grid-item " style="background-color: var(--shadow);padding-left: 10px;padding-right: 10px; ">
                    <div class="title ">
                        <h5><span>Telephone</span></h5>
                    </div>
                </div>
                <div class="grid-item " style="background-color: var(--shadow);padding-left: 10px;padding-right: 10px; ">
                    <div class="title ">
                        <h5><span>Role</span></h5>
                    </div>
                </div>
                
                <div class="grid-item " style="background-color: var(--shadow);padding-left: 10px;padding-right: 10px; ">
                    <div class="title ">
                        <h5><span>Date Added</span></h5>
                    </div>
                </div>
                <div class="grid-item " style="background-color: var(--shadow);padding-left: 10px;padding-right: 10px; ">
                    <div class="title ">
                        <h5><span>Actions</span></h5>
                    </div>
                </div>


     
 <%
                    
                     String select_query = "SELECT * FROM users" ;
         Statement statement = connection.createStatement() ;
         resultSet = statement.executeQuery(select_query);
         
         while(resultSet.next()){
         int user_id = resultSet.getInt("id");
         String firstname  =  resultSet.getString("firstname");
         String  lastname =  resultSet.getString("lastname");
         String email = resultSet.getString("email");
         String phone =  resultSet.getString("phone");
         String role =  resultSet.getString("role");
         String registered_date =  resultSet.getString("date_registered");

         
         
         
    
    %>

                <div class="grid-item h " style="padding-left: 10px;padding-right: 10px; ">
                    <div class="title ">
                        <h5><span> <%= firstname %> </span></h5>
                    </div>
                </div>
                <div class="grid-item h " style="padding-left: 10px;padding-right: 10px; ">
                    <div class="title ">
                        <h5><span> <%= lastname %> </span></h5>
                    </div>
                </div>
                <div class="grid-item h " style="padding-left: 10px;padding-right: 10px; ">
                    <div class="title ">
                        <h5><span>  <%= email %>  </span></h5>
                    </div>
                </div>
                <div class="grid-item h " style="padding-left: 10px;padding-right: 10px; ">
                    <div class="title ">
                        <h5><span> <%= phone %>  </span></h5>
                    </div>
                </div>
                <div class="grid-item h " style="padding-left: 10px;padding-right: 10px; ">
                    <div class="title ">
                        <h5><span> <%= role %>  </span></h5>
                    </div>
                </div>
               
                <div class="grid-item h " style="padding-left: 10px;padding-right: 10px; ">
                    <div class="title ">
                        <h5><span> <%= registered_date %>  </span></h5>
                    </div>
                </div>
                <div class="grid-item h " style="padding-left: 10px;padding-right: 10px; ">
                    <div class="title ">
                        <h5><span>Actions</span></h5>
                    </div>
                </div>
             

            <%
                }
    %>

             




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
    </script>
</body>


<%
       }
}
    catch(Exception e){
     out.println("<p> Error : " + e.getMessage() + " </p>");
    }
    }
  else {
   response.sendRedirect("login.jsp");
}
    }
    

    %>
    
</html>