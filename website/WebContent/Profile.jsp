<%-- <%-- 
    Document   : Profile
    Created on : Sep 12, 2017, 9:15:31 AM
    Author     : waveform3



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
                <%
    //to display the ideas from database to ideas bank 
String driverName = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String dbName = "marketing";
String userId = "root";
String password = "";
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
String sql = "SELECT * FROM marketing.users where ID ="+user;
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
                <li><a href="index.html">Home</a></li>
                <li><a href="Profile.jsp">Profile </a></li>
                <% if(resultSet.getString("UserType").equals("admin")) {
                    %>
                <li><a href="usersPanel.jsp">Users</a></li>
                <li><a href="Articles.jsp">Edit Articales</a></li>
                <%}%>
             </ul>
            <ul class="nav navbar-nav navbar-right">
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        <span class="glyphicon glyphicon-user"></span> 
                        <strong><%=session.getAttribute("name")%></strong>
                        <span class="glyphicon glyphicon-chevron-down"></span>
                    </a>
                        
                        
                    <ul class="dropdown-menu">
                        <li><a href="EditInfo.jsp ">Edit profile </a></li>
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
					<h2 class="single-animate animate-press-1">Services</h2>
					<div class="row">
						<div class="col-md-8 col-md-offset-2 subtext single-animate animate-press-2">
							<h4>What we've done for people.</h4>
							<h3>--Business skills--</h3>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-6">
					<!-- Press Item 1 -->
					<div class="fh5co-press-item to-animate">
						<div class="fh5co-press-img" style="background-image: url(images/CRM.jpg) ">
						</div>
						<div class="fh5co-press-text">
							<h3 class="h2 fh5co-press-title">CRM<span class="fh5co-border"></span></h3>
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Veritatis eius quos similique suscipit dolorem cumque vitae qui molestias illo accusantium...</p>
							<p><a href="#" class="btn btn-primary btn-sm">Open</a></p>
						</div>
					</div>
					<!-- Press Item -->
				</div>
<div class="col-md-6">
					<!-- Press Item 1 -->
					<div class="fh5co-press-item to-animate">
						<div class="fh5co-press-img" style="background-image: url(images/idea-bank.jpg)">
						</div>
						<div class="fh5co-press-text">
							<h3 class="h2 fh5co-press-title">Ideas Bank<span class="fh5co-border"></span></h3>
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Veritatis eius quos similique suscipit dolorem cumque vitae qui molestias illo accusantium...</p>
							<p><a href="ideabank1.jsp" class="btn btn-primary btn-sm">Open</a></p>
						</div>
					</div>
					<!-- Press Item -->
				</div>
                            
                            <!-- SE link -->
                            <div class="col-md-6">
					<!-- Press Item 1 -->
					<div class="fh5co-press-item to-animate">
						<div class="fh5co-press-img" style="background-image: url(images/logo.png)">
						</div>
						<div class="fh5co-press-text">
							<h3 class="h2 fh5co-press-title">SE<span class="fh5co-border"></span></h3>
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Veritatis eius quos similique suscipit dolorem cumque vitae qui molestias illo accusantium...</p>
							<p><a href="indexPM.jsp" class="btn btn-primary btn-sm">Open</a></p>
						</div>
					</div>
					<!-- Press Item -->
				</div>
  <% if(!resultSet.getString("UserType").equals("spcust")) {
                    %>
				<div class="col-md-6">
					<!-- Press Item 2 -->
					<div class="fh5co-press-item to-animate">
						<div class="fh5co-press-img" style="background-image: url(images/km-.png)">
						</div>
						<div class="fh5co-press-text">
							<h3 class="h2 fh5co-press-title">Knowledge Management  <span class="fh5co-border"></span></h3>
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Veritatis eius quos similique suscipit dolorem cumque vitae qui molestias illo accusantium...</p>
							<p><a href="#" class="btn btn-primary btn-sm">Open</a></p>
						</div>
					</div>
					<!-- Press Item -->
				</div>
				
				<div class="col-md-6">
					<!-- Press  Item  3 -->
					<div class="fh5co-press-item to-animate">
						<div class="fh5co-press-img" style="background-image: url(images/plm2.png);">
						</div>
						<div class="fh5co-press-text">
							<h3 class="h2 fh5co-press-title">PLM <span class="fh5co-border"></span></h3>
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Veritatis eius quos similique suscipit dolorem cumque vitae qui molestias illo accusantium...</p>
							<p><a href="#" class="btn btn-primary btn-sm">Open</a></p>
						</div>
					</div>
					<!-- Press Item -->
				</div>

				<div class="col-md-6">
					<!-- Press  Item 4-->
					<div class="fh5co-press-item to-animate">
						<div class="fh5co-press-img" style="background-image: url(images/cdp.png);">
						</div>
						<div class="fh5co-press-text">
							<h3 class="h2 fh5co-press-title">CDP<span class="fh5co-border"></span></h3>
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Veritatis eius quos similique suscipit dolorem cumque vitae qui molestias illo accusantium...</p>
                                                        <%if(resultSet.getString("emp_type").equals("CDPO")){ %>
							<p><a href="cdpoUI.jsp" class="btn btn-primary btn-sm">Open</a></p>
                                                        <% } else if(resultSet.getString("emp_type").equals("Team Leader")) {%>
							<p><a href="teaml1.jsp" class="btn btn-primary btn-sm">Open</a></p>
<%} else if(resultSet.getString("emp_type").equals("Employee")) {%>
							<p><a href="comvision.jsp" class="btn btn-primary btn-sm">Open</a></p>
<%}%>

						</div>
					</div>
					<!-- Press Item -->
				</div>
   <%}%>
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

 --%> 
 
