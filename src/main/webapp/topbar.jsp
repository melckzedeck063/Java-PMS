<%@page import="java.sql.*" %>
  
  <% response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); %>
  <% response.setHeader("Pragma", "no-cache"); %>
  <% response.setDateHeader("Expires", 0); %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Top Bar</title>
</head>
<%
    session = request.getSession(false);
    
    if(session == null){
        response.sendRedirect("login.jsp");
     }
     else {
     String user_username = (String)  session.getAttribute("username");
     String user_firstname = (String) session.getAttribute("fname");
     String user_lastname = (String)  session.getAttribute("lname");
        if(user_username != null && !user_username.isEmpty()){
        
              Connection connection1 = null;
    Statement statement1 = null;
    ResultSet resultSet1 = null;
    int rowCount = 0;
    int  userCount = 0;
    int salesCount = 0;
    int totalSales = 0;
         
           try {
        connection1 = (Connection) application.getAttribute("dbConnection");

        if (connection1 != null) {
            statement1 = connection1.createStatement();
            String countQuery = "SELECT COUNT(*) FROM products"; // Replace 'your_table' with your actual table name
            resultSet1 = statement1.executeQuery(countQuery);

            if (resultSet1.next()) {
                rowCount = resultSet1.getInt(1); // Get the count from the first column
            }
            
           String countUsers = "SELECT COUNT(*) FROM users"; // Replace 'your_table' with your actual table name
            resultSet1 = statement1.executeQuery(countUsers);

            if (resultSet1.next()) {
                userCount = resultSet1.getInt(1); // Get the count from the first column
            }
            
       String countSales = "SELECT COUNT(*) FROM sales"; // Replace 'your_table' with your actual table name
            resultSet1 = statement1.executeQuery(countSales);

            if (resultSet1.next()) {
                salesCount = resultSet1.getInt(1); // Get the count from the first column
            }
            
      String totalSalesQuery = "SELECT SUM(price_sold) AS total_sales FROM sales";
            resultSet1 = statement1.executeQuery(totalSalesQuery);

            if (resultSet1.next()) {
                totalSales = resultSet1.getInt(1); // Get the count from the first column
            }
            
           
        
    
    %>            
           
       

<body>
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
                        <img src="https://th.bing.com/th/id/OIP.X0Bqsl6JQsvg2mSFr9JrcQHaHa?pid=ImgDet&rs=1" alt=""
                            srcset="">
                    </div>
                    <div class="grid mt-20">
                        <span class="white">
                            <%= user_firstname + " " + user_lastname %>
                        </span>
                        <div class="up">
                            <span class="gray small italic">Administrator</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="grid_templated">
        <div class="box_full_template_grid " style="--width:100%; -h:150px;" data-aos="flip-up" data-aos-duration="1000"
            data-aos-delay="3000">
            <div class="title text-center mt-2">
                <h5><span>AVAILABLE ITEMS</span></h5>
            </div>
            <div class="number">
                <div class="title text-center mt-2">
                    <h1><span>
                            <%= rowCount %>
                        </span></h1>
                </div>
            </div>
        </div>
        <div class="box_full_template_grid " style="--width:100%;--h:150px;" data-aos="flip-up" data-aos-duration="1000"
            data-aos-delay="3000">
            <div class="title text-center mt-2">
                <h5><span>EMPLOYED</span></h5>
            </div>
            <div class="number">
                <div class="title text-center mt-2">
                    <h1><span>
                            <%= userCount %>
                        </span></h1>
                </div>
            </div>
        </div>
        <div class="box_full_template_grid " style="--width:100%;--h:150px;" data-aos="flip-up" data-aos-duration="1000"
            data-aos-delay="3000">
            <div class="title text-center mt-2">
                <h5><span>TOTAL SALES</span></h5>
            </div>
            <div class="number">
                <div class="title text-center mt-2">
                    <h1><span> <%= totalSales %> </span></h1>
                </div>
            </div>
        </div>
        <div class="box_full_template_grid " style="--width:100%;--h:150px;" data-aos="flip-up" data-aos-duration="1000"
            data-aos-delay="3000">
            <div class="title text-center mt-2">
                <h5><span>ITEMS SOLD</span></h5>
            </div>
            <div class="number">
                <div class="title text-center mt-2">
                    <h1><span> <%= salesCount %> </span></h1>
                </div>
            </div>
        </div>
    </div>
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