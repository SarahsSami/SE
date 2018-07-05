<%-- 
    Document   : modifyotheruseridea
    Created on : Feb 13, 2017, 9:09:01 AM
    Author     : noura faisal alsaud
    Input: user can entre old idea id . new idea and his name
    Output: form that ask users to enter old idea ID. new idea , his name and submit to add idea.
also user can choose between three options 1) modify thier own idea. 2)modify other users idea. 3) back to ideas bank.


--%>

 
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
          <link rel="stylesheet" type="text/css" href="allpages.css">
        <title>JSP Page</title>
    </head>
    <body>
    <center>
        <% String user= ""+session.getAttribute("id");
        String name= ""+session.getAttribute("UName");
         request.getParameter("user");
%>
        <form action="ModifyotheruserideaServlet_1" method="post">  <!-- form that call servlet 6  modify other user idea servlet -->
            <h2> Enter Old Idea ID:</h2>
<input type="text" name="id_idea"/><br/><br/>
<h2>Enter your New Idea:</h2>
<input type="text" name="modifiedidea" /><br/><br/>
<input type="hidden" name="id" value="<%=user%>"/><br/><br/>
<input type="hidden" name="m_author" value="<%=name%>"/><br/><br/>
    <input type="Hidden" name="user" value = "<%=request.getParameter("user")%>" />

<h3> Click Here to Add Idea </h3>
<input type="submit" value="SUBMIT"/>

</form>
 <br/> 
<form>
    <a href="modifyyourownidea.jsp"> Modify your own idea </a><br>
   <a href="modifyotheruseridea.jsp"> Modify others idea </a><br>
   <a href="newjsp.jsp"> Back to Ideas Bank </a> <br>
</form>
      </center>  
    </body>
</html>