<!-- 

Document: index , is the home page of the website
Author: ADWA Alqahtani
Input: HTML CODE , css code , 
Output: the website interface and its pages 

-->
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->

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
	   <%
    //to display the ideas from database to ideas bank 
String driverName = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String dbName = "marketing";
String userId = "root";
String password = "";
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
String sql = "SELECT * FROM marketing.users where ID ="+user;
resultSet = statement.executeQuery(sql);
resultSet.next();
%>
	<header role="banner" id="fh5co-header">
			<div class="container">
				<!-- <div class="row"> -->
			    <nav class="navbar navbar-default">
		        <div class="navbar-header">
		        	<!-- Mobile Toggle Menu Button -->
					<a href="#" class="js-fh5co-nav-toggle fh5co-nav-toggle" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar"><i></i></a>
		          	<a class="navbar-brand" href="index.html"><img src="C:\Users\user\Desktop\Good\images\1.png "    width="100PX" ></a> 
		        </div>
		        <div id="navbar" class="navbar-collapse collapse">
		          <ul class="nav navbar-nav navbar-right">
		        
		            <li class="active"><a href="#" data-nav-section="home"><span>Home</span></a></li>
                    <li><a href="#" data-nav-section="about"><span>About Us</span></a></li>
		            <li><a href="#" data-nav-section="News And Events"><span>News And Events</span></a></li>
                            <li><a href="#" data-nav-section="Articles"><span>Articles</span></a></li>
		            <li><a href="#" data-nav-section="Product And Services"><span>Product And Services</span></a></li>
                            <li><a href="#" data-nav-section="Career"><span>Career</span></a></li>
		            <li><a href="#" data-nav-section="Review"><span>Review</span></a></li>
		            <li><a href="#" data-nav-section="Contact Us"><span>Contact Us</span></a></li>
		          <li><a  href="#" data-nav-section="Profile" ><span>Profile</span></a></li>                       



		          </ul>
		           <ul class="nav navbar-nav navbar-right">
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        <span class="glyphicon glyphicon-user"></span> 
                        <strong><%=session.getAttribute("name")%></strong>
                        <span class="glyphicon glyphicon-chevron-down"></span>
                    </a>
                        
                        
                    <ul class="dropdown-menu" >
                      <% if(resultSet.getString("UserType").equals("admin")) {
                    %>
                <li><a href="usersPanel.jsp">Users</a></li>
                <%}%>
                        <li><a href="EditInfo.jsp ">Edit profile </a></li>

                        <li><a href="Logout.jsp">Sign out</a></li>
                    </ul>
                </li>
            </ul>
		        </div>
			    </nav>



			  <!-- </div> -->
		  </div>
	</header>

	<div id="slider" data-section="home">
		<div class="owl-carousel owl-carousel-fullwidth">
			<!-- You may change the background color here. -->
	              <div class="item" style="background: #85a3bf;"><!-- original color #352f44; -->
	    		    	<div class="container" style="position: relative;">
		    		<div class="row">
					    <div class="col-md-7 col-sm-7">
			    			<div class="fh5co-owl-text-wrap">
						    	<div class="fh5co-owl-text">
						    		<h1 class="fh5co-lead to-animate">ECP Waveform National Team  Here are the SPECIAL devices !</h1>
									<h2 class="fh5co-sub-lead to-animate">It is part of the King Abdulaziz City for Science and Technology at <a href="https://www.kacst.edu.sa/eng"  target="_blank">https://www.kacst.edu.sa/eng</a></h3>
									<p class="to-animate-2"><a href="#" class="btn btn-primary btn-lg">View Case Study</a></p>
						    	</div>
						    </div>
					    </div>
					    <div class="col-md-4 col-md-push-1 col-sm-4 col-sm-push-1 iphone-image">
					    	<div class="iphone to-animate-2"><img src="images/iphone-2.png" alt="Free HTML5 Template by FREEHTML5.co"></div>
					    </div>

		    		</div>
		    	</div>
		    </div>
			<!-- You may change the background color here.  -->
		    <div class="item" style="background: #38569f;">
		    	<div class="container" style="position: relative;">
		    		<div class="row">
		    			<div class="col-md-7 col-md-push-1 col-md-push-5 col-sm-7 col-sm-push-1 col-sm-push-5">
			    			<div class="fh5co-owl-text-wrap">
						    	<div class="fh5co-owl-text">
						    		<h1 class="fh5co-lead to-animate">CONTACT US</h1>
									<h2 class="fh5co-sub-lead to-animate">King Abdulaziz City for Science and Technology Kingdom of Saudi Arabia <br>Phone: 0966114883555 - 00966114883444

