<%-- 
    Document   : managVisions
    Created on : Jul 26, 2017, 8:57:16 AM
    Author     : Aljazi Almogren
    Input      : enable the CDPO to edit the vision of company and department then it will be saved to data base (save to DB IS DONE IN SERVLET UPDATEVISIONS.JAVA).
    Output     : CDPO will be moved back to his user interface (main page of his account).
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
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
       
      
<div class="w3-container w3-padding-128" id="about">
    <center> <h1 class="w3-center" style="font-family: Castellar;">manage visions </h1> </center>
 
  <img src="about-us.png" style="width:1500px; height:400px;"/> 
  <br/>
  <br/>
  <br/>
  <br/>
  <br/>
  
  <!-- body contents starts here --> 
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

<!-- the below code is to retrieve from database -->
 <%
     String id =""+session.getAttribute("id");
try
{

String sql = "SELECT * FROM visions ;";
ps = con.prepareStatement(sql);
ResultSet rs = ps.executeQuery();
String co_vision = "";
String dep_vision = "";
String cdpo_id = "";
String vision_id ="";
 while(rs.next())
{
co_vision = rs.getString("co_vision"); 
dep_vision = rs.getString("dep_vision");
cdpo_id = rs.getString("cdpo_id");
}
%>
  <form   action = "updatevisions" method = "post">
      <h2>Company's vision: </h2> 

        <textarea rows="5" cols="100" name = "covision" >
          <%=co_vision%> 
        </textarea>

        <h2>Department's vision: </h2>

        <textarea rows="5" cols="100" name = "depvision">
          <%=dep_vision%>  
        </textarea>
        <br/>
        <br/>
        <input type="hidden" name="cdpoid" value="<%=id%>">
        <input type="hidden" name="cdpoid2" value="<%=cdpo_id%>">
        
        
<button  type="submit">submit</button>


</form> 

<%
}
catch(SQLException sqe)
{ 
out.println(sqe);
}
%>
  
  <script>
      //<!--> this method is for confirmation message and it is used with the button submit but it did not work correctly so i did not use it-->
function myFunction() {
   if (confirm("are you sure you want to submit?")){
      window.location = 'updatevisions';     
   }
   else{
       return false;
   }
}
</script>

  
  
    <!-- body contents ends here --> 
</div>
<!-- Footer -->
<footer class="w3-container w3-padding-64 w3-center w3-opacity w3-light-grey w3-xlarge" >
  
    <center> <p class="w3-medium">Copyrigth &copy; KACST ECP 2017</p> </center>
</footer>
    </body>
</html>

