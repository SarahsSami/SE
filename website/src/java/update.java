/*this page is to update dp
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
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
 * this servlet is called by the page openDP.jsp to delete the denied dp from db after that it will move him to cfmORfeedback.jsp
 */
public class update extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
                response.setContentType("text/html;charset=UTF-8");
        String emp_id = request.getParameter("empid");
        //String emp_email = request.getParameter("empemail");
        String emp_email = (String)request.getAttribute("emp_email");
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/marketing", "root", "myadminsql123");
            PreparedStatement stmt = con.prepareStatement("UPDATE marketing.employee SET emp_dp =NULL, dp_status = ? WHERE emp_id =?;");
stmt.setString(1 , "2");
stmt.setString(2, emp_id);
            int i = stmt.executeUpdate();
            if (i > 0) 
            {
            RequestDispatcher rd=request.getRequestDispatcher("evaldp.jsp");
            request.setAttribute("emp_email", emp_email);
            //rd.include(request,response);
            rd.forward( request, response );
            
            
            
            }
        } catch (Exception ey) {
            System.out.println(ey);
        }
        out.close();
    }


}