<br>KACST is located in the northern area of Riyadh, about 40 km away from King Khalid International Airport, on King Abdullah Road (West.) West of KACST is the campus of King Saud University.The main entrance is located on Prince Turkey Bin Abdulaziz (the First).
<a href="http://freehtml5.co/" target="_blank"> </a></h3>
									<p class="to-animate-2"><a href="#" class="btn btn-primary btn-lg" data-nav-section="Contact Us">Emailing Us !</a></p>
                                                            
						    	</div>
						    </div>
					    </div>
					    <div class="col-md-4 col-md-pull-7 col-sm-4 col-sm-pull-7 iphone-image">
					    	<div class="iphone to-animate-2"><img src="images/email.jpg" alt="Free HTML5 Template by FREEHTML5.co"></div>
					    </div>

		    		</div>
		    	</div>
		    </div>

		    <div class="item" style="background-image:url(images/slide_5.jpg)">
		    	<div class="overlay"></div>
		    	<div class="container" style="position: relative;">
		    		<div class="row">
		    			<div class="col-md-8 col-md-offset-2 text-center">
		    				<div class="fh5co-owl-text-wrap">
						    	<div class="fh5co-owl-text">
		    						<h1 class="fh5co-lead to-animate">Be a Part Of Our Amazing team !</h1>
									
									<p class="to-animate-2"><a href="career.html"  class="btn btn-primary btn-lg">Job Application</a></p>
								</div>
							</div>
		    			</div>
		    		</div>
		    	</div>
		    </div>

		</div>
	</div>
	
	<!-- About us page -->
	<div id="fh5co-about-us" data-section="about">
		<div class="container">
			<div class="row row-bottom-padded-lg" id="about-us">
				<div class="col-md-12 section-heading text-center">
					<h2 class="to-animate">About Us</h2>
                                        <div class="col-md-8 col-md-offset-2 to-animate">
							<h3>The King Abdulaziz City for Science and Technology (KACST) is a scientific government institution that supports and enhances scientific applied research.</h3>
						</div>
                                </div>
					<div class="row">
						
                                            		<div class="col-md-12  text-center to-animate">
					<h2>How we got started</h2>
					<p>The King Abdulaziz City for Science and Technology (KACST) is Saudi Arabia’s national science agency and home to its advanced laboratories. To help achieve the Kingdom’s shift towards a knowledge-based economy, KACST is promoting the development and investment in the national system of science, technology and innovation, by orienting research outputs towards industrial diversification. </p>
					<p>The King Abdulaziz City for Science and Technology (KACST) is a scientific government institution that supports and enhances scientific applied research. It coordinates the activities of government institutions and scientific research centers in accordance with the requirements of the development of the Kingdom. It also cooperates with the relevant authorities in identifying national priorities and policies in technology and science so as to build a scientific and technological basis that serves development in agriculture, industry</p>				
                                </div>
				<div class="col-md-12"  >
					<div class="row row-bottom-padded-lg">
						<div class="col-md-6 text-center to-animate">
							 <div class="person">


								<img src="images/ad.png"   class="img-responsive img-rounded" alt="Person" >
								<h3 class="name">vission and Mission</h3>
								<div class="position">______________________</div>
								<p>The King Abdulaziz City for Science and Technology (KACST) is a scientific government institution that supports and enhances scientific applied research. It coordinates the activities of government institutions and scientific research centers in accordance with the requirements of the development of the Kingdom.</p>
								<p><a id="read" class="btn btn-primary">Read More</a></p> 
							</div>
						</div>
						<div class="col-md-6 text-center to-animate">
							<div class="person">
								<img src="images/str.jpg" class="img-responsive img-rounded" alt="Person" >
								<h3 class="name">organizational structure</h3>
								<div class="position">________________________</div>
								<p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. Separated they live in Bookmarksgrove right at the coast of the Semantics.</p>
								<p><a href="STRUCT.pdf" class="btn btn-primary">View structure</a></p> 
							</div>
						</div>
	
					</div>
				</div>
                                            <div id="vision" style="display: none;">
                                        <div class="col-md-4 col-sm-6">
					<div class="price-box to-animate">
                                        <div class="col-md-12  text-center to-animate">
					<h2>Vision</h2>
                                    	<hr>
                                        </div>
				        <p class="pricing-info">
					To be a world-class organization in science and technology, fostering innovation and promoting a knowledge-based society in the Kingdom of Saudi Arabia.
						</p>
					</div>
				</div>
				<div class="col-md-4 col-sm-6">
				<div class="price-box to-animate">
			        <div class="col-md-12  text-center to-animate">
				<h2>Mission</h2>
                                <hr>
                                </div>
                                <p class="pricing-info">
