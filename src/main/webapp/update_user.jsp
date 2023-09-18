<%-- 
    Document   : update_user
    Created on : 18 Sept 2023, 8:42:54?am
    Author     : user
--%>

 <%@ include file="Dbconnection.jsp" %>
<%@page import="java.sql.*" %>
  
  <% response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); %>
  <% response.setHeader("Pragma", "no-cache"); %>
  <% response.setDateHeader("Expires", 0); %>
  
  <%@ page import="java.security.MessageDigest" %>
<%@ page import="java.math.BigInteger" %>
<%@ page import="java.security.NoSuchAlgorithmException" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    
    <%
    
// session = request.getSession(false);
//    
//    if(session == null){
//        response.sendRedirect("login.jsp");
//     }
//     else {
//     String username = (String)  session.getAttribute("username");
//    String fname = (String) session.getAttribute("fname");
//    String lname = (String)  session.getAttribute("lname");
//    int user = (Integer) session.getAttribute("user_id");
//    
//      if(username != null && !username.isEmpty()){
      
      if (request.getMethod().equals("POST")) {
      
      String firstname = request.getParameter("firstname") ;
      String lastname =request.getParameter("lastname") ;
      String  email = request.getParameter("email");
      String phone =  request.getParameter("phone");
      String role =  request.getParameter("role");
      String userID  =  request.getParameter("user_id");
      
//      String hashedPassword = hashPasswordMD5(password);
      
      Connection connection =  null;
       PreparedStatement preparedStatement =  null;
       ResultSet resultSet = null;
       
      try{
         connection =  (Connection)  application.getAttribute("dbConnection");
         if(connection != null){
         
         if (!firstname.isEmpty() && !lastname.isEmpty() && !email.isEmpty() && !phone.isEmpty() && !role.isEmpty()) {
                    String insert_query = "UPDATE  users SET firstname=?, lastname=?,email=?,phone=?, role=? WHERE id=?";
                    preparedStatement = connection.prepareStatement(insert_query);
                    preparedStatement.setString(1, firstname);
                    preparedStatement.setString(2, lastname);
                    preparedStatement.setString(3, email);
                    preparedStatement.setString(4, phone);
                    preparedStatement.setString(5, role);
                    preparedStatement.setString(6, userID);
                    

                    int rowsAffected = preparedStatement.executeUpdate(); // Perform the INSERT operation

                    if (rowsAffected > 0) {
                        out.println("<p class='msg'>User updated successful</p>");
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
    <body>
        <h1>Hello World!</h1>
    </body>
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