<%@page import ="java.util.Properties" %>
<%@page import ="javax.mail.*" %>
<%@page import ="javax.mail.internet.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
        <style>
                       .w3-navbar li a {
    padding: 16px;
    float: left;
}
ul {
    list-style-type: none;
    margin: 0;
    padding: 0;
    overflow: hidden;
    
}

li a, .dropbtn {
    display: inline-block;
    color: blue;
    text-align: center;
    padding: 14px 16px;
    text-decoration: none;
}

li a:hover, .dropdown:hover .dropbtn {
    background-color: lightgrey;
}

li.dropdown {
    display: inline-block;
}

.dropdown-content {
    display: none;
    position: absolute;
    
    min-width: 160px;
    box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
    z-index: 1;
}

.dropdown-content a {
   
    padding: 12px 16px;
    text-decoration: none;
    display: block;
    text-align: left;
}

.dropdown-content a:hover {background-color: #f1f1f1}

.dropdown:hover .dropdown-content {
    display: block;
}
input[type=text] {
    width: 100px;
    box-sizing: border-box;
    border: 2px solid #ccc;
    border-radius: 4px;
    font-size: 16px;
    background-color: white;
  
    padding: 12px 20px 12px 40px;
    -webkit-transition: width 0.4s ease-in-out;
    transition: width 0.4s ease-in-out;
}
input[type=text]:focus {
    width: 10%;
}
.button {
    background-color: #778899;
    border: none;
    color: darkblue;
    padding: 15px 32px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 15px;
    margin: 4px 2px;
    cursor: pointer;
    width: 20%
}

.button1 {
    box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.19);
}


        </style>
    <body onLoad="displyResult()">
           <div class="w3-top">
   
  <ul class="w3-navbar w3-white w3-card-2" id="myNavbar">
    
      <li style="list-style-type: none;">
          <a href="index2.html" class="w3-wide"> <img src="kacst.png" style="width:120px;height:70px;"></a> </li>
             
    <!-- Right-sided navbar links -->
  
    
    <li class="w3-right w3-hide-small" style="list-style-type: none;">
        <br/>
        <br/>
        <br/>
       <br/>
       <br/>
       
      <a href="about.html" class="dropbtn">ABOUT US</a>
      <a href="news.html" class="dropbtn"> NEWS & EVENTS</a>
      <a href="articles.html" class="dropbtn"><i class="fa fa-th"></i> ARTICLES</a>
      <a href="products.html" class="dropbtn"><i class="fa fa-usd"></i> PRODUCT&SERVICES</a>
      <a href="contact.html" class="dropbtn"><i class="fa fa-envelope"></i> CONTACT US</a>
       <a href="career.html" class="dropbtn">CAREER</a>
       <a href="rating.html" class="dropbtn">REVIEW</a>
       <a href="userprofile1.jsp" class="dropbtn"> MY PROFILE</a>
       <form>
   <input type="text" name="search" placeholder="Search">
</form>
    </li>
    <!-- Hide right-floated links on small screens and replace them with a menu icon -->
  
  </ul>
</div>
        <br/>
        <br/>
        <br/>
       <br/>
       <!-- About Section -->
<div class="w3-container w3-padding-128" id="about">
    <center> <h1 class="w3-center" style="font-family: Castellar;">Feedback </h1> </center>
 
  <img src="ve.jpg" style="width:1500px; height:200px;"/> 
  <br/>
  <br/>
  <br/>
  <br/>
  <br/>

  

<p>Feedback for employee :: </p>
         <%!
            public static class SMTPAuthenticator extends Authenticator {
public PasswordAuthentication getPasswordAuthentication() {

return new PasswordAuthentication("kacsttraining@gmail.com", "bno1234567");

}

}
            %>
             <%
           int result=0;
           if(request.getParameter("send")!=null){
           String d_name="kacsttraining";
           String d_password="bno1234567";
           String d_host="smtp.gmail.com";
           int d_port=465;
           
           String m_to = new String();
           String m_from = "kacsttraining@gmail.com";
           String m_subject = new String();
           String m_text = new String();
           
           if(request.getParameter("to")!=null){
               m_to = request.getParameter("to");  }
           
           if(request.getParameter("subject")!=null){
               m_subject = request.getParameter("subject");  }
           
           if(request.getParameter("message")!=null){
               m_text = "<h1> message </h1>";
               m_text = m_text.concat(request.getParameter("message"));
               m_text = m_text.concat("<br /><h2> We hope enjoy </h2>");
           }
           
           //create a properties props 
           Properties props = new Properties ();
           
           //create a SMTPAuthenticator object
          SMTPAuthenticator Authr =  new SMTPAuthenticator();
          
          Session ses = Session.getDefaultInstance(props,Authr);
          
          MimeMessage msg = new MimeMessage(ses);
          
          msg.setContent(m_text, "text/html");
          msg.setSubject(m_subject);
          msg.setFrom(new InternetAddress(m_from));
          msg.addRecipient(Message.RecipientType.TO, new InternetAddress(m_to));
          
          try {
              Transport transport = ses.getTransport("smtps");
              transport.connect(d_host,d_port,d_name,d_password );
              transport.sendMessage(msg,msg.getAllRecipients());
              transport.close();
              result=1;
          
          }
          
          catch(Exception e){
           out.println(e);}
          
       
           
           
        }
         
        %>      
        <%String c ="Feedback";%>
        <form action="email2" method="POST">
        <table border="1">
           
                <tr>
                    <td>To :</td>
                    <td><textarea rows="1" cols="50" name="to" ><%=request.getParameter("email")%></textarea></td>
                </tr>
                <tr>
                    <td>Subject :</td>                 
                     <td><textarea rows="1" cols="50" name="subject" ><%=c%></textarea></td>
                </tr>
                
                <tr>
                    <td>Message :</td>
                    <td><textarea name="message" rows="4" cols="50"  > "Add your message here" </textarea></td>
                    
                </tr>
            
             
        </table>
        <input type="hidden" name="hidden" value="<%= result %>" />
        <input type="reset" value="Clear" name="clear" />
        <input type="submit"  value="send" name="send" />


     </form>
        
        <script languge="javascript">
            function displyResult(){
                if (document.myForm.hidden.value === "1") {
                    alert ("Mail sent!");
                }
            }
       
            
        </script>
    
    
    
  <br/>
  <br/>
   
    </body>
     <!-- Footer -->
<footer class="w3-container w3-padding-64 w3-center w3-opacity w3-light-grey w3-xlarge" >
  
    <center> <p class="w3-medium">Copyrigth &copy; KACST ECP 2017</p> </center>
</footer>
    
</html>
