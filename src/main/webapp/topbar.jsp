
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
     String username = (String)  session.getAttribute("username");
    String fname = (String) session.getAttribute("fname");
    String lname = (String)  session.getAttribute("lname");
        if(username != null && !username.isEmpty()){
        
         Connection connection = null;
    Statement statement = null;
    ResultSet resultSet = null;
    int rowCount = 0;
    int  userCount = 0;
         
           try {
        connection = (Connection) application.getAttribute("dbConnection");

        if (connection != null) {
            statement = connection.createStatement();
            String countQuery = "SELECT COUNT(*) FROM products"; // Replace 'your_table' with your actual table name
            resultSet = statement.executeQuery(countQuery);

            if (resultSet.next()) {
                rowCount = resultSet.getInt(1); // Get the count from the first column
            }
            
           String countUsers = "SELECT COUNT(*) FROM users"; // Replace 'your_table' with your actual table name
            resultSet = statement.executeQuery(countUsers);

            if (resultSet.next()) {
                userCount = resultSet.getInt(1); // Get the count from the first column
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
                            <%= fname + " " + lname %>
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
                <h5><span>EXPIRED</span></h5>
            </div>
            <div class="number">
                <div class="title text-center mt-2">
                    <h1><span>95%</span></h1>
                </div>
            </div>
        </div>
        <div class="box_full_template_grid " style="--width:100%;--h:150px;" data-aos="flip-up" data-aos-duration="1000"
            data-aos-delay="3000">
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