The city works on the development and investment in the national system of science, technology and innovation, to promote the building of a knowledge-based 
society, which will serve the sustainable development of the Kingdom through the following functions and responsibilities:						</p>
						<ul class="pricing-info">
							<li> Formulating policies and national plans for science, technology and innovation.</li>
							<li> Coordinating national activities in science, technology and innovation</li>
							<li> Providing support to scientific research and technological development in the Kingdom</li>
							<li> Conducting applied scientific research and technological development </li>
							<li> Developing and strengthening cooperation and local, regional, and international partnerships for technology transfer and development </li>
                                                        <li> Investing in technology development and its commercial processing </li>
							<li> Sponsorship, promoting and investing in intellectual property</li>
                                                        <li> Providing advice and innovative solution</li>
						</ul>
					</div>
				</div>
				<div class="col-md-4 col-sm-6">
					<div class="price-box to-animate">
				        <div class="col-md-12  text-center to-animate">
					<h2>Values</h2>
                                    	<hr>
                                        </div>
						<ul class="pricing-info">
							<li> Integrity </li>
							<li> Loyalty </li>
							<li> Respect and appreciation showed to staff members </li>
							<li> Community service </li>
							<li> Endless Support</li>
                                                        <li> Excellence </li>
							<li> Teamwork</li>
                                                        <li> Transparency </li>
						</ul>
					</div>
				</div>
				 </div>
                                            
					</div>

			</div> 
	
		</div>
	</div>

<!--  News And Events sec -->

	<div id="fh5co-testimonials" data-section="News And Events">		
		<div class="container">
			<div class="row">
				<div class="col-md-12 section-heading text-center">
					<h2 class="to-animate"> News And Events...</h2>
					<div class="row">
						<div class="col-md-8 col-md-offset-2 subtext to-animate">
							<h3>FOLLOW up with our events and news !...</h3>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-4">
					<div class="box-testimony to-animate">
						<blockquote>
							<span class="quote"><span><i class="icon-quote-left"></i></span></span>
							<p>&ldquo;Phasellus eget enim eu lectus faucibus vestibulum. Suspendisse sodales pellentesque elementum. Phasellus eget enim eu lectus faucibus vestibulum. Suspendisse sodales pellentesque elementum Phasellus eget enim eu lectus faucibus vestibulum. Suspendisse sodales pellentesque elementum sodales pellentesque elementum &rdquo;</p>
						</blockquote>
						<p class="author">Dr. John Doe <span class="subtext">CEO & Founder</span>

                           
<!-- First button -->
<button onclick="document.getElementById('id01').style.display='block'" style="width:auto;">  <a ><i class="icon-picture-o"></i></a> 
    </button>


<div id="id01" class="modal">
  
  <form class="modal-content animate" action="/action_page.php">
    <div class="imgcontainer">
      <span onclick="document.getElementById('id01').style.display='none'" class="close" title="Close Modal">&times;</span>
      <img src="images/(1).jpg" alt="Avatar" >
    </div>

   
  </form>
</div>

<script>
// Get the modal
var modal = document.getElementById('id01');

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
    if (event.target == modal) {
        modal.style.display = "none";
    }
}
</script>
<!-- Last button -->
 </p>




					</div>      
					
				</div>
				<div class="col-md-4">
					<div class="box-testimony to-animate">
						<blockquote>
							<span class="quote"><span><i class="icon-quote-left"></i></span></span>
							<p>&ldquo;Phasellus eget enim eu lectus faucibus vestibulum. Suspendisse sodales pellentesque elementum.&rdquo;</p>
						</blockquote>
						<p class="author">Eng. Anja Doe </br> <span class="subtext">Art Director</span>


       <!-- first button -->

<button onclick="document.getElementById('id01').style.display='block'" style="width:auto;">  <a ><i class="icon-picture-o"></i></a> 
    </button>


<div id="id01" class="modal">
  
  <form class="modal-content animate" action="/action_page.php">
    <div class="imgcontainer">
      <span onclick="document.getElementById('id01').style.display='none'" class="close" title="Close Modal">&times;</span>
      <img src="images/(2).jpg" alt="Avatar" >
    </div>

   
  </form>
</div>

