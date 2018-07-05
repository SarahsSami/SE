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

	</head>
	<body>
  
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
	
 <!-- Product And Services Sec -->
	<div id="fh5co-press" data-section="Services">
		<div class="container">
			<div class="row">
                            
				<div class="col-md-12 section-heading text-center">
					<h2 class="single-animate animate-press-1">Add Team Members </h2>
					<div class="row">
						<div class="col-md-8 col-md-offset-2 subtext single-animate animate-press-2">
						<center>
             
<form action="add_member" method="post">
    <table width="600" style="border:none;">
        <tr>
            <th>SELECT TEAM MEMBERS ::</th>
        </tr>
  <tr>
      <th style="font-family: Verdana;"><u>TEAM LEADER ID:</u></th>
      <th style=" font-family: Verdana;"><u>EMPLOYEE ID:</u></th>
  
      <th style=" font-family: Verdana;"><u></u></th>
  </tr>
   <%
try
{

String sql = "SELECT * FROM teamleader ";
ps = con.prepareStatement(sql);
ResultSet rs = ps.executeQuery(); 
 while(rs.next())
{
String tid = rs.getString("tl_id"); 
String eid = rs.getString("emp_id"); 
%>
 <tr>
      <td> <%=tid%></td>
      <td><%=eid%></td>
  </tr>
<% } %>
<%
}
catch(SQLException sqe)
{ 
out.println(sqe);
}
%>
  
    </table>
  <br><br><br>
  
  
    <%
    try
{

String sql = "SELECT * FROM users WHERE UserType='emp' AND emp_type='Team Leader';";
ps = con.prepareStatement(sql);
ResultSet rs = ps.executeQuery(); 
%>

             <select name="teamleader">
<% 
    while(rs.next())
{
String name = rs.getString("Name");
String tid = rs.getString("ID");
%>
 <option value="<%=tid %>"><%=name %> ( <%=tid %> )</option> 
<% } %>
<%
}
catch(SQLException sqe)
{ 
out.println(sqe);
}
%>
 </select>
  <%
    try
{

String sql = "SELECT * FROM users WHERE UserType='emp' AND emp_type='Employee' || emp_type='Team Leader';";
ps = con.prepareStatement(sql);
ResultSet rss = ps.executeQuery(); 
%>
  <select name="employee">
<% 
    while(rss.next())
{
String name = rss.getString("Name");
String eid = rss.getString("ID");
%>
 <option value="<%=eid %>"><%=name %> ( <%=eid %> )</option> 
<% } %>
<%
}
catch(SQLException sqe)
{ 
out.println(sqe);
}
%>
  </select> 
  <br>
  <br>
  
<input type="submit" value="Add+"/>
</form>

</center>	
						</div>
                                            <br>

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

