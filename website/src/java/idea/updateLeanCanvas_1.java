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
public class updateLeanCanvas_1 extends HttpServlet {

   protected void doPost(HttpServletRequest request, HttpServletResponse response)  throws ServletException, IOException {
   response.setContentType("text/html");
  PrintWriter out = response.getWriter();
  String leanCanves = request.getParameter("i");
  String id = request.getParameter("id");
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/marketing", "root", "myadminsql123");
      PreparedStatement stmt = con.prepareStatement("update idea set leanCanves=? where id_idea=?;");     
            stmt.setString(1, leanCanves);
            stmt.setString(2, id);                
           int i= stmt.executeUpdate();
                       if (i > 0) 
            {
            RequestDispatcher rd=request.getRequestDispatcher("newjsp.jsp");
            rd.include(request,response);
            }

                       
        } catch (Exception ey) {
            System.out.println(ey);
        }
        out.close();
    }

}
