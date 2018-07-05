
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
public class addUser extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
       
 
 String name = request.getParameter("name");
 String pass = request.getParameter("pass");
  String Utype = request.getParameter("user");
  String Ass ;
  if(request.getParameter("task_select")!=null)
  {
      Ass = request.getParameter("task_select");
  }
  else
  {
       Ass =""; 
  }
 String email = request.getParameter("email");
 String empType ;
if(Utype.equals("Team Leader"))
{
    empType="Team Leader";
}else 
   if (request.getParameter("task_select").equals("CDPO"))
{
        empType="CDPO";

}
else
{
    empType="";
}
  String not = "0";
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/marketing", "root", "myadminsql123");
            PreparedStatement stmt = con.prepareStatement("INSERT INTO `marketing`.`users` (`Name`, `Password`, `UserType`, `AssTask`, `email`, `emp_type`, `notification`) VALUES (?,?,?,?,?,?,?);");
            stmt.setString(1, name);   
            stmt.setString(2, pass); 
            stmt.setString(3,Utype); 
            stmt.setString(4, Ass);
            stmt.setString(5, email);            
            stmt.setString(6, empType);
            stmt.setString(7, not);
            int i = stmt.executeUpdate();
            if (i > 0) 
            {
            out.println("You are successfully inserted.....");
            RequestDispatcher rd=request.getRequestDispatcher("auto.jsp");
             rd.include(request,response);
                        response.sendRedirect("usersPanel.jsp");
  
           
            }
        } catch (Exception ey) {
            System.out.println(ey);
        }
        out.close();
    }
}