<script>
// Get the modal
var modal = document.getElementById('id01');

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
    if (event.target == modal) {
        modal.style.display = "none";
    }
}
</script>
 <!-- Last button -->
 </p>

			</div>
				</div>
				<div class="col-md-4">
					<div class="box-testimony to-animate">
						<blockquote>
							<span class="quote"><span><i class="icon-quote-left"></i></span></span>
							<p>&ldquo;Phasellus eget enim eu lectus faucibus vestibulum. Suspendisse sodales pellentesque elementum.&rdquo;</p>
						</blockquote>
						<p class="author">Mr. Mike Ross  <span class="subtext">Web Designer</span>

 <!-- first button -->

<button onclick="document.getElementById('id01').style.display='block'" style="width:auto;">  <a ><i class="icon-picture-o"></i></a> 
    </button>


<div id="id01" class="modal">
  
  <form class="modal-content animate" action="/action_page.php">
    <div class="imgcontainer">
      <span onclick="document.getElementById('id01').style.display='none'" class="close" title="Close Modal">&times;</span>
      <img src="images/(3).jpg" alt="Avatar" >
    </div>

   
  </form>
</div>

<script>
// Get the modal
var modal = document.getElementById('id01');

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
    if (event.target == modal) {
        modal.style.display = "none";
    }
}
</script>
 <!-- Last button -->
						</p>
					</div>
					
				</div>
                          <div class="col-md-4">
					<div class="box-testimony to-animate">
						<blockquote>
							<span class="quote"><span><i class="icon-quote-left"></i></span></span>
							<p>&ldquo;Phasellus eget enim eu lectus faucibus vestibulum. Suspendisse sodales pellentesque elementum.&rdquo;</p>
						</blockquote>
						<p class="author">Dr.Turki AlSaud <span class="subtext">KACST manager</span>
 <!-- first button -->

<button onclick="document.getElementById('id01').style.display='block'" style="width:auto;">  <a ><i class="icon-picture-o"></i></a> 
    </button>


<div id="id01" class="modal">
  
  <form class="modal-content animate" action="/action_page.php">
    <div class="imgcontainer">
      <span onclick="document.getElementById('id01').style.display='none'" class="close" title="Close Modal">&times;</span>
      <img src="images/(4).jpg" alt="Avatar" >
    </div>

   
  </form>
</div>

<script>
// Get the modal
var modal = document.getElementById('id01');

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
    if (event.target == modal) {
        modal.style.display = "none";
    }
}
</script>
 <!-- Last button -->

						</p>
					</div>
					
				</div>

				 <div class="col-md-4">
					<div class="box-testimony to-animate">
						<blockquote>
							<span class="quote"><span><i class="icon-quote-left"></i></span></span>
							<p>&ldquo;Phasellus eget enim eu lectus faucibus vestibulum. Suspendisse sodales pellentesque elementum.&rdquo;</p>
						</blockquote>
						<p class="author">Dr.Turki AlSaud<span class="subtext">KACST manager</span>

 <!-- first button -->

<button onclick="document.getElementById('id01').style.display='block'" style="width:auto;">  <a ><i class="icon-picture-o"></i></a> 
    </button>


<div id="id01" class="modal">
  
  <form class="modal-content animate" action="/action_page.php">
    <div class="imgcontainer">
      <span onclick="document.getElementById('id01').style.display='none'" class="close" title="Close Modal">&times;</span>
      <img src="images/(3).jpg" alt="Avatar" >
    </div>

   
  </form>
</div>

