<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
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


        </style>
    <body>
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
       <a href="userprofile1.jsp" class="dropbtn"> MY PROFILE</a>
       <form>
   <input type="text" name="search" placeholder="Search">
</form>
    </li>
    <!-- Hide right-floated links on small screens and replace them with a menu icon -->
  
  </ul>
</div>
        <br/>
        <br/>
        <br/>
       <br/>
       <!-- About Section -->
<div class="w3-container w3-padding-128" id="about">
    <center> <h1 class="w3-center" style="font-family: Castellar;">ASSESSMENT </h1> </center>
 
  <img src="ve.jpg" style="width:1500px; height:200px;"/> 
  <br/>
  <br/>
  <br/>
  <br/>
  <br/>

  
</div>
       
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
           String name =request.getParameter("n");
           String id =request.getParameter("i");
           String kw =request.getParameter("kw");
           String exp =request.getParameter("exp");
           String ss =request.getParameter("ss");
           String email =request.getParameter("e");
    
    %>
    <center>
        <p >Employee Name : <%=name%> <br> Employee ID : <%=id%> </p> <br><br><br>
        <p>Knowledge :: </p>
    <textarea rows="7" cols="100" readonly>
      <%=kw%>
    </textarea><br>
    <p>Experience :: </p>
    <textarea rows="7" cols="100" readonly>
      <%=exp%>
    </textarea><br>
    <p>Soft skills :: </p>
    <textarea rows="7" cols="100" readonly>
      <%=ss%>
    </textarea><br>
        
     
     
      <form  method="POST" action="accept_a">
          <input type="hidden" name="id" value="<%=id%>">
          <input type="submit" value="Accept" /></form>
    <br><br>
    
       <form  method="POST"  action="delete_a" action="deny.jsp" >
<input type="hidden" name="id" value="<%=id%>">
<input type="hidden" name="email" value="<%=email%>">
<input type="submit" value="Deny" ></form>
  
  


    <br/>
  <br/>
  <br/>
  <br/>
  <br/>
  <br/>
  <br/>
  <br/>
  <br/>
  <br/>
   
    </body>
    <!-- Footer -->
<footer class="w3-container w3-padding-64 w3-center w3-opacity w3-light-grey w3-xlarge" >
  
    <center> <p class="w3-medium">Copyrigth &copy; KACST ECP 2017</p> </center>
</footer>
</html>
