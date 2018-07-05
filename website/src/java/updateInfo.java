
/*
  Document   : IdeaServlet
    Created on : Feb 13, 2017, 9:09:01 AM
    Author     : noura faisal alsaud
    Input: none.
output: none
 */

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import java.text.SimpleDateFormat;
public class updateInfo extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
       
 
 String name = request.getParameter("name");
 String pass = request.getParameter("pass");
  String email = request.getParameter("email");
   String id =request.getParameter("id");
   String uu=request.getParameter("type");
  String not = "0";
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/marketing", "root", "myadminsql123");
            PreparedStatement stmt = con.prepareStatement("UPDATE `marketing`.`users` SET `Name`=?,`Password`=?,`email`=? WHERE `ID`=?;");
            stmt.setString(1, name);   
            stmt.setString(2, pass); 
            stmt.setString(3, email);            
            stmt.setString(4, id);

            int i = stmt.executeUpdate();
            if (i > 0) 
            {
            out.println("You are successfully updated.....");
                           response.sendRedirect("Profile.jsp");

            } 
      
             else
            {
                out.println("unable to update ....");
            }
            
        } catch (Exception ey) {
            System.out.println(ey);
        }
        out.close();
    }
}

