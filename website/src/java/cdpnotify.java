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
 * @author trainee2
 */
public class cdpnotify extends HttpServlet {

   protected void doPost(HttpServletRequest request, HttpServletResponse response)  throws ServletException, IOException {
   response.setContentType("text/html");
  PrintWriter out = response.getWriter();
  String notification = request.getParameter("notification");
  String id = request.getParameter("id");
  String serves = request.getParameter("serves");
  String emp_type =request.getParameter("emp_type");
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/marketing", "root", "myadminsql123");
      PreparedStatement stmt = con.prepareStatement("update users s, employee e set s.notification=1 where s.ID = e.emp_id and e.emp_id=15;");     
            stmt.setString(1, notification);
            stmt.setString(2, id); 
            
           int i= stmt.executeUpdate();
                       if (i > 0) 
            {
                if (emp_type.equals("CDPO")){
                    out.println("You are successfully inserted.....");
            RequestDispatcher rd=request.getRequestDispatcher("newjsp.jsp");
                rd.include(request,response);}
                
                else
                    if (emp_type.equals("Team Leader")){
                    out.println("You are successfully inserted.....");
            RequestDispatcher rd=request.getRequestDispatcher("ideabank1.jsp");
                rd.include(request,response);}
                
                else
                        if (emp_type.equals("Employee")){
                    out.println("You are successfully inserted.....");
            RequestDispatcher rd=request.getRequestDispatcher("ideabank2.jsp");
                rd.include(request,response);}



            }
                       
            

        } catch (Exception ey) {
            System.out.println(ey);
        }
        out.close();
    }

}
