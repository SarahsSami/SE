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
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Aljazi Almogren
 * this servlet is called by the page openDP.jsp after the cdpo click the button accept. the purpose of this servlet is to update the dp status to 1 in DB which means that it has been accepted.
 */
public class acceptDP extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        String emp_id = request.getParameter("empid");
        
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/marketing", "root", "myadminsql123");
            PreparedStatement stmt = con.prepareStatement("UPDATE marketing.employee SET dp_status =? WHERE emp_id =?;");
            stmt.setString(1, "1");
            stmt.setString(2, emp_id);
            int i = stmt.executeUpdate();
            if (i > 0) 
            {
            RequestDispatcher rd=request.getRequestDispatcher("evaldp.jsp");
            rd.include(request,response);
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
    

}
