

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

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
public class IdeaServlet_new extends HttpServlet {
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
    String voteStatus = "0";
  String  ID_user = " "+session.getAttribute("id");
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/marketing","root","myadminsql123");
            PreparedStatement stmt = con.prepareStatement("insert into idea (author,date,idea,vote,status,leanCanves,ID_user,voteStatus)" + " values (?,?,?,?,?,?,?,?);");
            java.sql.Timestamp date = new java.sql.Timestamp(new java.util.Date().getTime());
            
          stmt.setString(1, author); 
           stmt.setTimestamp(2,date);
           stmt.setString(3, idea); 
            stmt.setString(4, vote);
            stmt.setString(5, status);   
            stmt.setString(6, leanCanves);   
            stmt.setString(7, ID_user); 
            stmt.setString(8,voteStatus );

            int i = stmt.executeUpdate();
            if (i > 0) 
            {
       
            if (type.equals("coor")){
                    out.println("You are successfully inserted.....");
            RequestDispatcher rd=request.getRequestDispatcher("newjsp.jsp");
                rd.include(request,response);}
            
           else
            if (type.equals("spcustomer")){
                    out.println("You are successfully inserted.....");
            RequestDispatcher rd=request.getRequestDispatcher("ideabank2.jsp");
                rd.include(request,response);}
            
            else
            if (type.equals("admin")){
                    out.println("You are successfully inserted.....");
            RequestDispatcher rd=request.getRequestDispatcher("ideabank1.jsp");
                rd.include(request,response);}
            
            }
        
        } catch (Exception ey) {
            System.out.println(ey);
        }
        out.close();
    }
}

