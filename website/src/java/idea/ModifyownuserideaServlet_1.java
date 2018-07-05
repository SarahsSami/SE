
/*
  Document   : ModifyownuserideaServlet
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
public class ModifyownuserideaServlet_1 extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
       
 String userid =  request.getParameter("id");
 String author= request.getParameter("m_author");
 String idea = request.getParameter("idea");
 String id = request.getParameter("id_idea");
 String type = request.getParameter("user");    
 
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/marketing", "root","myadminsql123");
            PreparedStatement stmt = con.prepareStatement("update idea set  idea = ? where id_idea = ? AND ID_user =? ");
 
          stmt.setString(1, idea);  
          stmt.setString(2, id);  
          stmt.setString(3,userid);  
        
            int i = stmt.executeUpdate();
            if (i > 0) {
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
            
            else
            {
                out.println("unable to modify , check your idea ID number....");
            }
        } catch (Exception ey) {
         
            System.out.println(ey);
        }
        out.close();
    }
}