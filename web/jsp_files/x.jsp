<%-- 
    Document   : customer_signup_final
    Created on : Oct 23, 2023, 4:42:52 PM
    Author     : Satish
--%>

<%@page import="java.io.InputStream"%>
<%@page import="java.io.FileOutputStream"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
               Part file = request.getPart("image");
        String imageFileName = file.getSubmittedFileName();  // get selected image file name
        System.out.println("Selected Image File Name : " + imageFileName);

        String uploadPath = "C:/Users/Satish/Documents/NetBeansProjects/urbanSeva_final/web/resources/img/" + imageFileName;  // upload path where we have to upload our actual image
        System.out.println("Upload Path : " + uploadPath);
        // Uploading our selected image into the images folder
        try {

            FileOutputStream fos = new FileOutputStream(uploadPath);
            InputStream is = file.getInputStream();

            byte[] data = new byte[is.available()];
            is.read(data);
            fos.write(data);
            fos.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
                out.print("dkaj");
        
        %>
    </body>
</html>
