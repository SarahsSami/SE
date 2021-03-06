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

      

	
	
 <!-- Product And Services Sec -->
	<div id="fh5co-press" data-section="Services">
		<div class="container">
			<div class="row">
                            
                            
				<div class="col-md-12 section-heading text-center">
					<h2 class="single-animate animate-press-1">Add user </h2>
					<div class="row">
						<div class="col-md-8 col-md-offset-2 subtext single-animate animate-press-2">
							
						</div>
                                            <br>
                                                                                           <br>
       <div class="form-area">  
        <form role="form" action="addUser" method="post">
        <br style="clear:both">
    				<div class="form-group">
                                    <label style="float: left;"><b>User name</b></label>
						<input type="text" class="form-control" id="name" name="name" placeholder="Name" required >
					</div>
                                        <div class="form-group">
                                                <label style="float: left;"><b>Password</b></label>
						<input type="password" class="form-control" id="subject" name="pass" placeholder="password" required >
					</div>
					<div class="form-group" >
                                            <label style="float: left;"><b>Email</b></label>
						<input type="email" class="form-control" id="email" name="email" placeholder="Email" required >
					</div>
            
     <label style="float: left;"><b>User Type</b></label> <br>
   <select class="form-control" id="mySelect" name="user"  onChange="selectChange(this.value)">
<option   value="service" class="dropdown-header" >Type</option>
<option  value="admin">Admin</option>
<option  value="emp">Employee </option>
<option  value="Team Leader">Team Leader</option>
<option  value="coor">Coordinator</option>
<option  value="spcust">Special Customer</option>
</select>  

        <br>

 <label id="lab" style="visibility:hidden; float: left;"><b>Coordinator</b></label>
 <br>
<select class="form-control" id="grp" name="task_select" style="visibility:hidden;">
<option value="task" class="dropdown-header">Services</option>
<option value="CRM">CRM</option>
<option value="KM">KM</option>
<option value="PLM">PLM</option>
<option value="CDPO">CDPO Officer</option>
<option value="evaluation">Evaluation</option>
<option value="Ideas bank">Ideas bank</option>
<option value="page" class="dropdown-header">Pages</option>
<option value="article">Articles</option>
<option value="news">News & Events</option>
<option value="products">Products & Services</option>
<option value="career">HR</option>
<option value="about">About us</option>
<option value="contact">Contact</option>
</select>   <br/>
        
   <center><button type="submit" class="btn btn-primary btn-sm">Submit</button></center>
        </form>
    </div>
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
    function selectChange(val) {
    //Set the value of action in action attribute of form element.
    //Submit the form
    if(val==="coor")
    {
       document.getElementById("grp").style.visibility='visible';
              document.getElementById("lab").style.visibility='visible';

    }else
    {
              document.getElementById("grp").style.visibility='hidden';
              document.getElementById("lab").style.visibility='hidden'; 
    }
}
	</script>
	<!-- End demo purposes only -->

	<!-- Main JS (Do not remove) -->
	<script src="js/main.js"></script>

	
	</body>
</html>

