/*package services;

//import java.util.UUID; //삭제 -> MailController로 이동함

import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

@Service
public class MailService {
	@Autowired
	JavaMailSender sender;

	public boolean sendAuthKey(String email, String key) { 
		
		MimeMessage message = sender.createMimeMessage();
		try {
			message.addRecipients(RecipientType.TO, email);
			message.setSubject("인증키입니다.");

			String text = "<h3>인증키</h3>";
			text += "<p>전송받은 인증키 <a href=\"http://localhost/foodie/check.do?key=" + key + "\">" + key + "</a>를 입력해주세요";

			message.setContent(text, "text/html;charset=utf-8");

			sender.send(message);
			return true; 
		} catch (Exception e) {
			e.printStackTrace();
			return false; 
		}
	}

}*/