
<%@ page import="java.io.*,java.util.*,javax.mail.*"%>
<%@ page import="javax.mail.internet.*,javax.activation.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%

   String result;

   // Get system properties object
        Properties props = System.getProperties();
     String num=request.getParameter("pass");
     String mes =request.getParameter("mes");
          String mes2 ;
          if(request.getParameter("mes2")!=null)
          {
              mes2=request.getParameter("mes2");
          }else
          {
mes2="";          }
          
          String name =request.getParameter("name");
           String email =request.getParameter("email");



   // Setup mail server
        String host = "smtp.gmail.com";
        String from = "kacsttrainer@gmail.com";
        String pass = "123456AA";
        String to = email;
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", host);
        props.put("mail.smtp.user", from);
        props.put("mail.smtp.password", pass);
        props.put("mail.smtp.port", "587");     //try 465, 25, 587
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.timeout", "25000");

   // Get the default Session object.
        Session mailsession = Session.getDefaultInstance(props);

   try{
      // Create a default MimeMessage object.
        MimeMessage message = new MimeMessage(mailsession);
       
        message.setFrom(new InternetAddress(from));   

        message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));

        // Set Subject: header field
        message.setSubject("Website");
       
        // Now set the actual message
        message.setText(mes+num+mes2+name);
      //  if you want to send HTML page use  setContent(msg, "text/html");
      // message.setContent("<h1>This is actual message</h1>", "text/html" );
        // Send message
        Transport transport = mailsession.getTransport("smtp");
        transport.connect(host, from, pass);
        transport.sendMessage(message, message.getAllRecipients());
        transport.close();
        result = "Sent message successfully....";
    }catch (MessagingException mex) {
      mex.printStackTrace();
      result = "Error: unable to send message....";
    }
%>
<html>
<head>
<title>Send Email using JSP</title>
</head>
<body>
<center>

</center>

    <%

    response.sendRedirect("ideabank2.jsp");
%>


</body>
</html>
