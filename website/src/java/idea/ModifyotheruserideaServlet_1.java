
/*
  Document   : ModifyotheruserideaServlet
    Created on : Feb 13, 2017, 9:09:01 AM
    Author     : noura faisal alsaud
    Input: none.
output: none
 */
package idea;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import java.text.SimpleDateFormat;
public class ModifyotheruserideaServlet_1 extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
       
      
   
 String id = request.getParameter("id_idea");
 String modifyIdea = request.getParameter("modifiedidea");
 String author= request.getParameter("m_author");
 String uu =  request.getParameter("user");
  String userid =  request.getParameter("id");

        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/marketing", "root", "myadminsql123");
            PreparedStatement stmt = con.prepareStatement("insert into modify_idea (id_m,m_author,m_date,modifiedidea,id_idea) values (?,?,?,?,?);");
  
  java.sql.Timestamp date = new java.sql.Timestamp(new java.util.Date().getTime());

          stmt.setString(1,userid);  
          stmt.setString(2,author);  
          stmt.setTimestamp(3,date);
          stmt.setString(4, modifyIdea);  
          stmt.setString(5, id);
          
              stmt.setTimestamp(4, date);
            int i = stmt.executeUpdate();
            if (i > 0) {
                if (uu.equals("coor")){
                   out.println("You are successfully inserted.....");
            RequestDispatcher rd=request.getRequestDispatcher("newjsp.jsp");
               rd.include(request,response);}

            
             else
                          if (uu.equals("spcustomer")){
                  out.println("You are successfully inserted.....");
            RequestDispatcher rd=request.getRequestDispatcher("ideabank2.jsp");
               rd.include(request,response);}
              
             else
                           if (uu.equals("admin")){
                   out.println("You are successfully inserted.....");
            RequestDispatcher rd=request.getRequestDispatcher("ideabank1.jsp");
                rd.include(request,response);}
                            
      }
        
                 else
            {
                out.println("unable to update , check your idea ID number....");
            }
        } catch (Exception ey) {
            System.out.println(ey);
        }
        out.close();
    }
}