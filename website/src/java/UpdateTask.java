/*
Author: Nada AlNetaifi
purpose: connection with admin's control panel profile.
*/

import java.io.IOException;
import java.io.PrintWriter;
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
public class UpdateTask extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

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
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        /*
          response.setContentType("text/html");
          PrintWriter out = response.getWriter();
           try{
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/marketing","root","myadminsql123");
                   
String sql = "SELECT * FROM users WHERE AssTask !='null'";
PreparedStatement ps = con.prepareStatement(sql);
ResultSet rs = ps.executeQuery(); 
 while(rs.next())
{
String fname = rs.getString("Name"); 
String task = rs.getString("AssTask"); 
request.setAttribute("name", fname);
request.setAttribute("AssTask", task);
}
 request.setAttribute("name", "sara");
request.setAttribute("AssTask", "sara2");
javax.servlet.RequestDispatcher rd = this.getServletContext().getRequestDispatcher("adminprofile.jsp");
			rd.forward(request,response);
                        
//String sql2 = "SELECT * FROM users";
//PreparedStatement ps2 = con.prepareStatement(sql2);
//ResultSet rs2 = ps2.executeQuery(); 

 //while(rs.next())
//{
//String fname = rs.getString("Name"); 



  //} 

}

	 
 
 catch(Exception e){System.out.println(e);}
    }*/
    }  
    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        
        
        response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		String task=request.getParameter("task_select");
		String user=request.getParameter("user");
                
                int i = 0;
              boolean y= false;
              try{
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/marketing","root","myadminsql123");
	 
                    PreparedStatement temp=con.prepareStatement("SELECT ID from users WHERE Name=?");
          temp.setString(1,user);
          ResultSet rsTemp=temp.executeQuery();
          
          
             PreparedStatement rscheckAssTask=con.prepareStatement("SELECT AssTask from users ");
         
          ResultSet rsCheckTask=rscheckAssTask.executeQuery();
          while (rsCheckTask.next()) {
             if (rsCheckTask.getString("AssTask").equals(task)) {
            y=true;
          }
          }
          if (rsTemp.next() && !y )
          {
                        PreparedStatement ps=con.prepareStatement("UPDATE users SET AssTask=? WHERE ID=?");
                        ps.setString(1,task);
                        ps.setString(2,rsTemp.getString("ID"));
	
                        i =ps.executeUpdate();
                        if (i!=0)
                        {
                            response.sendRedirect("adminprofile.jsp");
                        }
                      
          }   
           else{
			out.print("Sorry username or password error");
                        }
                      }catch(Exception e){System.out.println(e);}
                
                
         
        
        
        
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
