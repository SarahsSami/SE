<%-- 
    Document   : ideabank3
    Created on : Aug 7, 2017, 2:33:09 PM
    Author     : waveform3
coordinator page
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
        <script type="text/javascript" src="js/jquery-1.10.2.js"></script>

         <style>
            
            
            
div {
    
    background-color: whitesmoke;
}
h1 {
    
    font-family: verdana;
    font-size: 300%;
    color: whitesmoke;

}
table{
   background-color: white;  
   border: 0px;
}
.idea{
    border: 10px solid green;
    padding: 10px;
    margin: 10px;
}

.rethink{
    border: 10px solid green;
    padding: 1px;
    margin: 10px;
}
#id1,#id2{
   visibility: hidden; 
    
}
</style>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="ideasbankstyle.css">
        <title> IdeasBank </title>
        
    
    
     
    <script>
        function send() {
            document.getElementById()
            
        }
        
        

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
String password = "myadminsql123";

int i=0;
int s = 0;
int notification =0;

try {
Class.forName(driverName);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}

Connection connection = null;
Statement statement = null;
Statement statement2 = null;
ResultSet resultSet = null;
ResultSet resultSet2 = null;
String leanCanvas = null;

try {
connection = DriverManager.getConnection(
connectionUrl + dbName, userId, password);
statement = connection.createStatement();
statement2 = connection.createStatement();
String sql = "SELECT * FROM idea LEFT JOIN modify_idea ON idea.id_idea = modify_idea.id_idea order by idea.id_idea DESC;";
resultSet = statement.executeQuery(sql);
        String user= ""+session.getAttribute("id");
%>
     
       
       <form action ="addidea.jsp" method="post">
           <button type="submit"> Add new idea </button>
        </form> 
       
       <form action="modifyyourownidea.jsp" method="post" style ='display:inline;'>
           <button type="submit"> Modify your idea </button>
       </form> 
       
        <form action="modifyotheruseridea.jsp" method="post" style='display:inline;' >
            <button type="submit"> Modify user idea </button>
       </form> 
       
       
<br/><br/><br/>
<center> 
    <table> <tr> 
                 <td width="30%" id="demo" onmousedown="whichElement(event)"> <b> <h2> Innovation </h2></b>
                 </td>
             <td> Challenge: </td>
             <td> lean canvas: </td>
             <td> GO: </td>
             
            
             <td> Rethink: </td>
             </tr>
             <tr>
                 <% for(i=0; i<5 ;i++)
                 {%>
          
                 <td>
                    <% while (resultSet.next()) {
                      
     if ((resultSet.getInt("status"))== i ) 
      { %>
    
      <div class="idea" > 
       ID: <%=resultSet.getString("id_idea")%> <br>
       idea: <%=resultSet.getString("idea")%> <br>
       Author: <%=resultSet.getString("author")%><br> 
       Date:<%=resultSet.getString("date")%> <br>
       modified idea: <%=resultSet.getString("modifiedidea")%> <br>
       Date: <%=resultSet.getString("m_date")%><br> 
       Author: <%=resultSet.getString("m_author")%> <br>
       Lean canvas: <%=resultSet.getString("leanCanves")%>
       <p id="<%=resultSet.getString("id_idea")%>">Vote: <%=resultSet.getString("vote")%></p>        

        
 <% if(i==0){ 
String sql2= "SELECT * from marketing.idea WHERE idea.status=0 ORDER BY idea.vote DESC, idea.date ASC LIMIT 2";
resultSet2 = statement2.executeQuery(sql2);

while (resultSet2.next()){  
%>
 <form action="updateServlet" method="post"  id="form1" name="my">
 <input type="Hidden" name="user" value="*****"/>
        <input type="Hidden" name="status" value="1"/>
        <input type="Hidden" name="id" value="<%=resultSet.getString("id_idea")%>"/>
        <input type="Hidden" name="notification" value="<%=++notification%>"/>
<input type="Hidden" name="type" value="ideabank3.jsp"/>

 </form>
 
     <!-- <script>
  document.my.submit();  
     </script> -->
     
<%}

 // UPDATE idea SET status =1 where id_idea= (SELECT id_idea from idea WHERE status=0 ORDER BY vote DESC, date ASC limit 2 );%>    

        <form action="updateServlet" method="post">   
         <input type="Hidden" name="user" value="*****"/>
        <input type="Hidden" name="status" value="3"/>
        <input type="Hidden" name="id" value="<%=resultSet.getString("id_idea")%>"/>
        <input type="Hidden" name="notification" value="<%=++notification%>"/>
        <button type="submit">send to Go</button>
        <button type="button" onclick="vote(<%=resultSet.getString("vote")%>,<%=resultSet.getString("id_idea")%>,<%=user%>)"> Vote </button>
        
       <% } else if (i==1){ %>
      
       <form action="email.jsp" method="post" target="_blank">
       
        <input type="submit" value="Call for meeting" name ="submit" onclick='show()' />
        
       </form>
  
       <form action="updateServlet" method="post">
           <input type="Hidden" name="user" value="*****"/>
        <input type="Hidden" name="status" value="2"/>
        <input type="Hidden" name="id" value="<%=resultSet.getString("id_idea")%>"/>
        <input type="Hidden" name="notification" value="<%=++notification%>"/>
        <button type="submit" id='id1' onClick="parent.open('https://board.tuzzit.com/#/ /')"> moves to lean canvas</button>
       </form>
       

        <form action="updateServlet" method="post">   
         <input type="Hidden" name="user" value="*****"/>
        <input type="Hidden" name="status" value="0"/>
        <input type="Hidden" name="id" value="<%=resultSet.getString("id_idea")%>"/>
        <input type="Hidden" name="notification" value="<%=++notification%>"/>
        <button type="submit" id='id2'>Reject idea</button>  </form>
        

        <% } %> <% /* String x;
  x= request.getParameter("submit");*/ %>
  
        <% /*if (!x.equals("Call for meeting")){ }*/ %>  
      
 <%      

if (i==2){  int num=1; %>

   
   <form action="updateLeanCanvas_1" method="post" name="upd">  
<input type="text" id="<%=resultSet.getString("id_idea")+num%>" placeholder="Enter idea frame " name="i" />
<button type="" onclick="m(<%=resultSet.getString("id_idea")%>,<%=resultSet.getString("id_idea")+num%>)"/> ok </button>
   <input type="Hidden" name="id" value="<%=resultSet.getString("id_idea")%>"/>
   </form>  

      <div id="<%=resultSet.getString("id_idea")%>">  </div>
      
      <form action="updateServlet" method="post">   
        <input type="Hidden" name="status" value="3"/>
        <input type="Hidden" name="id" value="<%=resultSet.getString("id_idea")%>"/>
        <button type="submit" > Workable idea </button>  </form>
        
        <form action="updateServlet" method="post">   
        <input type="Hidden" name="status" value="4 "/>
        <input type="Hidden" name="id" value="<%=resultSet.getString("id_idea")%>"/>
        <button type="submit" > Unworkable idea </button>  </form>
       
        
       <% num++; } %>
       
       <%   if (i==3){ %>
       
 <form action="auto.jsp" method="post">
           <input type="Hidden" name="status" value="0"/>
        <input type="Hidden" name="id" value="<%=resultSet.getString("id_idea")%>"/>       
        <button type="submit"  onclick="auto()"> Buy the idea </button>
      </form>
       <% } %>
       <br>
    </div>   
  
                    <%}}%>
                    
                    </td>        
                         <%  
                          resultSet.beforeFirst(); } 
                 %>
             </tr>         
                         <div></div>
              

         </table>
             
             
             </br>
             <button type="submit" Onclick="window.print()"> print </button>
    <%
} catch (Exception e) {
e.printStackTrace();
}
%>   
    </body>


<script type="text/javascript">
 function show(){
     
     document.getElementById("id1").style.visibility ="visible";
     document.getElementById("id2").style.visibility ="visible";

 }
    function vote(x,y,g)
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
    xmlhttp.open("POST","voteServlet?voting="+x+"&id="+y+"&id2="+g);
    xmlhttp.send();
    ////there is something here 
    }


function auto(){
  window.alert("your requset to buy idea was send to cordinator");  
    
}
    </script>   
</html>

