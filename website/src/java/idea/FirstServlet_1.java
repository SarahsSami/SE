package idea;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class FirstServlet_1 extends HttpServlet {
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		String userName=request.getParameter("Name");
		String password=request.getParameter("Password");
		
		if(LoginDao.validate(userName, password)){
			RequestDispatcher rd=request.getRequestDispatcher("servlet2");
			rd.forward(request,response);
		}
		else{
			out.print("Sorry username or password error");
               
			
		}
		
		out.close();
	}

}
