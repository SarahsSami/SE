<%-- 
    Document   : cfmORfeedback
    Created on : Jul 27, 2017, 11:37:31 AM
    Author     : Aljazi Almogren
    Input      : the cdpo will choose either feedback or call for meeting.
    Output     : CDPO will be moved to either feedback.jsp or callformeeting.jsp.
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
    width: 50%
    
    
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
       <a href="userprofile1.jsp" class="dropbtn"> MY PROFILE</a>
       <a href="Login.jsp" class="dropbtn"><i class="fa fa-user"></i> SIGN OUT</a>
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
       <!-- About Section -->
<div class="w3-container w3-padding-128" id="about">
    <center> <h1 class="w3-center" style="font-family: Castellar;">choose feedback or call for meeting </h1> </center>
 
  <img src="about-us.png" style="width:1500px; height:400px;"/> 
  <br/>
  <br/>
  <br/>
  <br/>
  <br/>
  <!-- body contents starts here --> 
    <%
     
    
    String emp_id = request.getParameter("empid");
    String emp_email = request.getParameter("empemail");
    
    //String emp_email = (String)request.getAttribute("emp_email");
    %>
  <form method = "post">
      <input type="hidden" name="empid" value="<%=emp_id%>"> 
      <input type="hidden" name="empemail" value="<%=emp_email%>">
     <center> <button formaction="feedback.jsp" class="button button1" type="submit">Send feedback to employee</button>
</center> 
      
      <center> <button formaction="callformeeting.jsp" class="button button1" type="submit">call for meeting</button>
</center> 
      
      
      
  </form>
  
  <!-- body contents ends here -->
    </body>
</html>
