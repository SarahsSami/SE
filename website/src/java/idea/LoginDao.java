
/*
  Document   : LoginDao
    Created on : Feb 13, 2017, 9:09:01 AM
    Author     : noura faisal alsaud
    Input: none.
output: none
 */
package idea;

import java.sql.*;

public class LoginDao {

public static boolean validate(String name,String pass){
boolean status=false;
try{
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/marketing","root","myadminsql123");
	
	PreparedStatement ps=con.prepareStatement("select * from users where Name=? and Password=?");
	ps.setString(1,name);
	ps.setString(2,pass);
	
	ResultSet rs=ps.executeQuery();
	status=rs.next();
	
	
}catch(Exception e){System.out.println(e);}
return status;
}
}