<%-- 
    Document   : openDP
    Created on : Jul 24, 2017, 11:14:27 AM
    Author     : aljazi almogren
    Input      : the cdpo will choose either accept or deny dp.
    Output     : CDPO will be moved to the next page based on his choice: if accept he will go back to evaldp.jsp, or if deny he will go to update. java servlate to delete dp from db.
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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
     
     <center>
     <h3 style='font-family: Castellar; color:green'> Development Plan Evaluation: </h3> </center>
     <br/>
        <br/>
        <br/>
         <br/>
         <!-- the below code is to get the parameters that are passed by the previous page evaldp.jsp -->
       <%
    String dp=request.getParameter("dp");
    String emp_id = request.getParameter("empid");
    String emp_email = request.getParameter("empemail");
    %>
    <form action="update" method="POST">
     <textarea rows="5" cols="150" readonly name = "dp">
      <%=dp%>
     </textarea>
     <input type="hidden" name="empid" value="<%=emp_id%>">
     <input type="hidden" name="empemail" value="<%=emp_email%>">
     <input type="submit" value="Accept" formaction = "acceptDP" />
      <input type="submit" value="Deny" formaction = "cfmORfeedback.jsp" /><br>
<br>
 
</form>
      
     
    <!-- body contents ends here -->
  
          
         
      <!-- Footer -->
<footer class="w3-container w3-padding-64 w3-center w3-opacity w3-light-grey w3-xlarge" >
  
    <center> <p class="w3-medium">Copyright &copy; KACST ECP 2017</p> </center>
</footer>
    </body>
</html>