<script>
// Get the modal
var modal = document.getElementById('id01');

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
    if (event.target == modal) {
        modal.style.display = "none";
    }
}
</script>
 <!-- Last button -->

						</p>
					</div>
					
				</div>





			</div>
		</div>
	</div>
            <!-- Articles-->
	<div id="fh5co-pricing" data-section="Articles">
		<div class="container">
			<div class="row">
				<div class="col-md-12 section-heading text-center">
					<h2 class="single-animate animate-pricing-1">Articles</h2>
					<div class="row">
						<div class="col-md-8 col-md-offset-2 subtext single-animate animate-pricing-2">
							<h3>Choose a pricing plan that fits your needs ..</h3>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
                            
                                <div class="w3-col m6">
      <h3 style="color:red">Business skills</h3>
      <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore tempor incididunt ut labore et dolore tempor incididunt ut labore et dolore<br>
      tempor incididunt ut labore et dolore.tempor incididunt ut labore et dolore tempor incididunt ut labore et dolore</p>
      <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore tempor incididunt ut labore et dolore<br>
      tempor incididunt ut labore et dolore. tempor incididunt ut labore et dolore tempor incididunt ut labore et dolore</p>
    </div>
    <div class="w3-col m6">
      <p class="w3-wide"><i class="fa fa-camera w3-margin-right"></i>Photography</p>
      <div class="w3-progress-container w3-grey">
        <div class="w3-progressbar w3-dark-grey" style="width:90%"></div>
      </div>
    
      <p class="w3-wide"><i class="fa fa-camera w3-margin-right"></i>Marketing</p>
    </div>
      <p class="w3-wide"><i class="fa fa-desktop w3-margin-right"></i>Web Design</p>
      <div class="w3-progress-container w3-grey">
        <div class="w3-progressbar w3-dark-grey" style="width:85%"></div>
      </div>
      <p class="w3-wide"><i class="fa fa-photo w3-margin-right"></i>Photoshop</p>
      <div class="w3-progress-container w3-grey">
        <div class="w3-progressbar w3-dark-grey" style="width:75%"></div>
      </div>
      
            <!-- user Comment on article -->
 <div id="HCB_comment_box"><a href="http://www.htmlcommentbox.com"></a> is loading comments...</div>

 <link rel="stylesheet" type="text/css" href="http://www.htmlcommentbox.com/static/skins/default/skin.css" />
 <script type="text/javascript" language="javascript" id="hcb"> /*<!--*/ if(!window.hcb_user){hcb_user={  };} (function(){s=document.createElement("script");s.setAttribute("type","text/javascript");s.setAttribute("src", "http://www.htmlcommentbox.com/jread?page="+escape((window.hcb_user && hcb_user.PAGE)||(""+window.location)).replace("+","%2B")+"&opts=470&num=10");if (typeof s!="undefined") document.getElementsByTagName("head")[0].appendChild(s);})(); /*-->*/ </script>
  	
			</div>
		</div>
	</div>
 <!-- Product And Services Sec -->
	<div id="fh5co-press" data-section="Product And Services">
		<div class="container">
			<div class="row">
				<div class="col-md-12 section-heading text-center">
					<h2 class="single-animate animate-press-1">Product And Services</h2>
					<div class="row">
						<div class="col-md-8 col-md-offset-2 subtext single-animate animate-press-2">
							<h4>What we've done for people.</h4>
							<h3>--Business skills--</h3>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-6">
					<!-- Press Item 1 -->
					<div class="fh5co-press-item to-animate">
						<div class="fh5co-press-img" style="background-image: url(images/potography.jpg)">
						</div>
						<div class="fh5co-press-text">
							<h3 class="h2 fh5co-press-title">potography<span class="fh5co-border"></span></h3>
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Veritatis eius quos similique suscipit dolorem cumque vitae qui molestias illo accusantium...</p>
							<p><a href="#" class="btn btn-primary btn-sm">Read more</a></p>
						</div>
					</div>
					<!-- Press Item -->
				</div>

				<div class="col-md-6">
					<!-- Press Item 2 -->
					<div class="fh5co-press-item to-animate">
						<div class="fh5co-press-img" style="background-image: url(images/Markting.jpg)">
						</div>
						<div class="fh5co-press-text">
							<h3 class="h2 fh5co-press-title">Markting <span class="fh5co-border"></span></h3>
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Veritatis eius quos similique suscipit dolorem cumque vitae qui molestias illo accusantium...</p>
							<p><a href="#" class="btn btn-primary btn-sm">Read more</a></p>
						</div>
					</div>
					<!-- Press Item -->
				</div>
				
				<div class="col-md-6">
					<!-- Press  Item  3 -->
					<div class="fh5co-press-item to-animate">
						<div class="fh5co-press-img" style="background-image: url(images/Design.jpg);">
						</div>
						<div class="fh5co-press-text">
							<h3 class="h2 fh5co-press-title">Web Design <span class="fh5co-border"></span></h3>
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Veritatis eius quos similique suscipit dolorem cumque vitae qui molestias illo accusantium...</p>
							<p><a href="#" class="btn btn-primary btn-sm">Read more</a></p>
						</div>
					</div>
					<!-- Press Item -->
				</div>

				<div class="col-md-6">
					<!-- Press  Item 4-->
					<div class="fh5co-press-item to-animate">
						<div class="fh5co-press-img" style="background-image: url(images/Photo.jpg);">
						</div>
						<div class="fh5co-press-text">
							<h3 class="h2 fh5co-press-title">Photoshop <span class="fh5co-border"></span></h3>
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Veritatis eius quos similique suscipit dolorem cumque vitae qui molestias illo accusantium...</p>
							<p><a href="#" class="btn btn-primary btn-sm">Read more</a></p>
						</div>
					</div>
					<!-- Press Item -->
				</div>

			</div>
		</div>
            
	</div>
		     <!-- Career -->
	<div id="fh5co-pricing" data-section="Career">
		<div class="container">
			<div class="row">
				<div class="col-md-12 section-heading text-center">
					<h2 class="single-animate animate-pricing-1">Career</h2>
					<div class="row">
						<div class="col-md-8 col-md-offset-2 subtext single-animate animate-pricing-2">
							<h3> ..</h3>
						</div>
                                                <div class="form-area">  
        <form role="form" action="">
        <br style="clear:both">
    				<div class="form-group">
						<input type="text" class="form-control" id="name" name="name" placeholder="First Name" required> 
					</div>
        <div class="form-group">
						<input type="text" class="form-control" id="name" name="name" placeholder="Last Name" required> 
					</div>
					<div class="form-group">
						<input type="text" class="form-control" id="email" name="email" placeholder="Email" required>
					</div>
					<div class="form-group">
						<input type="text" class="form-control" id="subject" name="phone" placeholder="phone" required>
					</div>
        <div class="form-group">
            <input type="text" class="form-control" id="subject" name="Position" placeholder="Position you are applying for" required>
					</div>
        <div class="form-group">
            <div style="float: left;">Resume upload<br/></div>
