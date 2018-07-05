
/* 
    Document   : WelcomeServlet
    Created on : Mar 13, 2017, 10:04:25 AM
    Author     : noura faisal alsaud 
input:none.
output:none */


import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class WelcomeServlet extends HttpServlet {
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		String n=request.getParameter("Name");
		out.print("Welcome "+n);
        
		 response.sendRedirect("userprofile.jsp");
		out.close();
	}
}
