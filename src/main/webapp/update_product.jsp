 
<%@ include file="Dbconnection.jsp" %>
  <%@page import="java.sql.*" %>
  
  <% response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); %>
  <% response.setHeader("Pragma", "no-cache"); %>
  <% response.setDateHeader("Expires", 0); %>
<%  


if (request.getMethod().equals("POST")) {
       
       String productName= request.getParameter("product");
       String brandName =  request.getParameter("brand");
       String buying_price =  request.getParameter("buying");
       String selling_price =  request.getParameter("selling");
       String unit =  request.getParameter("unit");
       String product_id = request.getParameter("product_id");
       String quantity =  request.getParameter("quantity");
       String expire_date =  request.getParameter("date");
      
       Connection connection =  null;
       PreparedStatement preparedStatement =  null;
       ResultSet resultSet = null;
       
      try{
         connection =  (Connection)  application.getAttribute("dbConnection");
         if(connection != null){
         if(productName  != "" && brandName != "" && unit  != "" && quantity != "" && expire_date  != ""){
         
         String update_query = "UPDATE  products SET product_name=?, brand_name=?,buying_price=?,selling_price=?, quantity=?, unit=? WHERE product_id=?";
         
         
         preparedStatement = connection.prepareStatement(update_query);
         preparedStatement.setString(1,productName);
         preparedStatement.setString(2,brandName);
         preparedStatement.setString(3,buying_price);
         preparedStatement.setString(4,selling_price);
         preparedStatement.setString(5,quantity);
         preparedStatement.setString(6,unit);
//         preparedStatement.setString(7,expire_date);
         preparedStatement.setString(7,product_id);
        
         
         int rowsAffected = preparedStatement.executeUpdate(); // Perform the INSERT operation

                    if (rowsAffected > 0) {
                        out.println("<p class='msg'>Product updated successful</p>");
                        response.sendRedirect("store.jsp");
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
 
%>