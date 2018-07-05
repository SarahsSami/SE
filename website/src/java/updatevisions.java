/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
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
 * @author Aljazi Almogren
 * this servlet is called by the page managVisions.jsp
 */
public class updatevisions extends HttpServlet {

    
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
        
        response.setContentType("text/html;charset=UTF-8");
        
        String co_vision = request.getParameter("covision");
        String dep_vision = request.getParameter("depvision");
        String cdpo_id = request.getParameter("cdpoid");
         String cdpo_id2 = request.getParameter("cdpoid2");
        String id = "1";
        int i = 0;
        boolean flag = false;
    
        
        
        try {
            
            
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/marketing", "root", "myadminsql123");
            
            if(!cdpo_id.equals(cdpo_id2) ){
            PreparedStatement stmt = con.prepareStatement("INSERT INTO marketing.visions (cdpo_id, co_vision, dep_vision, vision_id) VALUES (?, ?, ?, ?);");
           stmt.setString(1,  cdpo_id);
            stmt.setString(2, co_vision);
            stmt.setString(3, dep_vision);
            stmt.setString(4, id);
            i = stmt.executeUpdate();}
            
            else{
            PreparedStatement stmt1 = con.prepareStatement("UPDATE marketing.visions SET co_vision =? , dep_vision =? WHERE cdpo_id =? and vision_id =?;");
            stmt1.setString(1, co_vision);
            stmt1.setString(2, dep_vision);
            stmt1.setString(3, cdpo_id);
             stmt1.setString(4, id);
              i = stmt1.executeUpdate();
            
         
            }
            
            
          
            if (i > 0) 
            {
             RequestDispatcher rd=request.getRequestDispatcher("cdpoUI.jsp");
            rd.include(request,response);
            /* PreparedStatement stmt1 = con.prepareStatement("UPDATE marketing.visions SET co_vision =? , dep_vision =? WHERE cdpo_id =? and vision_id =?;");
            stmt1.setString(1, co_vision);
            stmt1.setString(2, dep_vision);
            stmt1.setString(3, cdpo_id);
             stmt1.setString(4, id);
             int j = stmt1.executeUpdate();
            
            
            if (j > 0) 
            {
            RequestDispatcher rd=request.getRequestDispatcher("cdpoUI.jsp");
            rd.include(request,response);
            }*/
            
            }
            
          
            
            
            
        } catch (Exception ey) {
            System.out.println(ey);
        }
        out.close();
        
        
        
        
        
        
        
    }

   

}
