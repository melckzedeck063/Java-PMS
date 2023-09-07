<%-- 
    Document   : logout
    Created on : 7 Sept 2023, 9:43:09 am
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
       
    </head>
    <body>
        <script>
    // Clear any session data
    <% session.invalidate(); %>
    // Redirect to the login page
     window.location.href = "dashboard.jsp";
</script>
        
    </body>
</html>
