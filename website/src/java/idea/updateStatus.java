/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package idea;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author trainee2
 */
public class updateStatus extends HttpServlet {


   protected void doPost(HttpServletRequest request, HttpServletResponse response)  throws ServletException, IOException {
   response.setContentType("text/html");
  PrintWriter out = response.getWriter();
  int limit = Integer.parseInt(request.getParameter("cap"));
 String num ="1";
int vote = 4;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/marketing", "root", "myadminsql123");
PreparedStatement stmt2 = con.prepareStatement("SELECT count(*) FROM marketing.idea where status=?;");
stmt2.setString(1,num);
ResultSet rsTemp=stmt2.executeQuery();
                if (rsTemp.next())
             limit = Math.abs(limit-rsTemp.getInt("count(*)"));
                PreparedStatement stmt = con.prepareStatement("UPDATE idea SET status =1 WHERE status=0 ORDER BY vote DESC, date ASC limit ? ;");  
            //PreparedStatement stmt = con.prepareStatement("UPDATE idea SET status =1 WHERE status=0 AND vote > ? ORDER BY vote DESC, date ASC limit ? ;");  
           // stmt.setInt(1,vote);
            stmt.setInt(1,limit);
           int i= stmt.executeUpdate();
                       if (i > 0) 
            {
          out.println("You are successfully updated.....");
         //   RequestDispatcher rd=request.getRequestDispatcher("newjsp.jsp");
            //    rd.include(request,response                        
            response.sendRedirect("newjsp.jsp");
            }
           
        } catch (Exception ey) {
            System.out.println(ey);
        }
        out.close();
    

}}
