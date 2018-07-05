<%-- 
    Document   : userprofile
    Created on : Dec 11, 2016, 8:44:38 AM
    Author     : Nada AlNetaifi
   Input: ask user to select the service that they want
    Output: services provided by organization like CRM. There should be integration with alert.java that will inform the customers that they have a notification in CRM profile
--%>


 
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
</style>
<body>
<%--<%@ page import = "test.org.opencrx.kernel.client.alerts" %>
 <% alerts t1 = new alerts();

t1.getAlert (count);

%>
--%> 

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
      <a href="Login.jsp" class="dropbtn" onclick="myFunction()" title="Sign out"><i class="fa fa-bars"></i>SIGN OUT</a>


    </li>
    
    
  </ul>
</div>
<br/>
<br/>
<!--
<% String userName, password; %>
<% 
userName = request.getParameter("Name");
password = request.getParameter("Password");
%>
<br/>
<br/>
<br/>
<br/>
<br/>
-->
<br/>
<h3>  Welcome,  <%
out.print("UserType :"+session.getAttribute("UserType")+"<br>");
out.print("UName"+session.getAttribute("UName"));
%></h3> 

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
     <a href="newjsp.jsp" >
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
      <img src="evaluation.png" style="width:30%">
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