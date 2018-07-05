package java;


/* 
    Document   : FirstServlet
    Created on : Mar 13, 2017, 10:04:25 AM
    Author     : noura faisal alsaud 
input:none.
output:none */

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
import javax.servlet.http.HttpSession;

public class FirstServlet extends HttpServlet {
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		String n=request.getParameter("Name");
		String p=request.getParameter("Password");
		
		//if(LoginDao.validate(n, p)){
                HttpSession session = request.getSession();
                try{
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/marketing","root","");
	
                        PreparedStatement ps=con.prepareStatement("select * from users where Name=? and Password=?");
                        ps.setString(1,n);
                        ps.setString(2,p);
	
                        ResultSet rs=ps.executeQuery();
                        if(rs.next())
                        {
                       
                      //String usertype= rs.getString("UserType");
                      //String userName=  rs.getString("Name");
                     session.setAttribute("id",rs.getString("ID"));
                     session.setAttribute("UserType",rs.getString("UserType"));
                     session.setAttribute("name",rs.getString("Name"));
                        response.sendRedirect("index.jsp");
               /*         if (usertype.equals("admin"))
                        {
                        RequestDispatcher rd=request.getRequestDispatcher("profile.html");
			rd.forward(request,response);
                             //response.sendRedirect("adminprofile.jsp");
                              
                        session.setAttribute("UName",rs.getString("Name"));
                        }
                        else
                            if (usertype.equals("spcust")) {
                        //RequestDispatcher rd=request.getRequestDispatcher("servlet2");
			//rd.forward(request,response);
                       // out.print("test");
                        response.sendRedirect("userprofile2.jsp");
                       
                        session.setAttribute("UName",rs.getString("Name"));
                         session.setAttribute("UserType",rs.getString("UserType"));
                        
                        }
                        
                            if (usertype.equals("coorideabank")) {
                        //RequestDispatcher rd=request.getRequestDispatcher("servlet2");
			//rd.forward(request,response);
                       // out.print("test");
                        response.sendRedirect("coorServices.jsp");
                       
                        session.setAttribute("UName",rs.getString("Name"));
                         session.setAttribute("UserType",rs.getString("UserType"));
                        
                        }
                           else
                            if (usertype.equals("emp")) {
                        //RequestDispatcher rd=request.getRequestDispatcher("servlet2");
			//rd.forward(request,response);
                       // out.print("test");
                        response.sendRedirect("userprofile1.jsp");
                        
                        session.setAttribute("UName",rs.getString("Name"));
                         session.setAttribute("UserType",rs.getString("UserType"));
                         session.setAttribute("id",rs.getString("ID"));
                         
                        }*/
                        }
                        
                        else{
			out.print("Sorry username or password error");
                        }
	
}catch(Exception e){System.out.println(e);}
			
		//}
		//else{
		//	out.print("Sorry username or password error");
               
			
		
		
		out.close();
	}

}
