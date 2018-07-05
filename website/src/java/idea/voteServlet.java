
/*
  Document   : voteServlet
    Created on : Feb 13, 2017, 9:09:01 AM
    Author     : noura faisal alsaud
    Input: user can click on vote button .
output: show the vote 
 */
package idea;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import java.text.SimpleDateFormat;
public class voteServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
  int vote =Integer.parseInt(request.getParameter("voting"));
  String ideaID= request.getParameter("id");
   String userid= request.getParameter("id2");
  String voteStatus="1";
vote++;
         try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/marketing", "root", "myadminsql123");
            PreparedStatement stmt = con.prepareStatement("INSERT INTO `voting` (`user_id`, `vote`, `idea_id`) VALUES (?,?,?) ;");
            java.sql.Timestamp date = new java.sql.Timestamp(new java.util.Date().getTime());
            stmt.setString(1,userid);
            stmt.setString(2,voteStatus);
            stmt.setString(3,ideaID);
            //stmt.executeUpdate();
            int i = stmt.executeUpdate();
            if (i > 0) 
            {
          PreparedStatement stmt2 = con.prepareStatement("update idea set vote=vote+1 where id_idea=?;");
            //stmt2.setInt(1,vote);
            stmt2.setString(1,ideaID);
            stmt2.executeUpdate();
            }
        } catch (Exception ey) {
            System.out.println(ey);
        }   out.close();   } }

