<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">


<head profile="http://www.w3.org/2005/10/profile">
<link rel="icon" 
      type="image/png" 
      href="images/logo.png"/>
	  
<link rel="stylesheet"
type="text/css"
href="design.css"/>
<title>SE | Home </title>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
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
<div id="wrapper">


<!-- logo + login-->
<div id="login">
<a> Welcome <%=session.getAttribute("name")%></a>  
</div>

<div id="logo">
<a href="indexPM.jsp">
    <img src="images/logo.png" alt="SE logo" sizes="16x16"/></a>
</div>

<!-- Navigation-->
<nav>

<img src="images/verticalline.png" alt="" />
</nav>


<!--Path
<div id="Path">
<ul>
<li><a href="indexPM.jsp">Home</a></li>
  </ul>
 </div>-->


 
 <!-- page content-->

<h1 class="headings">Main Menu</h1>

<div>

<div class="navbar">
   <a href="logout">Sign out</a>
  <% if(resultSet.getString("position").equals("pm")) { %>
       <a href="create.jsp">Create Project</a> <%}%>
   <a href="indexPM.jsp">Home Page</a>
</div>



<!--view projects example -->
<!-- Portfolio Gallery Grid -->
<div class="main">
<div class="row">
  <div class="column">
    <div class="content">
        <img src="images/1.png" style="width:100%; height:100px">
      <h3>NEOM</h3>
    </div>
  </div>
  <div class="column">
    <div class="content">
      <a href="kacst.jsp">
          <img src="images/2.png" style="width:100%; height:100px"></a>
      <h3>KACST</h3>
    </div>
  </div>
  <div class="column">
    <div class="content">
        <img src="images/3.png" style="width:100%; height:100px">
      <h3>NASA</h3>
    </div>
  </div>
  </div>

  <div class="row">
  <div class="column">
    <div class="content">
        <img src="images/4.png" style="width:100%; height:100px">
      <h3>GOOGLE</h3>
    </div>
  </div>
  <div class="column">
    <div class="content">
        <img src="images/5.png" style="width:100%; height:100px">
      <h3>APPLE inc.</h3>
    </div>
  </div>
  <div class="column">
    <div class="content">
        <img src="images/6.png" style="width:100%; height:100px">
      <h3>MICROSOFT</h3>
    </div>
  </div>
  </div>
  
 </div>
</div>



<!-- Navigation-->
<nav>
    <img src="images/verticalline.png" alt="" />
<!-- <ul>
<li><a href="index.jsp" accesskey="H">Home</a></li>
  <li><a href="search.jsp" accesskey="A">Search</a></li>
  <li><a href="category.jsp" accesskey="C">Category</a> </li>
  <li><a href="sitemap.jsp" class="active" accesskey="M">Site map</a> </li>
  <li><a href="caontactus.jsp" accesskey="C">Contact Us</a> </li>
</ul> -->
</nav>


<!--footer-->
<div id="footer">
Copyright &copy; SE, KACST 
</div>



</div><!--wrapper div-->

 <%}
catch (Exception e) {
e.printStackTrace();
} %>
</body>
</html>