<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<!--
Document: CDPO user interface (main page) 
Author: aljazi
Input: enable the CDP-officer to click any button either to manage visions of co and dp, evaluate dp, or follow up
Output: cdpo will be moved to the page he\she choose.
-->
<html>
    
    
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
        <style>
                       .w3-navbar li a {
    padding: 16px;
    float: left;
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
.button {
    background-color: #b9d3ee; 
    border: none;
    color: darkblue;
    padding: 15px 32px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    margin: 4px 2px;
    cursor: pointer;
    width: 35%
    
    
}

.button1 {
    box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.19);
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
margin-left: 250px;
border-radius: 9px;
-moz-border-radius: 9px; 
-webkit-border-radius: 9px;
position: absolute;
margin-top: -11px;
font-size: 11px;
}
        </style>
    <body>
           <div class="w3-top">
   
  <ul class="w3-navbar w3-white w3-card-2" id="myNavbar">
    
      <li style="list-style-type: none;">
          <a href="cdpoUI.jsp" class="w3-wide"> <img src="kacst.png" style="width:120px;height:70px;"></a> </li>
             
    <!-- Right-sided navbar links -->
  
    
    <li class="w3-right w3-hide-small" style="list-style-type: none;">
        <br/>
        <br/>
        <br/>
       <br/>
       <br/>
       
      <a href="about.html" class="dropbtn">ABOUT US</a>
      <a href="news.html" class="dropbtn"> NEWS & EVENTS</a>
      <a href="articles.html" class="dropbtn"><i class="fa fa-th"></i> ARTICLES</a>
      <a href="products.html" class="dropbtn"><i class="fa fa-usd"></i> PRODUCT&SERVICES</a>
      <a href="contact.html" class="dropbtn"><i class="fa fa-envelope"></i> CONTACT US</a>
       <a href="career.html" class="dropbtn">CAREER</a>
       <a href="rating.html" class="dropbtn">REVIEW</a>
       <a href="Login.jsp" class="dropbtn"><i class="fa fa-user"></i> SIGN IN</a>
       <form>
  &#128269; <input type="text" name="search" placeholder="Search">
</form>
    </li>
    <!-- Hide right-floated links on small screens and replace them with a menu icon -->
  
  </ul>
</div>
        <br/>
        <br/>
        <br/>
       <br/>
       <!-- CDP-Officer Section -->
<div class="w3-container w3-padding-128" id="about">
    <center> <h1 class="w3-center" style="font-family: Castellar;">CDP-Officer </h1> </center>
 
  <img src="about-us.png" style="width:1500px; height:400px;"/> 
  <br/>
  <br/>
  <br/>
  <br/>
  <br/>
  
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

 <%
try
{

String sql = "SELECT * FROM employee WHERE emp_dp IS NOT null";
ps = con.prepareStatement(sql);
ResultSet rs = ps.executeQuery();
int count = 0;

 while(rs.next())
{
String dp_status = rs.getString("dp_status");
if ( dp_status.equals("0")){
count++;
}}
%>




  
  <!-- page body starts here !-->
  <form>
<table width="1500" border="0" cellpadding="5">

<tr>

<td align="center" valign="center">
   

<center> 
    <button formaction="managVisions.jsp" class="button button1" type="submit" >Manage visions of the company and departments</button>
</center> 


</td>


</tr>
<tr>

<td align="center" valign="center">
 <center>  
   
   <span id="notification_count"><%=count%></span>
   <%
}
catch(SQLException sqe)
{ 
out.println(sqe);
}
%>
   
<div id="notificationContainer">
    <div id="notificationsBody" class="notifications"></div> </center>

<center> <button formaction="evaldp.jsp" class="button button1" type="submit">Evaluate development plans</button>
</center> 


</td>


</tr>
<tr>

<td align="center" valign="center">
   
<!--<button type="button">Manage the vision</button> -->
<center> <button class="button button1" type="button">Follow up</button>
</center> 


</td>


</tr>

</table>
  </form>
  <!-- page body ends here !-->
</div>
<!-- Footer -->
<footer class="w3-container w3-padding-64 w3-center w3-opacity w3-light-grey w3-xlarge" >
  
    <center> <p class="w3-medium">Copyright &copy; KACST ECP 2017</p> </center>
</footer>
    </body>
</html>
