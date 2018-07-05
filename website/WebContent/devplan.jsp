<%-- 
    Document   : devplan
    Created on : Jul 27, 2017, 10:37:40 AM
    Author     : Latefa
--%>


<%@page import="java.sql.SQLException"%>
<%@page import="com.sun.xml.rpc.processor.modeler.j2ee.xml.string"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <script>
      
      $(function () {

      // Slideshow 1
      $("#slider1").responsiveSlides({
        auto: true,
        pager: false,
        nav: true,
        speed: 500,
        maxwidth: 1200,
        namespace: "centered-btns"
      });
   });
  </script>
  
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>development plan</title>
    </head>
    <body>
   
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
    background-color: #778899;
      border: none;
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
           <div class="w3-top">
   
  <ul class="w3-navbar w3-white w3-card-2" id="myNavbar">
    
      <li style="list-style-type: none;">
     <!-- logo -->      <a href="index2.html" class="w3-wide"> <img src="kacst.png" style="width:120px;height:70px;"></a> </li>
             
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
String sql = "SELECT dp_status FROM marketing.employee WHERE emp_id="+id;
ps = con.prepareStatement(sql);
ResultSet rs = ps.executeQuery();

while(rs.next()){
String dp_status= rs.getString("dp_status");

int count=0;

if (! dp_status.equals("0") ){
%> 
<span id="notification_count">1</span>
 <a href="notifydp.jsp" class="dropbtn"><i class="fa fa-th"></i> NOTIFICATION</a>
 
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
       <!-- DC Notification Alert Bar End -->
<!-- DC Notification Alert Bar Settings -->

       
    </li>
  
  </ul>
</div>
        <br/>
        <br/>
        <br/>
       <br/>
       <!-- dp Section -->
<div class="w3-container w3-padding-128" id="about">
    <center> <h1 class="w3-center" style="font-family: Castellar;">DEVELOPMENT PLAN </h1> </center>
 
  <img src="dp1.jpg" style="width:1500px; height:400px;"/> 
  
  <br/>
  <br/>
  <br/>
  <br/>
  <br/>

 
  
         
  


      <center>
  <form name="dp" action="adddp" method="post">
      <textarea name="dp" required rows="30" cols="150" placeholder="ENTER YOUR DEVELOPMENT PLAN HERE..."></textarea>
      <input type="hidden" name="id" value=<%=id%> >
       <input type="hidden" name="emp_vision" value="g" >
  <br>
  <input class ="button" type="submit" value="submit" />
</form></center>
  <br>
             
 <br/>
 <br/>
 <br/>
 
  
  <!--<center> <input class ="button button1" type="submit" onclick="return clicked();" value="submit" /> </center>
-->

  <script type="text/javascript">
  
    function submitPost() {
   
     if (window.confirm('Do you want to submit?')){
         alert("successfully submitted") 
         //REDIRECT
         window.location.href ="compvision.html";
     }
     else{
        //DO NOTHING AND STAY IN THE SAME PAGE
        //OR SOMETHING ELSE THAT YOU WANT

        return false;
     }
}
      

   
    </script>
    <center>
<footer>
     Copyright &copy; KACST ECP 2017
 </footer>
    </center>

    </body>
</html>

