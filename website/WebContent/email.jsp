<%-- 
    Document   : send email
    Created on : Jul 11, 2017, 1:10:55 PM
    Author     : trainee2
--%>
<%@page import ="java.util.Properties" %>
<%@page import ="javax.mail.*" %>
<%@page import ="javax.mail.internet.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body onLoad="displyResult()">
        <h1>Sending email</h1>
        <%!
            public static class SMTPAuthenticator extends Authenticator {
public PasswordAuthentication getPasswordAuthentication() {

return new PasswordAuthentication("kacsttrainer@gmail.com", "123456AA");

}

}
            %>
       <%
           int result=0;
           if(request.getParameter("send")!=null){
           String d_name="kacsttrainer";
           String d_password="123456AA";
           String d_host="smtp.gmail.com";
           int d_port=465;
           
           String m_to = new String();
           String m_from = "kacsttrainer@gmail.com";
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
            
        <form action="SendMail2" method="POST">
        <table border="0">
            <tbody>
                <tr>
                    <td>To :</td>
                    <td><input type="text" name="to" value="" size="50" /></td>
                </tr>
                <tr>
                    <td>Subject :</td>
                    <td><input type="text" name="subject" value="" size="50" /></td>
                </tr>
                
                <tr>
 
                    <td><textarea name="message" rows="4" cols="50"  > "Add your message here" </textarea></td>
                    
                </tr>
            </tbody>
             
        </table>
        <input type="hidden" name="hidden" value="<%= result %>" />
        <input type="reset" value="Clear" name="clear" />
        <input type="submit" onclick="displyResult(),close()
               " value="send" name="send" />
        
<script>
function myFunction() {
    alert ("Mail sent!");
}
</script>

     </form>
        
        <script language="javascript">
            function displyResult(){
                  
                if (document.myForm.hidden.value === "1") {
                    alert ("Mail sent!");
                        

                }
                
            }
            
            function close(){window.close();}
       
            
        </script>
    </body>
    
    
</html>