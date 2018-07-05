
<%-- 
    Document   : ideasbank
    Created on : Dec 5, 2016, 11:07:02 AM
    Author     : Noura f Alsaud
    Input: user can click on innovation phase to show msg that ask him if he want to add idea or not.
    Output: ideas bank bored.
--%>

<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ page import="java.sql.*" %>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
         <style>
            
            
            
div {
    
    background-color: whitesmoke;
  
 
    
}
h1 {
    
    font-family: verdana;
    font-size: 300%;
    color: whitesmoke;

}
</style>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="ideasbankstyle.css">
        <title> IdeasBank </title>
        
    
    <script>
function whichElement(e) { // thsi fun is for when user clcik on innovation phase and ask him if he want to add a new idea or not 
    var targ;
    if (!e) {
        var e = window.event; }
    if (e.target) {
        targ=e.target;}     
   if(confirm("Do you want to add a new idea?"))
        {document.location.href = "addidea.jsp"; }   }
</script>
    </head>

    <body>    
       <center><h1>-Ideas Bank-</h1></center>
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
String sql = "SELECT * FROM idea LEFT JOIN modify_idea ON idea.id_idea = modify_idea.id_idea";
resultSet = statement.executeQuery(sql);
%>
<br/>

<center>  
    <form action="" method="post"> 
        <div>   
<table>
<tr>
            
            <td width="30%" id="demo" onmousedown="whichElement(event)"> <b> <h2> Innovation </h2></b> </td>
            
            <td> <b>  <h2> Challenge </h2></b> </td>
            <td> <b>  <h2> Lean Canvas </h2></b></td>
            <td rowspan="2"> <b> <h2> GO </h2></b></td>
        </tr>
        <tr>
         
            <td  height="1000" rowspan="4"> 
                


<table align="center" cellpadding="0" cellspacing="0" border="0">
<tr>
 </td>
<table align="center" cellpadding="4" cellspacing="4">

<%
while (resultSet.next()) {
%>

<tr name="test" bgcolor="#8FBC8F">
    <div>
    <td>ID: <%=resultSet.getString("id_idea")%> <br>
        idea: <%=resultSet.getString("idea")%> <br>
        Author: <%=resultSet.getString("author")%> Date:<%=resultSet.getString("date")%> <br>
        modified idea: <%=resultSet.getString("modifiedidea")%> <br>
        Date: <%=resultSet.getString("m_date")%> Author: <%=resultSet.getString("m_author")%> <br>
        <p id="<%=resultSet.getString("id_idea")%>">Vote: <%=resultSet.getString("vote")%></p>
       <button type="button" onclick="vote(<%=resultSet.getString("vote")%>,<%=resultSet.getString("id_idea")%>)"> Vote </button>
    </td>
    </div> 
</tr>
<%
}

} catch (Exception e) {
e.printStackTrace();
}
%>

</table>
            <td rowspan="4" ></td>
            <td  rowspan="4"></td>
        </tr>
        <tr>
            <td></td>
        </tr>
        <tr>
            <td height="20"> <b> <h2> B.Rethink </h2> </b></td>
        </tr>
        <tr>
            <td></td>
        </tr>
         
    </table>
</div>  
    </form>
      
    </center>

</body>
<script type="text/javascript">
    function vote(x,y)
    {
    var xmlhttp;
    if(window.XMLHttpRequest)
    {
        xmlhttp=new XMLHttpRequest();
    }else
    {
       xmlhttp=new ActiveXObject("Microsoft.XMLHttp"); 
    }
    xmlhttp.onreadystatechange=function()
    {
        if(xmlhttp.readyState===4 && xmlhttp.status === 200 )
        {
            //document.getElementById(""+y).innerHTM();
            //document.getElementById(y).innerHTML = xmlhttp.responseText;
               window.location.reload();
            }         
    };
    xmlhttp.open("POST","voteServlet?voting="+x+"&id="+y);
    xmlhttp.send();
    ////there is something here 
    }
    </script>
</html>


