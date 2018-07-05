
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
        <title>employee vision</title>
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
        <a href="cdpprofile.jsp" class="dropbtn"><i class="fa fa-user"></i> MY PROFILE</a>

              <a href="Login.jsp" class="dropbtn"><i class="fa fa-user"></i> SIGN OUT</a>
              
     

       <form>
  &#128269; <input type="text" name="search" placeholder="Search">
  
</form>
       <!-- DC Notification Alert Bar End -->
<!-- DC Notification Alert Bar Settings -->

       
    </li>
    <!-- Hide right-floated links on small screens and replace them with a menu icon -->
  
  </ul>
</div>
        <br/>
        <br/>
        <br/>
       <br/>
       <!-- employee vision Section -->
<div class="w3-container w3-padding-128" id="about">
    <center> <h1 class="w3-center" style="font-family: Castellar;">EMPLOYEE VISION</h1> </center>
 
  <img src="Lightbulb.jpg" style="width:1500px; height:400px;"/> 
  
  <br/>
  <br/>
  <br/>
  <br/>
  <br/>

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
  
%>
  
<%
try
{

String sql = "SELECT accept FROM employee WHERE emp_id ="+id;
ps = con.prepareStatement(sql);
ResultSet rs = ps.executeQuery();
boolean d = rs.next();
String accept = null;
if(d){
 accept = rs.getString("accept");
}
%>        
  


      <center>
  <form name="commment" action="addvision" method="post">
      <textarea name="comment" required rows="30" cols="150" placeholder="ENTER YOUR VISION HERE..."></textarea>
      <input type="hidden" name="id" value="<%=id%>" >
       <input type="hidden" name="dp" value="g" >
       <input type="hidden" name="accept" value="<%=accept%>" >
  <br>
  <input class ="button" type="submit" value="submit" />
</form></center>
  <br>
      <% 
}
catch(SQLException sqe)
{ 
out.println(sqe);
}
%> 
  
 
 <br/>
 <br/>
 <br/>
 
  
  <!--<center> <input class ="button button1" type="submit" onclick="return clicked();" value="submit" /> </center>
-->

  <script type="text/javascript">
  
    function submitPost() {
   
     if (window.confirm('Do you want to submit?')){
         alert("successfully submitted") ;
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
