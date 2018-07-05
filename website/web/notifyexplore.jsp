<%-- 
    Document   : notification
    Created on : Jul 30, 2017, 1:14:55 PM
    Author     : Latifa
--%>
 <%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*;" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>assess notification</title>
    </head>
    <style>
    .button a {
    display: block;
    width: 100%;
    height: 100%;
}
.button {
    background-color: #778899;
    border: none;
    color: darkblue;
    padding: 15px 32px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 15px;
    margin: 10px 2px;
    cursor: pointer;
    width: 30%;
    display: inline-block;
}

.button1 {
    box-shadow: 0 20px 16px 0 rgba(0,0,0,0.2), 0 10px 20px 0 rgba(0,0,0,0.19);
}

        </style>
    <body>
      <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<%! String driverName = "com.mysql.jdbc.Driver";%>
<%!String url = "jdbc:mysql://localhost:3306/marketing";%>
<%!String user = "root";%>
<%!String psw = "myadminsql123";%>
<form action="#">
<%
Connection con = null;
PreparedStatement ps = null;
try
{
Class.forName(driverName);
con = DriverManager.getConnection(url,user,psw);
 String id =""+session.getAttribute("id");
String sql = "SELECT explore_status FROM marketing.explore WHERE emp_id_x="+id;
ps = con.prepareStatement(sql);
ResultSet rs = ps.executeQuery(); 
%>
<center>
    <p>NOTIFICATION</p>
<select>
<%
while(rs.next()){
String explore_status = rs.getString("explore_status"); 
int y = Integer.parseInt(explore_status);
%>
<option value="<%=explore_status %>"><%=explore_status %></option>
</select>

<%
switch (y) {
 
case 1: 
 %>

<p> YOUR EXPLORE ACCEPTED!</p>
         <center><input  class ="button button1"type="button" name="b1" value="Go to the next page" onclick="location.href='devplan.jsp'">  </center>

</center>

<%
 break;
case 2:
     
     
 %>
 <center> <p> YOUR EXPLORE WAS DENIED</p>
 <p> FEEDBACK ABOUT YOUR EXPLORE HAS BEEN SENT BY EMAIL</p> 
 <br>
 

</center>
 
<%
break;
case 0:

%>
<center><p> YOUR EXPLORE IS STILL ON WAITING LIST!</p>

</center>
<%
}}}
catch(SQLException sqe)
{ 
out.println(sqe);
}
%>

</form>
</body>
</html>