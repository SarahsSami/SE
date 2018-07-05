<%-- 
    Document   : addidea
    Created on : Feb 13, 2017, 9:09:01 AM
    Author     : noura faisal alsaud
    Input: user can entre thier own idea and name.
    Output: form that ask users to enter their name. idea and submit to add idea.
also user can choose between three options 1) modify thier own idea. 2)modify other users idea. 3) back to ideas bank.


--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*, javax.servlet.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
          <link rel="stylesheet" type="text/css" href="allpages.css">
        <title>JSP Page</title>
    </head>
    <body>
    <center>
        <% String user= ""+session.getAttribute("id");%>
                <% String name= ""+session.getAttribute("UName");%>

 <form action="ideanew" method="post">  <!-- form that call servlet 3   which is IdeaServlet -->
            <h2> Enter your Idea:</h2> 
<input type="text" name="idea"/><br/><br/> 
 <br/><br/>
<input type="Hidden" name="vote" value="0"/><br/><br/>
<input type="Hidden" name="status" value="0"/><br/><br/>
<input type="Hidden" name="leanCanves" value=""/><br/><br/>
<input type="Hidden" name="id" value="<%=user%>"/><br/><br/>
<input type="Hidden" name="author" value="<%=name%>"/><br/><br/>
<input type="Hidden" name="user" value = "<%=request.getParameter("user")%>" /><br/><br/>
<input type="submit" value="submit"/>
<input type="submit" value="Back to Ideas Bank"/>

</form>

 

      </center>  
    </body>
</html>