<%-- 
    Document   : Profile
    Created on : Sep 12, 2017, 9:15:31 AM
    Author     : waveform3
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ page import="java.sql.*" %>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<!DOCTYPE html>
<html>
	<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>Markting Website</title>
		<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="" />
	<meta name="keywords" content=" html5, css3, mobile first, responsive" />
	<meta name="author" content="ADWA" />

 

  <!-- Facebook and Twitter integration -->
	<meta property="og:title" content=""/>
	<meta property="og:image" content=""/>
	<meta property="og:url" content=""/>
	<meta property="og:site_name" content=""/>
	<meta property="og:description" content=""/>
	<meta name="twitter:title" content="" />
	<meta name="twitter:image" content="" />
	<meta name="twitter:url" content="" />
	<meta name="twitter:card" content="" />

	<!-- Place favicon.ico and apple-touch-icon.png in the root directory -->
	<link rel="shortcut icon" href="favicon.ico">

	<link href='https://fonts.googleapis.com/css?family=Source+Sans+Pro:400,300,600,400italic,700' rel='stylesheet' type='text/css'>
	
	<!-- Animate.css -->
	<link rel="stylesheet" href="css/animate.css">
	<!-- Icomoon Icon Fonts-->
	<link rel="stylesheet" href="css/icomoon.css">
	<!-- Simple Line Icons -->
	<link rel="stylesheet" href="css/simple-line-icons.css">
	<!-- Owl Carousel -->
	<link rel="stylesheet" href="css/owl.carousel.min.css">
	<link rel="stylesheet" href="css/owl.theme.default.min.css">
	<!-- Bootstrap  -->
	<link rel="stylesheet" href="css/bootstrap.css">

	<!-- 
	Default Theme Style 
	You can change the style.css (default color purple) to one of these styles
	
	1. pink.css
	2. blue.css
	3. turquoise.css
	4. orange.css
	5. lightblue.css
	6. brown.css
	7. green.css

	-->
	<link rel="stylesheet" href="css/blue.css">

	<script src="js/modernizr-2.6.2.min.js"></script>
        <style>
table {
    border-collapse: collapse;
    width: 100%;
    text-align: center;
}

th, td {
    text-align: center;
    padding: 8px;
}

tr:nth-child(even){background-color: #f2f2f2}

th {
    background-color: #2185d5;
    color: white;
}


</style>
	</head>
	<body>
                <%
    //to display the ideas from database to ideas bank 
String driverName = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String dbName = "marketing";
String userId = "root";
String password = "myadminsql123";
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
String user= ""+session.getAttribute("id");
String sql = "SELECT * FROM marketing.users;";
resultSet = statement.executeQuery(sql);
resultSet.next();
%>
	<div class="navbar navbar-default navbar-fixed-top" role="navigation">
    <div class="container"> 
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span> 
            </button>
        </div>
        <div class="collapse navbar-collapse">
            <ul class="nav navbar-nav">
                <li><a href="index2.html">Home</a></li>
                <li><a href="EditInfo.jsp">Change Password</a></li>
                <li><a href="usersPanel.jsp">Users</a></li>
                <li><a href="#">Edit Articales</a></li>
                
             </ul>
            <ul class="nav navbar-nav navbar-right">
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        <span class="glyphicon glyphicon-user"></span> 
                        <strong><%=session.getAttribute("name")%></strong>
                        <span class="glyphicon glyphicon-chevron-down"></span>
                    </a>
                  <ul class="dropdown-menu">
                        <li><a href="Profile.jsp">Profile</a></li>
                        <li><a href="logout">Sign out</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</div>	
      

	
	
 <!-- Product And Services Sec -->
	<div id="fh5co-press" data-section="Services">
		<div class="container">
			<div class="row">
                            
                            
				<div class="col-md-12 section-heading text-center">
					<h2 class="single-animate animate-press-1">Users panel</h2>
					<div class="row">
						<div class="col-md-8 col-md-offset-2 subtext single-animate animate-press-2">
							<h4> </h4>
						</div>
                                            <br><br>
                                              <center>
<table>
  <tr>
    <th>Name</th>
    <th>User Type</th>
    <th>Task</th>
     <th>Email</th>

    <th>Update</th>
    <th>Delete</th>

  </tr>
  
   <% while (resultSet.next()) { %>
    
        <tr> 
 <td><%=resultSet.getString("Name")%> </td>      
    <td><%=resultSet.getString("UserType")%> </td>
    <td><%=resultSet.getString("AssTask")%> </td>
    <td><%=resultSet.getString("email")%> </td>
   
       <td>       <a href="Updateusers.jsp?user=<%=resultSet.getString("ID")%>"><button type="submit" class="btn btn-primary btn-sm">Update</button></a>

   <td><form action="deleteUser" method="post">
          <input type="Hidden"  name="id"  value="<%=resultSet.getString("ID")%>">
           <button type="submit" class="btn btn-primary btn-sm">Delete</button> 
       </form>
           
   </td>
</td>

  </tr>
 <% } %>
</table>
        </center>
        <br>       <br>        <br>        <br>        <br>
        <center><a href="Addusers.jsp"><button type="submit" class="btn btn-primary btn-sm">Add New User</button></a></center><br>
        <center><a href="AddMembers.jsp"><button type="submit" class="btn btn-primary btn-sm">Add Team Members</button></a></center>
					</div>
				</div>
			</div>
			
		</div>
            
	</div>
	<footer id="footer" role="contentinfo">
		<div class="container">
			<div class="row row-bottom-padded-sm">
				<div class="col-md-12">
					<p class="copyright text-center">&copy;  <a href="index.html">KACST ECP 2017</a>. All Rights Reserved. <br> </p>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12 text-center">
					<ul class="social social-circle">
						<li><a href="#"><i class="icon-twitter"></i></a></li>
						<li><a href="#"><i class="icon-facebook"></i></a></li>
						<li><a href="#"><i class="icon-youtube"></i></a></li>
						<li><a href="#"><i class="icon-pinterest"></i></a></li>
						<li><a href="#"><i class="icon-linkedin"></i></a></li>
						<li><a href="#"><i class="icon-instagram"></i></a></li>
						<li><a href="#"><i class="icon-dribbble"></i></a></li>
						
					</ul>
				</div>
			</div>
		</div>

	</footer>
	
 <%}
catch (Exception e) {
e.printStackTrace();
} %>
	
	<!-- jQuery -->
	<script src="js/jquery.min.js"></script>
	<!-- jQuery Easing -->
	<script src="js/jquery.easing.1.3.js"></script>
	<!-- Bootstrap -->
	<script src="js/bootstrap.min.js"></script>
	<!-- Waypoints -->
	<script src="js/jquery.waypoints.min.js"></script>
	<!-- Owl Carousel -->
	<script src="js/owl.carousel.min.js"></script>

	<!-- For demo purposes only styleswitcher ( You may delete this anytime ) -->
	<script src="js/jquery.style.switcher.js"></script>
	<script>
	$(function(){
		$('#colour-variations ul').styleSwitcher({
			defaultThemeId: 'theme-switch',
			hasPreview: false,
			cookie: {
	          	expires: 30,
	          	isManagingLoad: true
	      	}
		});	
		$('.option-toggle').click(function() {
			$('#colour-variations').toggleClass('sleep');
		});
	});
        $('#read').click(function(){
        $('#vision').toggle();
        });
	</script>
	<!-- End demo purposes only -->

	<!-- Main JS (Do not remove) -->
	<script src="js/main.js"></script>

	</body>
</html>

