/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author waveform3
 */
public class add_member extends HttpServlet {

   

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
      
        
        response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		String t=request.getParameter("teamleader");
		String e=request.getParameter("employee");
                
                   try {
                       Class.forName("com.mysql.jdbc.Driver");
                       Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/marketing", "root", "myadminsql123");
                       
                
                
            PreparedStatement s = con.prepareStatement("INSERT INTO marketing.teamleader (tl_id,emp_id) VALUES ("+t+","+e+")");
            
            int i = s.executeUpdate();
           
           
       
            
            if (i > 0) 
            {
                        response.sendRedirect("AddMembers.jsp");

            
            
            
            }
        } catch (Exception ey) {
            System.out.println(ey);
        }
        out.close();
                
               
        
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
