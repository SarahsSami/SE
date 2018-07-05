<%-- 
    Document   : userprofile
    Created on : Dec 11, 2016, 8:44:38 AM
    Author     : Nada AlNetaifi
   Input: ask Employee to select the service that they want
    Output: services provided by organization like CRM. There should be integration with alert.java that will inform the customers that they have a notification in CRM profile
--%>


 
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>

<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>

<%--<%@page import="com.sun.org.apache.regexp.internal.RETest.test(String[])"%> --%>
<!DOCTYPE html>
<html>
 
<title>W3.CSS Template</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="/lib/w3.css">

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

#nav{list-style:none;margin: 0px;padding: 0px;}
#nav li {
float: left;
margin-right: 20px;
font-size: 14px;
font-weight:bold;
}
#nav li a{color:#333333;text-decoration:none}
#nav li a:hover{color:#006699;text-decoration:none}
#notification_li
{
position:relative
}
#notificationContainer 
{
background-color: #fff;
border: 1px solid rgba(100, 100, 100, .4);
-webkit-box-shadow: 0 3px 8px rgba(0, 0, 0, .25);
overflow: visible;
position: absolute;
top: 30px;
margin-left: -170px;
width: 400px;
z-index: -1;
display: none; 
}

#notificationContainer:before {
content: '';
display: block;
position: absolute;
width: 0;
height: 0;
color: transparent;
border: 10px solid black;
border-color: transparent transparent white;
margin-top: -20px;
margin-left: 188px;
}
#notificationTitle
{
font-weight: bold;
padding: 8px;
font-size: 13px;
background-color: #ffffff;
position: fixed;
z-index: 1000;
width: 384px;
border-bottom: 1px solid #dddddd;
}
#notificationsBody
{
padding: 33px 0px 0px 0px !important;
min-height:300px;
}
#notificationFooter
{
background-color: #e9eaed;
text-align: center;
font-weight: bold;
padding: 8px;
font-size: 12px;
border-top: 1px solid #dddddd;
}

#notification_count 
{
padding: 3px 7px 3px 7px;
background: #cc0000;
color: #ffffff;
font-weight: bold;
margin-left: 77px;
border-radius: 9px;
-moz-border-radius: 9px; 
-webkit-border-radius: 9px;
position: absolute;
margin-top: -11px;
font-size: 11px;
}

/* Style of notification */

/* Dropdown button on hover & focus */
.dropbtn:hover, .dropbtn:focus {
    background-color: whitesmoke;
}

/* The container <div> - needed to position the dropdown content */
.dropdown {
    display: inline-block;
}

/* Dropdown Content (Hidden by Default) */
.dropdown-content {
    display: none;
    position: absolute;
    background-color: #f9f9f9;
    min-width: 160px;
    box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
    z-index: 1;
}

/* Links inside the dropdown */
.dropdown-content a {
    color: black;
    padding: 12px 16px;
    text-decoration: none;
    display: block;
}