<input id="data_9" name="data_9"  type="file" class="form-control"/>
</div>
						 <div class="form-group"><input type="text" class="form-control" id="subject" name="Portfolio" placeholder="Portfolio website" required>
					</div>
        <div class="form-group">
						<input type="date" class="form-control" id="subject" name="date" placeholder="When can you start?" required>
					</div>
        <div class="form-group">
						<input type="text" class="form-control" id="subject" name="company" placeholder="Last company you worked for" required>
					</div>
                    <div class="form-group">
                    <textarea class="form-control" type="textarea" id="message" placeholder="Comments" maxlength="140" rows="7"></textarea>
                    </div>
            <br/>
        <button type="button" id="submit" name="submit" class="btn btn-primary btn-sm pull-right">Send</button>
        </form>
    </div>
					</div>
				</div>
			</div>
			<div class="row">
		
			
				<div class="clearfix visible-sm-block"></div>
			

			</div>
		</div>
	</div>
	     <!-- Review -->
	<div id="fh5co-pricing" data-section="Review">
		<div class="container">
			<div class="row">
				<div class="col-md-12 section-heading text-center">
					<h2 class="single-animate animate-pricing-1">Review</h2>
					<div class="row">
						<div class="col-md-8 col-md-offset-2 subtext single-animate animate-pricing-2">
							<h3>..</h3>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="clearfix visible-sm-block"></div>
			 <br/>
<h3>Ratings</h3><!-- start Star Ratings -->
<!-- end Star Ratings -->
				<script data-sil-id='58b404e8ada70b001a776049'> (function() {var d = document, w = window, l = window.location,p = l.protocol == 'file:' ? 'http://' : '//';if (!w.WS) w.WS = {}; c = w.WS;var m=function(t, o){  var e = d.getElementsByTagName('script'); e=e[e.length-1];  var n = d.createElement(t); if (t=='script') {n.async=true;} for (k in o) n[k] = o[k];  e.parentNode.insertBefore(n, e)};   m('script', {      src: p+'bawkbox.com/widget/star-rating/58b404e8ada70b001a776049?page='+encodeURIComponent(l+''),      type: 'text/javascript'  });  c.load_net = m;})();</script><div class='sil-widget-star-rating sil-widget' id='sil-widget-58b404e8ada70b001a776049'></div>
                                <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
			</div>
		</div>
	</div>
             <!--  Contact Us sec -->

	<div id="fh5co-testimonials" data-section="Contact Us" >		
		<div class="container">
			<div class="row">
				<div class="col-md-12 section-heading text-center">
					<h2 class="to-animate"> Contact Us</h2>
                                  		<div class="col-md-8 col-md-offset-2 subtext to-animate">
                                        <h3>If you have any inquiries, DO NOT hesitate to contact us</h3>
						</div>

				</div>
                                                                    <div class="col-md-12">
    <div class="form-area">  
        <form role="form" action="">
        <br style="clear:both">
    				<div class="form-group">
						<input type="text" class="form-control" id="name" name="name" placeholder="Name" required>
					</div>
					<div class="form-group">
						<input type="text" class="form-control" id="email" name="email" placeholder="Email" required>
					</div>
					<div class="form-group">
						<input type="text" class="form-control" id="subject" name="subject" placeholder="Subject" required>
					</div>
                    <div class="form-group">
                    <textarea class="form-control" type="textarea" id="message" placeholder="Message" maxlength="140" rows="7"></textarea>
                    </div>
            <br/>
        <button type="button" id="submit" name="submit" class="btn btn-white pull-right">Send</button>
        </form>
    </div>
