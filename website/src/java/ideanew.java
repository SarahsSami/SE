/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author waveform3
 */
public class ideanew extends HttpServlet {


    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
      
 String idea = request.getParameter("idea");
 String author = request.getParameter("author");
  String vote = request.getParameter("vote");
  String status = request.getParameter("status");
  String leanCanves = request.getParameter("leanCanves");
  String type = request.getParameter("user");
    String user = request.getParameter("id");
 
   
   // out.print(user);
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/marketing","root","myadminsql123");
            PreparedStatement stmt = con.prepareStatement("insert into idea (author,date,idea,vote,status,leanCanves,ID_user)" + " values (?,?,?,?,?,?,?);");
            java.sql.Timestamp date = new java.sql.Timestamp(new java.util.Date().getTime());
            
          stmt.setString(1, author); 
           stmt.setTimestamp(2,date);
           stmt.setString(3, idea); 
            stmt.setString(4, vote);
            stmt.setString(5, status);   
            stmt.setString(6, leanCanves);   
            stmt.setString(7, user); 
            int i = stmt.executeUpdate();
            if (i > 0) 
            {
                    out.println("You are successfully inserted.....");
            RequestDispatcher rd=request.getRequestDispatcher("ideabank1.jsp");
                rd.include(request,response);
            }
        
        } catch (Exception ey) {
            System.out.println(ey);
        }
        out.close();
    }
}

