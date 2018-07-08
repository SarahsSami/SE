<%-- 
    Document   : Login
    Created on : Mar 13, 2017, 10:04:25 AM
    Author     : noura faisal alsaud 
input:user can enter his name and password for login.
output:ask the user to enter his name and password for login 
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <style>
form {
    
     background: url("logg.jpg");
    background-size: 1510px 790px;
    background-repeat: no-repeat;
    padding-top: 40px;
}

input[type=text], input[type=password] {
    width: 20%;
    padding: 12px 20px;
    margin: 8px 0;
  
}

button {
    background-color: white;
    color: black;
    padding: 14px 20px;
    margin: 8px 0;
    border: none;
    cursor: pointer;
    width: 10%;
}


</style>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      
    <body>
          <a href="index2.html"><img src="kacst.png" style="width:120px;height:70px;"> </a>
<br/>
  <br/>
  <br/>
  <br/>
  <br/>
<center>
    <h1 style="font-family: Castellar"><b>Login Form ok</b></h1>
</center>
<br/>

 <form action="FirstServlet" method="post">

<ul>

<li style="list-style-type: none">
    <br/>
    <p style="color:white;"><b>User name: </b></p>
    <p><input type="text" name="Name" value=""  placeholder="Username" /></p></li>


<li style="list-style-type: none"><p style="color:white;"><b>Password:</b></p>
<p><input type="password" name="Password"  value="" placeholder="Password"/></p></li>

</ul>
   <br/>



    <center>
    <p><button type="submit" />Submit</button></p>
</center> 
    
</form>
<br/>
<br/>
<br/>
<br/>
<center> <input type="checkbox" checked="checked"> Remember me </center>
    
   <center>Forgot <a href="forgotpass.html">password?</a></center>
   <center> If you don't have an account, please Sign up here as:
     
    
           <br/> <a href="signupemp.html"> Employee </a>
            <br/> <a href="signupcust.html"> Customer</a>
   </center>
    </body>
</html>
