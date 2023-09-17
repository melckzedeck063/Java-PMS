 
<%@ include file="Dbconnection.jsp" %>
  <%@page import="java.sql.*" %>
  
  <% response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); %>
  <% response.setHeader("Pragma", "no-cache"); %>
  <% response.setDateHeader("Expires", 0); %>
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
       String selling_price =  request.getParameter("selling");
       String unit =  request.getParameter("unit");
       String product_id = request.getParameter("product_id");
       String quantity =  request.getParameter("quantity");
       String quantity1 =  request.getParameter("quantity");
      
      
       Connection connection =  null;
       PreparedStatement preparedStatement =  null;
       ResultSet resultSet = null;
       
      try {
      connection = (Connection) application.getAttribute("dbConnection");
      if (connection != null) {
         if (productName != "" && brandName != "" && unit != "" && quantity != "" && selling_price != "") {
            // Insert sale record into the sales table
            String insert_query = "INSERT INTO sales (product_id, product_name, brand_name, price_sold, quantity, sold_by) VALUES (?, ?, ?, ?, ?, ?)";
            preparedStatement = connection.prepareStatement(insert_query);
            preparedStatement.setString(1, product_id);
            preparedStatement.setString(2, productName);
            preparedStatement.setString(3, brandName);
            preparedStatement.setString(4, selling_price);
            preparedStatement.setString(5, quantity);
            preparedStatement.setInt(6, user);
            int rowsAffected = preparedStatement.executeUpdate();
            
            if (rowsAffected > 0) {
               // Sale recorded successfully, now deduct the quantity from the products table
               String update_query = "UPDATE products SET quantity = quantity - ? WHERE product_id = ?";
               preparedStatement = connection.prepareStatement(update_query);
               preparedStatement.setString(1, quantity);
               preparedStatement.setString(2, product_id);
               preparedStatement.executeUpdate();
               
               out.println("<p class='msg'>Sale recorded successful</p>");
               response.sendRedirect("sales.jsp");
            } else {
               out.println("<p class='err_msg'>Request failed</p>");
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
 }
  else {
   response.sendRedirect("login.jsp");
}
    }
 
%>