<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<%@ page import="java.sql.*" %>
<%ResultSet resultset =null;%>

<html xmlns="http://www.w3.org/1999/xhtml">


<head profile="http://www.w3.org/2005/10/profile">
<link rel="icon" 
      type="image/png" 
      href="images/logo.png"/>
	  
<link rel="stylesheet"
type="text/css"
href="design.css"/>
<title>SE | Create project </title>
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
<div id="logo">
<div id="login">
<a> Welcome </a>
</div>
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

<h1 class="headings">Create new project</h1>

<div>

<div class="navbar">
   <a href="logout">Sign out</a>
  <% if(resultSet.getString("position").equals("pm")) { %>
       <a href="create.jsp">Create Project</a> <%}%>
   <a href="indexPM.jsp">Home Page</a>
</div>

<!--view projects example -->
<!-- Portfolio Gallery Grid -->
<form id="loginForm" method="post" action="/create">
  Project name:<br>
  <input type="text" name="pname" value="">
  <br>
  Project logo:<br>
  <input type="file" name="pic">
  Project description:<br>
  <textarea name="pdesc" style="width:350px; height:200px">
</textarea><br>
    
    <%
    try{
Class.forName("com.mysql.jdbc.Driver").newInstance();
       resultset =statement.executeQuery("select * from users") ;
%>

  Project resources:<br>
  <select name="user" size="5" multiple>
      
       <%  while(resultset.next()){ %>
            <option><%= resultset.getString(2)%></option>
        <% } %>
   <!-- <option value="volvo">Ahmad</option>
    <option value="saab">Maha</option>
    <option value="fiat">Fahad</option>
    <option value="audi">Noura</option> -->
  </select>
      
<%
//**Should I input the codes here?**
        }
        catch(Exception e)
        {
             out.println("wrong entry"+e);
        }
%>
  <br><br>
  <input type="submit" value="Next">
</form> 

<br/> <br/> <br/> <br/> <br/> <br/> <br/>  <br/> <br/> <br/> <br/> <br/> <br/> <br/>  <br/> <br/> <br/> <br/> <br/> <br/> <br/><br/> <br/> <br/> <br/> <br/> <br/> <br/>  <br/> <br/> <br/> <br/> <br/> <br/> <br/>  <br/> <br/> <br/> <br/> <br/> <br/> <br/>
 </div>



<!-- Navigation-->
<nav>
    <img src="images/verticalline.png" alt="" />

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