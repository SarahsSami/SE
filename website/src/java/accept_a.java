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
import java.sql.SQLException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



/**
 *
 * @author bothainah
 */
@WebServlet(urlPatterns = {"/accept_a"})
public class accept_a extends HttpServlet {

    /**
     *
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        try (PrintWriter out = response.getWriter()) {
                
            try {
                
                Class.forName("com.mysql.jdbc.Driver");
                String id =request.getParameter("id");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/marketing", "root", "myadminsql123");
                PreparedStatement stmt = con.prepareStatement("UPDATE assessments SET assess_status=1 WHERE `emp_id_s`='"+id+"'");
                int i = stmt.executeUpdate();
                if (i > 0)
                {
                   
                    RequestDispatcher rd=request.getRequestDispatcher("assessment.jsp");
                    rd.include(request,response);
                }
            } catch (IOException | ClassNotFoundException | SQLException | ServletException e) {
                System.out.println(e);
            }
        }    }}