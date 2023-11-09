/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ankush;

import mail.Mail;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import static java.lang.System.out;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.MessagingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author Satish
 */
@MultipartConfig
@WebServlet(name = "Customersignup", urlPatterns = {"/Customersignup"})
public class Customersignup extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet customer_signup_final</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet customer_signup_final at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Part file = request.getPart("image");
        String imageFileName = file.getSubmittedFileName();  // get selected image file name
        System.out.println("Selected Image File Name : " + imageFileName);

        String uploadPath = "C:/Users/Satish/Documents/NetBeansProjects/urbanSeva_final/web/resources/img/" + imageFileName;  // upload path where we have to upload our actual image
        System.out.println("Upload Path : " + uploadPath);
        // Uploading our selected image into the images folder
        try {

            PrintWriter out;
            FileOutputStream fos = new FileOutputStream(uploadPath); 
                InputStream is = file.getInputStream();
                out = response.getWriter();
                byte[] data = new byte[is.available()];
                is.read(data);
                fos.write(data);
                fos.close();
                is.close();

            //
//            PreparedStatement ps = null;

            String fname = request.getParameter("fname");
            String email = request.getParameter("email");
            String pass = request.getParameter("pass");
            String phone = request.getParameter("phone");

            String radioGroup = request.getParameter("radioGroup");
            String addr = request.getParameter("addr");
            String country = request.getParameter("country");
            String city = request.getParameter("city");
            
            try {
                //sending mail to email id entered!
                Mail.finalsend(email);
            } catch (MessagingException ex) {
                Logger.getLogger(Customersignup.class.getName()).log(Level.SEVERE, null, ex);
            }
     

            Class.forName("com.mysql.jdbc.Driver");
            int rowsAffected;
             
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/urbanseva", "root", "root");
                out.print("till here 3");
                String insertQuery = "insert into customers (customer_id,first_name, email,password, phone, profile_pic_name, gender, address, country, city) VALUES (? , ? ,?, ?, ?, ?, ?, ?, ?, ?)";
                PreparedStatement ps = con.prepareStatement(insertQuery);
                out.print("till here 3");
                
                int randomid = Mail.random3DigitNumber();
                String id2 = Integer.toString(randomid);
                
                ps.setString(1, id2);
                ps.setString(2, fname);
                ps.setString(3, email);
                 ps.setString(4, pass);
                ps.setString(5, phone);
                ps.setString(6, imageFileName);
                ps.setString(7, radioGroup);
                ps.setString(8, addr);
                ps.setString(9, country);
                ps.setString(10, city);
                rowsAffected = ps.executeUpdate();
                System.out.print(rowsAffected);
                
     
            if (rowsAffected > 0) {
              out.println("Sucessfully inserted data!");
              response.sendRedirect("customer_login.html"); 
             
            } else {
                out.println("Registration failed.");
            }

        } catch (IOException | ClassNotFoundException | SQLException e) {
             out.println("Error: " + e);
        }

        processRequest(request, response);
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
