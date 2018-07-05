<%-- 
    Document   : evaldp
    Created on : Jul 24, 2017, 9:57:12 AM
    Author     : Aljazi Almogren
    Input      : this page will list the development plans of employees and the CDPO will click on each one of them to evaluate them.
    Output     : CDPO will be moved to another page which is openDP.jsp to view the development plan(dp).
--%>
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
 <meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="/lib/w3.css">
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">

<style>

body, html {
    height: 100%;
    line-height: 1.8;
    font-family: "Lato", sans-serif
}
.w3-navbar li a {
    padding: 16px;
    float:left;
}
h2 {
  position: absolute;
  top: 300px;
  left: 20px;
  width: 100%;
  color: white;
}
* {
  margin: 0;
  padding: 0;
}
h2 {
  display: block;
  font-size: 1em;
  -webkit-margin-before: 0.83em;
  -webkit-margin-after: 0.83em;
  -webkit-margin-start: 0px;
  -webkit-margin-end: 0px;
  font-weight: bold;
}
ul {
    list-style-type: none;
    margin: 0;
    padding: 0;
    overflow: hidden;
    
}


li a, .dropbtn {
    display: inline-block;
    color: blue;
    text-align: center;
    padding: 14px 16px;
    text-decoration: none;
}

li a:hover, .dropdown:hover .dropbtn {
    background-color: lightgrey;
}

li.dropdown {
    display: inline-block;
}

.dropdown-content {
    display: none;
    position: absolute;
    
    min-width: 160px;
    box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
    z-index: 1;
}

.dropdown-content a {
   
    padding: 12px 16px;
    text-decoration: none;
    display: block;
    text-align: left;
}

.dropdown-content a:hover {background-color: #f1f1f1}

.dropdown:hover .dropdown-content {
    display: block;
}
input[type=text] {
    width: 100px;
    box-sizing: border-box;
    border: 2px solid #ccc;
    border-radius: 4px;
    font-size: 16px;
    background-color: white;
  
    padding: 12px 20px 12px 40px;
    -webkit-transition: width 0.4s ease-in-out;
    transition: width 0.4s ease-in-out;
}

input[type=text]:focus {
    width: 10%;
}
.icon {
    width:30px; 
    height:30px;
    position: absolute;
    top: 345px;
    left: 520px;
}
.txt{
    background:red; 
    font-size:xx-small;
    position: absolute;
    top: 5px;
    left: 5px;
}
</style>
    <body>
       <div class="w3-top">
  <br/>
   
  <ul class="w3-navbar w3-white w3-card-2" id="myNavbar">
      <li><a href="index2.html" class="w3-wide"> <img src="kacst.png" style="width:120px;height:70px;"></a><li> <!-- KACST logo -->
      
            <br/>
    <!-- Right-sided navbar links -->
  <br/>
    
    <li class="w3-center w3-hide-small" style="list-style-type: none; ">
<br/>
<br/>
<br/>
<br/>
    
      <a href="about.html" class="dropbtn">ABOUT US</a>
      <a href="news.html" class="dropbtn"> NEWS & EVENTS</a>
      <a href="articles.html" class="dropbtn"><i class="fa fa-th"></i> ARTICLES</a>
      <a href="products.html" class="dropbtn"><i class="fa fa-usd"></i> PRODUCT&SERVICES</a>
      <a href="contact.html" class="dropbtn"><i class="fa fa-envelope"></i> CONTACT US</a>
      <a href="userprofile1.jsp" class="dropbtn"> MY PROFILE</a>
      <a href="Login.jsp" class="dropbtn" onclick="myFunction()" title="Sign out"><i class="fa fa-bars"></i>  SIGN OUT</a>
   </li>
</ul>
</div>
        <br/>
        <br/>
        <br/>
        <br/>
         <br/>
        <br/>
        <br/>
        <br/>
         <br/>
         
      <!-- body contents starts here -->
      <!-- the below code is the connection to the data base --> 
<%! String driverName = "com.mysql.jdbc.Driver";%>
<%!String url = "jdbc:mysql://localhost:3306/marketing";%>
<%!String user = "root";%>
<%!String psw = "myadminsql123";%>
<%
Connection con = null;
PreparedStatement ps = null;
 Class.forName(driverName);
con = DriverManager.getConnection(url,user,psw);
%>
     <center>
     <h3 style='font-family: Castellar; color:green'> Received Development plans </h3> </center>
     <br/>
        <br/>
        <br/>
         <br/>
         
      
         
         
<!-- Table for enable the CDPO to choose dp to evaluate it-->
         <center>
    <table width="350" style="border:none;">
  <tr>
      <th style="font-family: Verdana;"><u>Employee:</u></th>
      
  
      <th style=" font-family: Verdana;"><u></u></th>
  </tr>
  <!-- the below code is to retrieve from database -->
  <%
try
{
   

String sql = "SELECT employee.emp_dp,employee.emp_id, employee.dp_status, users.Name, users.email  "
        + "FROM employee, users"
        + " WHERE employee.emp_dp IS NOT null AND employee.emp_id = users.ID ";

ps = con.prepareStatement(sql);
ResultSet rs = ps.executeQuery();


 while(rs.next())
{

String name = rs.getString("Name"); 
String dp = rs.getString("emp_dp");
String emp_id = rs.getString("emp_id");
String emp_email = rs.getString("email");
String dp_status = rs.getString("dp_status");
if ( dp_status.equals("0")){
%>
<tr><form action="openDP.jsp" method = "post">
   
      <td> <%=name%></td>
      <input type="hidden" name="dp" value="<%=dp%>">
      <input type="hidden" name="empid" value="<%=emp_id%>">
      <input type="hidden" name="empemail" value="<%=emp_email%>">
      <td><input type="submit" value="evaluate" /></td> </form>
   
  </tr>
<% }} %>
<%
}
catch(SQLException sqe)
{ 
out.println(sqe);
}
%>
  
    </table> 
         
         
    <!-- body contents ends here -->     
         
         
         
         
         
         
         
         
         <!-- Footer -->
<footer class="w3-container w3-padding-64 w3-center w3-opacity w3-light-grey w3-xlarge" >
  
    <center> <p class="w3-medium">Copyrigth &copy; KACST ECP 2017</p> </center>
</footer>
    </body>
</html>
