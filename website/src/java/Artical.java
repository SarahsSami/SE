
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
public class Artical extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
       
 
 String title = request.getParameter("title");
 String body = request.getParameter("body");
  String id = "1";

        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/marketing", "root", "myadminsql123");
            PreparedStatement stmt = con.prepareStatement("INSERT INTO `marketing`.`articles` (`article_id`, `article_title`, `article_body`) VALUES (?,?,?);");
            stmt.setString(1, id);   
            stmt.setString(2, title); 
            stmt.setString(3,body); 
            int i = stmt.executeUpdate();
         if (i < 0) 
            {
          response.sendRedirect("Profile.jsp");
            }else
         {
             PreparedStatement stmt2 = con.prepareStatement("UPDATE `marketing`.`articles` SET `article_title`=?,`article_body`=? WHERE `article_id`=?;");
            stmt2.setString(1,title);
            stmt2.setString(2,body);
            stmt2.setString(3,id);
            int j = stmt2.executeUpdate();
         if (i < 0) 
            {
          response.sendRedirect("Profile.jsp");
            }
         }
         
        } catch (Exception ey) {
            System.out.println(ey);
        }
        out.close();
    }
}

