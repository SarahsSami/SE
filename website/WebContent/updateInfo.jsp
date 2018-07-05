<%-- 
    Document   : adminprofile
    Created on : Mar 16, 2017, 10:21:49 AM
    Author     : Nada AlNetaifi
    Input: ask admin for assign each user(coordinator) and its task either pages or services.
    Output: the user(coordinator) and its task will assigned in the table and in database, after that once the admin click on submit, it will send it to each user(coordinator) that this is your task. 
--%>

<%@page import="java.sql.Statement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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

select {
    width: 100%;
    box-sizing: border-box;
    border: 2px solid #ccc;
    border-radius: 4px;
    font-size: 16px;
    background-color: white;
  
    padding: 12px 20px 12px 40px;
    -webkit-transition: width 0.4s ease-in-out;
    transition: width 0.4s ease-in-out;
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
/* Full-width input fields */
input[type=text], input[type=password] {
    width: 100%;
    padding: 12px 20px;
    margin: 8px 0;
    display: inline-block;
    border: 1px solid #ccc;
    box-sizing: border-box;
}
/* Add padding to container elements */
.container {
    padding: 16px;
}

/* Clear floats */
.clearfix::after {
    content: "";
    clear: both;
    display: table;
}

/* Set a style for all buttons */
button {
    background-color: #00008B;
    color: white;
    padding: 14px 20px;
    margin: 8px 0;
    border: none;
    cursor: pointer;
    width: 100%;
}
/* Float cancel and signup buttons and add an equal width */
.cancelbtn,.signupbtn {
    width: 50%;
}


/* Change styles for cancel button and signup button on extra small screens */
@media screen and (max-width: 300px) {
    .cancelbtn, .signupbtn {
       width: 100%;
    }
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
      <a href="adminServices.jsp" class="dropbtn"> SERVICES </a>
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
              <%
    //to display the ideas from database to ideas bank 
String driverName = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String dbName = "marketing";
String userId = "root";
String password = "myadminsql123";

int i=0;
int s = 0; 
int notification =0 ;
try {
Class.forName(driverName);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
try {
connection = DriverManager.getConnection(
connectionUrl + dbName, userId, password);
statement = connection.createStatement();
String sql = "SELECT * FROM marketing.users where ID="+session.getAttribute("id");
resultSet = statement.executeQuery(sql);
String user= ""+session.getAttribute("id");
resultSet.next();
%>
<form action="updateInfo" method="post">
  <div class="container">
    <label><b>User name</b></label>
    <input type="text" placeholder="Enter User name" name="name" required value="<%=resultSet.getString("Name")%>">
    <label><b>Password</b></label>
    <input type="password" placeholder="Enter Password" name="pass" required value="<%=resultSet.getString("Password")%>">
     <label><b>Email</b></label>
    <input type="text" placeholder="Enter Email" name="email" required value="<%=resultSet.getString("email")%>"> 
     <input type="Hidden"  name="id"  value="<%=user%>">
        <input type="Hidden"  name="type"  value="<%=resultSet.getString("UserType")%>">

        <br>       <br>        <br>        <br>        <br>
   <center><button type="submit" class="signupbtn">Submit</button></center>

  </div>
</form>
                <%
  
} catch (Exception e) {
e.printStackTrace();
}
%>
    </body>
</html>
