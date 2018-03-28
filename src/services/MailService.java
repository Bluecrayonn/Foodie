package services;

import java.util.UUID;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import models.EmailDTO;

//

@Service
public class MailService {

	@Autowired(required = false)
	private JavaMailSender mailSender;

	public String sendAuthMail(EmailDTO sndMail) {
		MimeMessage msg = mailSender.createMimeMessage();
		try {
			msg.setSubject("FOODIE 회원가입 이메일 인증 ");

			UUID uuid = UUID.randomUUID();
			String[] uuidString = uuid.toString().toUpperCase().split("-");
			String authkey = uuidString[1] + uuidString[4];
			String content = "<div><h3>생성된 이메일 인증키를 인증키 입력란에 정확하게 입력하세요!</h1><br/>"
					+ "<h3> (대소문자를 구분합니다.)</h2><br/></div>" + "<h2>" + authkey + "</h2>";
			msg.setContent(content, "text/html;charset=UTF-8");
			msg.setRecipient(RecipientType.TO, new InternetAddress(sndMail.getReceiver()));
			mailSender.send(msg);
 			return "sendsucc:" + authkey + ":" + sndMail.getReceiver();
		} catch (MessagingException e) {
			System.out.println("에러발생..");
			e.printStackTrace();
			System.out.println(e.getMessage());
			return "sendfail";

		}
	}

	public boolean checkAuthMail(String sessionAuthKey, String receivedKey) {

		if (sessionAuthKey.equals(receivedKey)) {
			return true;
		} else {
			return false;
		}

	}
	
	public String sendPasswordAuthMail(EmailDTO sndMail) {
		MimeMessage msg = mailSender.createMimeMessage();
		try {
			msg.setSubject("FOODIE 비밀번호 이메일 인증 ");

			UUID uuid = UUID.randomUUID();
			String[] uuidString = uuid.toString().toUpperCase().split("-");
			String authkey = uuidString[1] + uuidString[4];
			String content = "<div><h3>생성된 이메일 인증키를 인증키 입력란에 정확하게 입력하세요!</h1><br/>"
					+ "<h3> (대소문자를 구분합니다.)</h2><br/></div>" + "<h2>" + authkey + "</h2>";
			msg.setContent(content, "text/html;charset=UTF-8");
			msg.setRecipient(RecipientType.TO, new InternetAddress(sndMail.getReceiver()));
			mailSender.send(msg);
 			return "sendsucc:" + authkey + ":" + sndMail.getReceiver();
		} catch (MessagingException e) {
			System.out.println("에러발생..");
			e.printStackTrace();
			System.out.println(e.getMessage());
			return "sendfail";

		}
	}

	 
}
