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

public class addexplore extends HttpServlet {

     protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        String id = request.getParameter("id");
        String kwx = request.getParameter("kwx");
        String expx= request.getParameter("expx");
        String ssx= request.getParameter("ssx");

 
        
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/marketing", "root", "myadminsql123");
            PreparedStatement stmt = con.prepareStatement("insert into marketing.explore(emp_id_x,kw_explore,exp_explore,ss_explore)values (?,?,?,?);");
           
          stmt.setString(1, id);
          stmt.setString(2, kwx);   
          stmt.setString(3, expx);  
          stmt.setString(4, ssx);
                   
            int i = stmt.executeUpdate();
            if (i > 0) 
            {
                 out.println("<script type=\"text/javascript\">");  
                 out.println("alert('Waiting For reply.....');");  
                 out.println("</script>");
            //out.println("successfully inserted.....");
            RequestDispatcher rd=request.getRequestDispatcher("explore.jsp");
            rd.include(request,response);
            }
        } catch (Exception ey) {
            System.out.println(ey);
        }
        out.close();
    }
}

