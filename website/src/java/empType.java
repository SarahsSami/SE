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
public class empType extends HttpServlet {

   

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
   
     
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
      
        
        response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		String empType=request.getParameter("empType_select");
		String user=request.getParameter("userName");
                
                   try {
                       Class.forName("com.mysql.jdbc.Driver");
                       Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/marketing", "root", "myadminsql123");
                       
                 String id = "";      
                PreparedStatement temp=con.prepareStatement("SELECT ID from marketing.users WHERE Name=?");
               temp.setString(1,user);
                ResultSet rsTemp=temp.executeQuery();
                if (rsTemp.next())
                 id = rsTemp.getString("ID");
                
                
           if (empType.equals("CDPO")){
               
           PreparedStatement stmt = con.prepareStatement("UPDATE marketing.users SET emp_type =? WHERE ID =?;");
            stmt.setString(1 , empType);
            stmt.setString(2,id );
            
            
            
            PreparedStatement s = con.prepareStatement("INSERT INTO marketing.visions (cdpo_id) VALUES (?);");
            s.setString(1,id );
            int i = stmt.executeUpdate();
           
           
           }
            PreparedStatement stmt = con.prepareStatement("UPDATE marketing.users SET emp_type =? WHERE ID =?;");
            stmt.setString(1 , empType);
            stmt.setString(2,id );
            int i = stmt.executeUpdate();
            
            if (i > 0) 
            {
            RequestDispatcher rd=request.getRequestDispatcher("adminprofile.jsp");
           
            rd.forward( request, response );
            
            
            
            }
        } catch (Exception ey) {
            System.out.println(ey);
        }
        out.close();
                
               
        
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
