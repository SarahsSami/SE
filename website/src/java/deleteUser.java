
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
public class deleteUser extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
      
   String id =request.getParameter("id");
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/marketing", "root", "myadminsql123");
            PreparedStatement stmt = con.prepareStatement("delete from users where ID=? ;");
            stmt.setString(1,id);

            int i = stmt.executeUpdate();
            if (i > 0) 
            {
            out.println("You are successfully deleted.....");
                        response.sendRedirect("usersPanel.jsp");

            }
        } catch (Exception ey) {
            System.out.println(ey);
        }
        out.close();
    }
}

