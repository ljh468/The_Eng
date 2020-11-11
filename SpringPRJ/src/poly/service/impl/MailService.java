package poly.service.impl;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import poly.dto.UserDTO;
import poly.service.IMailService;
import poly.util.CmmUtil;

@Service("MailService")
public class MailService implements IMailService{

	private Logger log = Logger.getLogger(this.getClass());
	
	final String host = "smtp.naver.com";
	final String user = "data0020@naver.com"; //보내는 사람 주소
	final String password = "epdlxj20"; //네이버 로그인을 위한 비밀번호
	
	@Override
	public int doSendMail(UserDTO uDTO) {
		log.info("Service.doSendMail 시작");
		
		int res = 1;
		
		if(uDTO == null) {
			uDTO = new UserDTO();
		}
		
		String Email = CmmUtil.nvl(uDTO.getUser_email());
		
		log.info(Email);
		
		Properties props = new Properties();
		props.put("mail.smtp.host", host);
		// props.put("mail.smtp.port", 587);
		props.put("mail.smtp.auth", "true");
		
		Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(user, password);
			}
		});
		
		try {
			MimeMessage message = new MimeMessage(session);
			message.setFrom(new InternetAddress(user));
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(Email));
			
			message.setSubject("인증코드 안내");
			message.setText("인증코드는 " + uDTO.getUser_authNum() + " 입니다.");
			
			Transport.send(message);
			
		} catch (MessagingException e){
			res = 0;
			log.info("[ERROR]" + this.getClass().getName() + ".doSendMail : " + e);
		} catch (Exception e){
			res = 0;
			log.info("[ERROR]" + this.getClass().getName() + ".doSendMail : " + e);
		}
		
		
		log.info("Service.doSendMail 종료");
		return res;
	}
	
	
}