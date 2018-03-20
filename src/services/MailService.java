package services;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;
import models.Email;




@Service
public class MailService {
 @Autowired(required=false)
 private JavaMailSender mailSender; 
 

 public void sendMail(Email sndMail) {
  MimeMessage msg = mailSender.createMimeMessage();
  try {
   msg.setSubject(sndMail.getSubject());
   msg.setText(sndMail.getContent());
   msg.setRecipient(RecipientType.TO, 
     new InternetAddress(sndMail.getReceiver()));
   mailSender.send(msg); 
  } catch (MessagingException e) {
   System.out.println("에러발생..");
   e.printStackTrace();
   System.out.println(e.getMessage());

  }  
 } 
}



