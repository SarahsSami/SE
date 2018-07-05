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
    <center> <h1 class="w3-center" style="font-family: Castellar;">TEAM LEADER </h1> </center>
 
  <img src="tl.jpg" style="width:1500px; height:200px;"/> 
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
  
 <center>
 
    <table border="1" width="60%"  >
        <tr>
            <th>Employee Name</th>
            <th>Employee ID </th>
            <th> </th>
        </tr>
        <%
    try
{
    String tid =""+session.getAttribute("tid");
    String sql = "SELECT  users.Name, users.email, teamleader.emp_id, employee.emp_vision , employee.accept FROM (( employee INNER JOIN users ON users.ID = employee.emp_id)  INNER JOIN teamleader ON teamleader.emp_id = users.ID )WHERE teamleader.tl_id="+tid;
//String sql = "SELECT  users.Name, users.email, employee.emp_id, employee.emp_vision , employee.accept  "
       // + "FROM employee, users "
        // + "WHERE employee.emp_id = users.ID ";
ps = con.prepareStatement(sql);
ResultSet rs = ps.executeQuery();
Integer ac ;

while(rs.next())
{
 ac =rs.getInt("accept");
 if(ac==0){
 %>
                
                <tr>
                    <form action = "vision.jsp" method = "post">
                    <th> <%=rs.getString("Name")%></th>
                    <th> <%=rs.getInt("emp_id")%></th>
                    <input type="hidden" name="n" value="<%=rs.getString("Name")%>">
                    <input type="hidden" name="i" value="<%=rs.getInt("emp_id")%>">
                    <input type="hidden" name="v" value="<%= rs.getString("emp_vision")%>">
                    <input type="hidden" name="e" value="<%= rs.getString("email")%>">
                   <th><input type="submit" value="ALIGNE VISION" /></th> </form>
                </tr>
    
            <%
               }}
            %>

        </table>

    <%
}catch(SQLException sqe)
{ 
out.println(sqe);
}
%>
      
    </div>
    
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
  <br/>
   
    </body>
    <!-- Footer -->
<footer class="w3-container w3-padding-64 w3-center w3-opacity w3-light-grey w3-xlarge" >
  
    <center> <p class="w3-medium">Copyrigth &copy; KACST ECP 2017</p> </center>
</footer>
</html>
