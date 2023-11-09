<%-- 
    Document   : proRegistrationFinal
    Created on : Oct 24, 2023, 5:33:43 PM
    Author     : Satish
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>service provider registration</title>
    </head>
    <body>
        <%
              String name = request.getParameter("name");
                String number = request.getParameter("number");
               String occupation = request.getParameter("occupation");

        // You can print the values to check if they are correctly retrieved
        out.println("Name: " + name + "<br>");
        out.println("Number: " + number + "<br>");
        out.println("Occupation: " + occupation + "<br>");
        
        
         try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/urbanseva", "root", "root");

        String insertQuery = "INSERT INTO service_provider (name, number, occupation) VALUES (?, ?, ?)";
        PreparedStatement preparedStatement = conn.prepareStatement(insertQuery);
        preparedStatement.setString(1, name);
        preparedStatement.setString(2, number);
        preparedStatement.setString(3, occupation);

        int rowsAffected = preparedStatement.executeUpdate();
        conn.close();

        if (rowsAffected > 0) {
            out.println("Registration successfull!"); 
            response.sendRedirect("customer_login.html"); 
        } else {
            out.println("Registration failed.");
        }
    } catch (Exception e) {
        out.println("Error: " + e);
    }
	
        
       
        
        %>
    </body>
    <script type="text/javascript">
        // Delay in milliseconds (e.g., 3000 ms = 3 seconds)
        var delay = 3000;
        
        // Function to redirect after the delay
        function delayedRedirect() {
            setTimeout(function () {
                // Replace the URL with the target page
                window.location.href = "customer_login.html";
            }, delay);
        }

        // Call the function to start the delay
        delayedRedirect();
    </script>
</html>
