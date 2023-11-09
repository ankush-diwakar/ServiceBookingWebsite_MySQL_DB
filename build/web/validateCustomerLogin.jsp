<%-- 
    Document   : validateCustomerLogin
    Created on : Oct 24, 2023, 10:17:13 PM
    Author     : Satish
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <%
            String email = request.getParameter("email");
            String password = request.getParameter("pass");

            try {
                Class.forName("com.mysql.jdbc.Driver");

                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/urbanseva", "root", "root");

                String query = "SELECT * FROM customers WHERE email=? AND password=?";
                PreparedStatement pstmt = con.prepareStatement(query);
                pstmt.setString(1, email);
                pstmt.setString(2, password);
                ResultSet rs = pstmt.executeQuery();

                if (rs.next()) {
                    // Valid login, redirect to another page
                    out.println("Successfull login");
                    response.sendRedirect("servicesPage.html");
                } else {
                    // Invalid login, show an error message
                    out.println("Invalid login credentials. Please try again.");
                }

                rs.close();
                pstmt.close();
                con.close();
            } catch (Exception e) {
                out.println("An error occurred: " + e.getMessage());
            }
        %>
    </body>
</html>
