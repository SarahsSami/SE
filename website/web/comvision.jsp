<%@page import="com.sun.xml.rpc.processor.modeler.j2ee.xml.string"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    
    
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title> company vision </title>

<script type="text/javascript" src="jquery.js"></script>
<link rel="stylesheet" type="text/css" href="notification_bar_style.css">



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
body{
    margin: 0;
    padding: 0;
    width: 100%;
}
#hellobar-bar {
    font-family: "Open Sans", sans-serif;
    width: 100%;
    margin: 0;
    height: 30px;
    display: table;
    font-size: 17px;
    font-weight: 400;
    padding: .33em .5em;
    -webkit-font-smoothing: antialiased;
    color: #5c5e60;
    position: fixed;
    background-color: white;
    box-shadow: 0 1px 3px 2px rgba(0,0,0,0.15);
}
#hellobar-bar.regular {
    height: 30px;
    font-size: 14px;
    padding: .2em .5em;
}
.hb-content-wrapper {
    text-align: center;
    text-align: center;
    position: relative;
    display: table-cell;
    vertical-align: middle;
}
.hb-content-wrapper p {
    margin-top: 0;
    margin-bottom: 0;
}
.hb-text-wrapper {
    margin-right: .67em;
    display: inline-block;
    line-height: 1.3;
}
.hb-text-wrapper .hb-headline-text {
    font-size: 1em;
    display: inline-block;
    vertical-align: middle;
}
#hellobar-bar .hb-cta {
    display: inline-block;
    vertical-align: middle;
    margin: 5px 0;
    color: #ffffff;
    background-color: #22af73;
    border-color: #22af73
}
.hb-cta-button {
    opacity: 1;
    color: #fff;
    display: block;
    cursor: pointer;
    line-height: 1.5;
    max-width: 22.5em;
    text-align: center;
    position: relative;
    border-radius: 3px;
    white-space: nowrap;
    margin: 1.75em auto 0;
    text-decoration: none;
    padding: 0;
    overflow: hidden;
}
.hb-cta-button .hb-text-holder {
    border-radius: inherit;
    padding: 5px 15px;
}
.hb-close-wrapper {
    display: table-cell;
    width: 1.6em;
}
.hb-close-wrapper .icon-close {
    font-size: 14px;
    top: 15px;
    right: 25px;
    width: 15px;
    height: 15px;
    opacity: .3;
    color: #000;
    cursor: pointer;
    position: absolute;
    text-align: center;
    line-height: 15px;
    z-index: 1000;
    text-decoration: none;
}
.button {
    background-color: #778899
    border none;
    color: darkblue;
    padding: 15px 32px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 15px;
    margin: 4px 2px;
    cursor: pointer;
    width: 10%
}

.button1 {
    box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.19);
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
        </style>
    <body>
        
        <!-- Navbar -->
           <div class="w3-top">
   
  <ul class="w3-navbar w3-white w3-card-2" id="myNavbar">
    
      <li style="list-style-type: none;">
          <a href="index2.html" class="w3-wide"> <img src="kacst.png" style="width:120px;height:70px;"></a> </li>
             
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
        <a href="cdpprofile.jsp" class="dropbtn"><i class="fa fa-user"></i> MY PROFILE</a>

              <a href="Login.jsp" class="dropbtn"><i class="fa fa-user"></i> SIGN OUT</a>
              
<!-- db connection and notification acceptance or deny from TL-->
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
String sql = "SELECT accept from employee where emp_id="+id;
ps = con.prepareStatement(sql);
ResultSet rs = ps.executeQuery();

while(rs.next()){
String accept= rs.getString("accept");

int count=0;

if (! accept.equals("0") ){
%> 
<span id="notification_count">1</span>
 <a href="notification_1.jsp" class="dropbtn"><i class="fa fa-th"></i> NOTIFICATION</a>
 
    <p id="notification_li">

<div id="notificationContainer">
<div id="notificationsBody" class="notifications"></div>
<%}}%>
<%
}catch(SQLException sqe)
{ 
out.println(sqe);
}
%>
</div>
       <form>
           
  &#128269; <input type="text" name="search" placeholder="Search">
  
</form>
       
     <script type="text/javascript" src="js/jquery.min.1.9.js"></script>
<script type="text/javascript" >
$(document).ready(function()
{
$("#notificationLink").click(function()
{
$("#notificationContainer").fadeToggle(300);
$("#notification_count").fadeOut("slow");
return false;
});

//Document Click hiding the popup 
$(document).click(function()
{
$("#notificationContainer").hide();
});

//Popup on click
$("#notificationContainer").click(function()
{
return false;
});

});
    </script>

       
       <br/>
       <br/>
       <br/>
       <br/>
       
       
       <!-- Page content -->
       
<div class="w3-container w3-padding-128" id="about">
    <center> <h1 class="w3-center" style="font-family: Castellar;">COMPANY VISION</h1> </center>
 
  <img src="vision-mission.jpg" style="width:1500px; height:400px;"/> 
  <br/>
  <br/>
  <br/>
  <br/>
  <br/>
  <center> <h3> <span> 
              <!-- retrieve department and company vision updated by CDPO -->
          <%
try
{

String sql = "SELECT * FROM visions WHERE cdpo_id IS NOT null";
ps = con.prepareStatement(sql);
ResultSet rs = ps.executeQuery(); 
 while(rs.next())
{
String co_vision = rs.getString("co_vision"); 
String dep_vision = rs.getString("dep_vision");

%>


  <%=co_vision%> 
<%
 } 

}
catch(SQLException sqe)
{ 
out.println(sqe);
}
%>

       </span> </h3>

</center>


   <center><input class ="button button1" type="button" name="b2" value="NEXT" onclick="location.href='depvision.jsp'"> </center>
    


<!-- Footer -->
<footer class="w3-container w3-padding-64 w3-center w3-opacity w3-light-grey w3-xlarge" >
  
    <center> <p class="w3-medium">Copyrigth &copy; KACST ECP 2017</p> </center>
</footer>


</html>
    

