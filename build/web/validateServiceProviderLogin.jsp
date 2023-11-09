<%-- 
    Document   : validateServiceProviderLogin
    Created on : Oct 24, 2023, 10:18:01 PM
    Author     : Satish
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        <%
            String email = request.getParameter("email");
            String password = request.getParameter("pass");

            try {
                Class.forName("com.mysql.jdbc.Driver");

                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/urbanseva", "root", "root");

                String query = "SELECT * FROM service_providers WHERE s_email=? AND s_pass=?";
                PreparedStatement pstmt = con.prepareStatement(query);
                pstmt.setString(1, email);
                pstmt.setString(2, password);
                ResultSet rs = pstmt.executeQuery();

                if (rs.next()) {
                    // Valid login, redirect to another page
                    out.println("Successfull login");
//                    response.sendRedirect("welcome.jsp");
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