</div>
			</div>

		</div>
	</div>
	
	            <!--  Profile sec -->
	<div id="Profile" data-section="Profile"  >		
	<!-- 	<div class="container"> -->
			<div class="row">
				<div class="col-md-12 section-heading text-center">
					<h2 class="to-animate"> Profile</h2>
                                  		<div class="col-md-8 col-md-offset-2 subtext to-animate">
						</div>

				</div>
                                                                    <div class="col-md-12">
  <div id="fh5co-press" data-section="Services">
		<div class="container">
			<div class="row">
                            
                            
				<div class="col-md-12 section-heading text-center">
					<h2 class="single-animate animate-press-1">Services</h2>
					<div class="row">
						<div class="col-md-8 col-md-offset-2 subtext single-animate animate-press-2">
							<h4>What we've done for people.</h4>
							<h3>--Business skills--</h3>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-6">
					<!-- Press Item 1 -->
					<div class="fh5co-press-item to-animate">
						<div class="fh5co-press-img" style="background-image: url(images/CRM.png) ">
						</div>
						<div class="fh5co-press-text">
							<h3 class="h2 fh5co-press-title">CRM<span class="fh5co-border"></span></h3>
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Veritatis eius quos similique suscipit dolorem cumque vitae qui molestias illo accusantium...</p>
							<p><a href="#" class="btn btn-primary btn-sm">Open</a></p>
						</div>
					</div>
					<!-- Press Item -->
				</div>
<div class="col-md-6">
					<!-- Press Item 1 -->
					<div class="fh5co-press-item to-animate">
						<div class="fh5co-press-img" style="background-image: url(images/IB.png)">
						</div>
						<div class="fh5co-press-text">
							<h3 class="h2 fh5co-press-title">Ideas Bank<span class="fh5co-border"></span></h3>
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Veritatis eius quos similique suscipit dolorem cumque vitae qui molestias illo accusantium...</p>
							<p><a href="ideabank1.jsp" class="btn btn-primary btn-sm">Open</a></p>
						</div>
					</div>
					<!-- Press Item -->
				</div>
                            
                            <!-- SE link -->
                            <div class="col-md-6">
					<!-- Press Item 1 -->
					<div class="fh5co-press-item to-animate">
						<div class="fh5co-press-img" style="background-image: url(images/SE.png)">
						</div>
						<div class="fh5co-press-text">
							<h3 class="h2 fh5co-press-title">SE<span class="fh5co-border"></span></h3>
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Veritatis eius quos similique suscipit dolorem cumque vitae qui molestias illo accusantium...</p>
							<p><a href="indexPM.jsp" class="btn btn-primary btn-sm">Open</a></p>
						</div>
					</div>
					<!-- Press Item -->
				</div>
  <% if(!resultSet.getString("UserType").equals("spcust")) {
                    %>
				<div class="col-md-6">
					<!-- Press Item 2 -->
					<div class="fh5co-press-item to-animate">
						<div class="fh5co-press-img" style="background-image: url(images/KM.png)">
						</div>
						<div class="fh5co-press-text">
							<h3 class="h2 fh5co-press-title">KM<span class="fh5co-border"></span></h3>
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Veritatis eius quos similique suscipit dolorem cumque vitae qui molestias illo accusantium...</p>
							<p><a href="#" class="btn btn-primary btn-sm">Open</a></p>
						</div>
					</div>
					<!-- Press Item -->
				</div>
				
				<div class="col-md-6">
					<!-- Press  Item  3 -->
					<div class="fh5co-press-item to-animate">
						<div class="fh5co-press-img" style="background-image: url(images/PLM.png);">
						</div>
						<div class="fh5co-press-text">
							<h3 class="h2 fh5co-press-title">PLM <span class="fh5co-border"></span></h3>
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Veritatis eius quos similique suscipit dolorem cumque vitae qui molestias illo accusantium...</p>
							<p><a href="#" class="btn btn-primary btn-sm">Open</a></p>
						</div>
					</div>
					<!-- Press Item -->
				</div>

				<div class="col-md-6">
					<!-- Press  Item 4-->
					<div class="fh5co-press-item to-animate">
						<div class="fh5co-press-img" style="background-image: url(images/CDP1.png);">
						</div>
						<div class="fh5co-press-text">
							<h3 class="h2 fh5co-press-title">CDP<span class="fh5co-border"></span></h3>
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Veritatis eius quos similique suscipit dolorem cumque vitae qui molestias illo accusantium...</p>
                                                        <%if(resultSet.getString("emp_type").equals("CDPO")){ %>
							<p><a href="cdpoUI.jsp" class="btn btn-primary btn-sm">Open</a></p>
                                                        <% } else if(resultSet.getString("emp_type").equals("Team Leader")) {%>
							<p><a href="teaml1.jsp" class="btn btn-primary btn-sm">Open</a></p>
<%} else if(resultSet.getString("emp_type").equals("Employee")) {%>
							<p><a href="comvision.jsp" class="btn btn-primary btn-sm">Open</a></p>
<%}%>

						</div>
					</div>
					<!-- Press Item -->
				</div>
   <%	 }}
catch (Exception e) {
e.printStackTrace();
} %>
			</div>
		</div>
            
	</div>
    
</div>
			</div>



		</div>
	<!--</div>  -->
	
	
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

		<!--

 rating 

Input: user's comment and review
Output: the comment and review will post, for developing purposes 

-->


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

 