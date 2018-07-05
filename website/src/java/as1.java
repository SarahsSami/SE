/*
 * Document   : assessment 
    Created on : Jul 30, 2017, 1:14:55 PM
    Author     : Latifa
 
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

public class as1 extends HttpServlet {

     protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        String id = request.getParameter("id");
        String kw = request.getParameter("kw");
        String exp= request.getParameter("exp");
        String ss= request.getParameter("ss");

        
 
        
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/marketing", "root", "myadminsql123");
            PreparedStatement stmt = con.prepareStatement("insert into marketing.assessments(emp_id_s,kw_assess,exp_assess,ss_assess)" + "values (?,?,?,?)");
           
          stmt.setString(1, id);  
          stmt.setString(2, kw);   
          stmt.setString(3, exp);  
          stmt.setString(4, ss);
                   
            int i = stmt.executeUpdate();
            if (i > 0) 
            {
                 out.println("<script type=\"text/javascript\">");  
                 out.println("alert('Waiting For reply.....');");  
                 out.println("</script>");
            //out.println("successfully inserted.....");
            RequestDispatcher rd=request.getRequestDispatcher("assess.jsp");
            rd.include(request,response);
            }
        } catch (Exception ey) {
            System.out.println(ey);
        }
        out.close();
    }
}

