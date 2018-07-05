
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
public class IdeaServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
       
      
   
 String idea = request.getParameter("idea");
 String author = request.getParameter("author");
  String vote = request.getParameter("vote");
  String status = request.getParameter("status");
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/marketing", "root", "myadminsql123");
            PreparedStatement stmt = con.prepareStatement(" insert into idea (idea,author,date,vote,status)" + " values (?,?,?,?,?)");
            java.sql.Timestamp date = new java.sql.Timestamp(new java.util.Date().getTime());
          stmt.setString(1, idea);   
          stmt.setString(2, author); 
           stmt.setTimestamp(3,date); 
            stmt.setString(4, vote);
            stmt.setString(5, status);               
            int i = stmt.executeUpdate();
            if (i > 0) 
            {
            out.println("You are successfully inserted.....");
            RequestDispatcher rd=request.getRequestDispatcher("newjsp.jsp");
            rd.include(request,response);
            }
        } catch (Exception ey) {
            System.out.println(ey);
        }
        out.close();
    }
}

