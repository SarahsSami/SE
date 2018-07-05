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
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author trainee2
 */
public class updateServlet extends HttpServlet {


   protected void doPost(HttpServletRequest request, HttpServletResponse response)  throws ServletException, IOException {
   response.setContentType("text/html");
  PrintWriter out = response.getWriter();
  String status = request.getParameter("status");
  String id = request.getParameter("id");
    String challenge = request.getParameter("challenge");
  String type = request.getParameter("user");
    String notification = request.getParameter("notification");
    int limit = 1;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/marketing", "root", "myadminsql123");
            if(challenge.equals("0") )
            {
      PreparedStatement stmt = con.prepareStatement("UPDATE idea INNER JOIN users ON idea.ID_user = users.ID SET  idea.status=?,users.notification=? where id_idea=?;");  
            stmt.setString(1, status);
            stmt.setString(2,notification);   
            stmt.setString(3,id); 
           int i= stmt.executeUpdate();

                       if (i > 0) 
            {
                if (type.equals("coor")){
                    out.println("You are successfully inserted.....");
         //   RequestDispatcher rd=request.getRequestDispatcher("newjsp.jsp");
            //    rd.include(request,response);
                                                        response.sendRedirect("newjsp.jsp");

                }
                
                else
                    if (type.equals("admin")){
                    out.println("You are successfully inserted.....");
            //RequestDispatcher rd=request.getRequestDispatcher("ideabank1.jsp");
               // rd.include(request,response);}
                                                            response.sendRedirect("ideabank1.jsp");
            }
                    else if (type.equals("spcustomer")){
                    out.println("You are successfully inserted.....");
                    
                                            response.sendRedirect("ideabank2.jsp");

          // RequestDispatcher rd=request.getRequestDispatcher("ideabank2.jsp");
               // rd.include(request,response);}



            }
            }        
               
                       }
            if(challenge.equals("1") )
            {
         
           PreparedStatement stmt2 = con.prepareStatement("UPDATE idea SET status =1 WHERE status=0 ORDER BY vote DESC, date ASC limit ? ;");  
           stmt2.setInt(1,limit);
           int j= stmt2.executeUpdate();
           if (j > 0) 
            {
                  PreparedStatement stmt = con.prepareStatement("UPDATE idea INNER JOIN users ON idea.ID_user = users.ID SET  idea.status=?,users.notification=? where id_idea=?;");  
            stmt.setString(1, status);
            stmt.setString(2,notification);   
            stmt.setString(3,id); 
           int i= stmt.executeUpdate();

                       if (i > 0) 
            {
          out.println("You are successfully updated.....");                     
            response.sendRedirect("newjsp.jsp");
            }
            }
            }
            
        } catch (Exception ey) {
            System.out.println(ey);
        }
        out.close();
    

}}
