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
 * @author Latefa
 */

public class addvision extends HttpServlet {
   
     protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
       String id = request.getParameter("id");
        String s2 = request.getParameter("comment");
        String dp= request.getParameter("dp");
        String accept= request.getParameter("accept");
        PreparedStatement stmt = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/marketing", "root", "myadminsql123");
            if(accept.equals("2")){
              stmt = con.prepareStatement("UPDATE marketing.employee SET emp_vision =?, accept =? WHERE emp_id='"+id+"'");
             stmt.setString(1,s2); 
           stmt.setString(2,"0"); 
            }
            
            else {
            stmt = con.prepareStatement("insert into marketing.employee(emp_id ,emp_vision,emp_dp)values (?,?,?)");
          stmt.setString(1,id);
          stmt.setString(2,s2); 
           stmt.setString(3,dp);} 
           
            int i = stmt.executeUpdate();
            if (i > 0) 
            {
                 out.println("<script type=\"text/javascript\">");  
                 out.println("alert('Waiting For reply.....');");  
                 out.println("</script>");
           // out.println("Waiting For replay.....");
            RequestDispatcher rd=request.getRequestDispatcher("emppvision.jsp");
            rd.include(request,response);
            }
        } catch (Exception ey) {
            System.out.println(ey);
        }
        out.close();
    }
     // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">

}
