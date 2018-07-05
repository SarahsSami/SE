<%-- 
    Document   : userprofile
    Created on : Dec 11, 2016, 8:44:38 AM
    Author     : Nada AlNetaifi
    Input: ask special cstomer to select the service that they want
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
<style>
body {font-family: "Lato", sans-serif}
ul {
    list-style-type: none;
    margin: 0;
    padding: 0;
    overflow: hidden;
    background-color: #333;
}
li {
    float: left;
}
li a {
    display: block;
    color: white;
    text-align: center;
    padding: 14px 16px;
    text-decoration: none;
}

li a:hover:not(.active) {
    background-color: #111;
}

.active {
    background-color: #4CAF50;
}

.icon {
    width:30px; 
    height:30px;
    position: absolute;
    top: 295px;
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

<%--<%@ page import = "test.org.opencrx.kernel.client.alerts" %>
 <% alerts t1 = new alerts();

t1.getAlert (count);

%>
--%>
<!-- Navbar -->

<div class="w3-top">
    
<ul class="w3-navbar w3-black w3-card-2 w3-left-align">
    <li><img src="kacst.png" style="width:120px;height:70px;"></li>
    
  
 <li><a href="index2.html" class="w3-hover-none w3-hover-text-grey w3-padding-large">HOME</a></li>
  <li class="w3-hide-small"><a href="aboutus.jsp" class="w3-padding-large">ABOUT US</a></li>
  <li class="w3-hide-small"><a href="productservices.jsp" class="w3-padding-large">PRODUCT & SERVICES</a></li>
  <li class="w3-hide-small"><a href="newsevents.jsp" class="w3-padding-large">NEWS & EVENTS</a></li>
  <li class="w3-hide-small"><a href="career.jsp" class="w3-padding-large">CAREER </a></li>   
   <li class="w3-hide-small"><a href="career.jsp" class="w3-padding-large">ARTICLES </a></li> 
    <li class="w3-hide-small"><a href="career.jsp" class="w3-padding-large">CONTACT US </a></li> 
    <li class="w3-hide-medium w3-hide-large w3-opennav w3-right">
    <li> <a class="w3-padding-large" href="signout.jsp" onclick="myFunction()" title="Sign out"><i class="fa fa-bars">Sign out</i></a>
  </li>
</ul>
</div>

<% String userName, password; %>
<% 
userName = request.getParameter("userName");
password = request.getParameter("password");
%>
<br/>
<br/>
<br/>
<br/>
<h3>  Welcome,  <%= userName %> </h3> 

<!-- Page content -->


<br/>
<center><h1><b>Please select Services: </b></h1></center>
<br/>
<br/>
<br/>
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
      <img src="idea-bank.jpg" style="width:30%">
      <div class="w3-container">
</center>
        <br/>
      </div>

  
</div>


   
    </div>
  </div>

<!-- Footer -->
<footer class="w3-container w3-padding-64 w3-center w3-opacity w3-light-grey w3-xlarge" >
  
    <center> <p class="w3-medium">Copyrigth &copy; KACST ECP 2017</p> </center>
</footer>

</html>