/* Change color of dropdown links on hover */
.dropdown-content a:hover {background-color: #f1f1f1}

/* Show the dropdown menu (use JS to add this class to the .dropdown-content container when the user clicks on the dropdown button) */
.show {display:block;}

</style>
<body>
<%--<%@ page import = "test.org.opencrx.kernel.client.alerts" %>
 <% alerts t1 = new alerts();

t1.getAlert (count);

%>
--%> 
<!-- employee user profile-->

<!-- Navbar -->

<div class="w3-top">
  <br/>
   
  <ul class="w3-navbar w3-white w3-card-2" id="myNavbar">
      <li><a href="index2.html" class="w3-wide"> <img src="kacst.png" style="width:120px;height:70px;"></a><li>
      
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
      <a href=" " class="dropbtn"><i class="fa fa-envelope"></i> NOTIFICATION </a>
      <a href="userprofile1.jsp" class="dropbtn"> MY PROFILE</a>

      <a href="Login.jsp" class="dropbtn" onclick="myFunction()" title="Sign out"><i class="fa fa-bars"></i> SIGN OUT</a>
     
      <input type="image" src="personal.png" style="height:50px; width:50px;">
<!--<input id="data_9" name="data_9" style="width : 450px;" type="file" class="form-control"/>-->

<%! String driverName = "com.mysql.jdbc.Driver";%>
<%!String url = "jdbc:mysql://localhost:3306/marketing";%>
<%!String user = "root";%>
<%!String psw = "myadminsql123";%>
<%
Connection con = null;
PreparedStatement ps = null;
 Class.forName(driverName);
con = DriverManager.getConnection(url,user,psw);
 String id =""+session.getAttribute("id");

 try
{
String sql = "SELECT accept,dp_status FROM marketing.employee WHERE emp_id ="+id;
ps = con.prepareStatement(sql);
ResultSet rs = ps.executeQuery();
String accept;
String dp_status;
int n=0;
rs.next();
if((rs.getString("accept")).equals(null))
{
accept = "0";
dp_status = "0";
}
else{
accept = rs.getString("accept");
dp_status = rs.getString("dp_status"); 
}
if(accept.equals("1")||accept.equals("2")){
n++;
}
if(dp_status.equals("1")||dp_status.equals("2")){
n++;
}

%> 
      <span id="notification_count"><%=n%></span>

</td>


<div class="dropdown">
  <a onclick="myFunction()" class="dropbtn"><i class="fa fa-th"></i> NOTIFICATION</a>
 <div id="myDropdown" class="dropdown-content">
     <a href="#"> CRM </a><span></span>
     <br>
    <a href="ideabank1.jsp" style= "background:#B22222"> Ideas Bank </a><span></span>
     <br>
 <a href="#"> Knowledge Management </a><span></span>
    <br>
   <a href="cdpprofile.jsp" style= "background:#B22222"> CDP </a><span><%=n%></span>

 
  </div> 
</div>
 
<%
}catch(SQLException sqe)
{ 
out.println(sqe);
}
%>
    </li>

</ul>
 


    
</div>

<br/>
<br/>

<% String userName, password; %>
<% 
userName = request.getParameter("userName");
password = request.getParameter("password");
%>

<br/>
<br/>
<br/>
<br/>
<br/>

<br/>
     <h3>  Welcome,  <%

out.print(""+session.getAttribute("UName"));
%></h3>  





<%

 Class.forName(driverName);
con = DriverManager.getConnection(url,user,psw);
%>


 <%
try
{

String sql2 = "SELECT emp_type FROM users WHERE Name ='"+session.getAttribute("UName")+"' ";
ps = con.prepareStatement(sql2);
ResultSet rs2 = ps.executeQuery();
boolean flag = rs2.next();
String emp_type = rs2.getString("emp_type");
%>

 


<!-- Page content -->

<center><h1><b>Please select Services: </b</h1></center>
<br/>
  <%--  <%
        alerts tc = new alerts();
        tc.getAlert();
        out.print(tc.getAlert());
        %>
     --%>   

        <div class="icon">
            <a href="http://10.0.26.170:8080/opencrx-core-CRX/"><img src="icon.bmp" alt="none" width="100%" height="100%" /></a>
    <div class="txt">
        
        5
        
    </div>
</div>
     <center>
         <a href ="http://10.0.26.170:8080/opencrx-core-CRX/" ><img src="CRM.jpg" style="width:30%"></a> </center>
      <div class="w3-container">
        <br/>
      </div>
  
   
  
  <%--<jsp:useBean id="No" class="crx.alerts" /> 
<%= link.getAlert()%>--%>
  
 

  <center>
      <img src="km-.png" style="width:30%">
  </center>
      <div class="w3-container">
        <br/>
      </div>

<center>
     <a href="ideabank1.jsp" >
<img src="idea-bank.jpg" style="width:30%">
</a>
      <div class="w3-container">
</center>
        <br/>
      </div>

  
</div>

<center>
      <img src="plm2.png" style="width:30%">
</center>
      <div class="w3-container">
        <br/>
      </div>
   
<center>
      
     <%
     if(emp_type.equals("CDPO"))
     {
  String dp_status1 = "";    
try
{

String sql1 = "SELECT * FROM marketing.employee;";
ps = con.prepareStatement(sql1);
ResultSet rs1 = ps.executeQuery();
int count = 0;

 while(rs1.next())
{
dp_status1 = rs1.getString("dp_status");
if ( dp_status1.equals("0")){
count++;
}}
%>
      


    <center>
       
     
      <span id="notification_count"><%=count%></span>
  <a href="cdpoUI.jsp" >
   <img src="cdp.png" width="500px"  height="200px">
<div id="notificationContainer">
    <div id="notificationsBody" class="notifications"></div> 
    </center>
     </a>





  <%
}
catch(SQLException sqe)
{ 
out.println(sqe);
}
%>







     
     <%
     }

else if(emp_type.equals("Team Leader"))
{

session.setAttribute("id",session.getAttribute("id"));

%>
      <a href="teaml1.jsp" >
          <img src="cdp.png" width="500px"  height="200px">
     </a>
     
     <%
     }

else if(emp_type.equals("Employee"))
{

%>


<a href="comvision.jsp" >
      <img src="cdp.png" width="500px"  height="200px">
      
  
   

     
     <%

    }
 
}
catch(SQLException sqe)
{ 
out.println(sqe);
}
%>
     
     
      
      
      
</center>
      <div class="w3-container">
        <br/>
        <br/>
      </div>
    </div>
  </div>

<!-- Footer -->
<footer class="w3-container w3-padding-64 w3-center w3-opacity w3-light-grey w3-xlarge" >
  
    <center> <p class="w3-medium">Copyrigth &copy; KACST ECP 2017</p> </center>
</footer>
</body>
</html>

