
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
public class updateUser extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
       
 
 String name = request.getParameter("name");
 String pass = request.getParameter("pass");
  String Utype = request.getParameter("user_select");
  String Ass = request.getParameter("task_select");
  String email = request.getParameter("email");
   String empType = request.getParameter("type_select");
   String id =request.getParameter("id");
  String not = "0";
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/marketing", "root", "myadminsql123");
            PreparedStatement stmt = con.prepareStatement("UPDATE `marketing`.`users` SET `Name`=?, `Password`=?, `UserType`=?, `AssTask`=?, `email`=?, `emp_type`=?, `notification`=? WHERE `ID`=?;");
            stmt.setString(1, name);   
            stmt.setString(2, pass); 
            stmt.setString(3,Utype); 
            stmt.setString(4, Ass);
            stmt.setString(5, email);            
            stmt.setString(6, empType);
            stmt.setString(7, not);
            stmt.setString(8, id);

            int i = stmt.executeUpdate();
            if (i > 0) 
            {
            out.println("You are successfully updated.....");
            response.sendRedirect("usersPanel.jsp");

            }
        } catch (Exception ey) {
            System.out.println(ey);
        }
        out.close();
    }
}

