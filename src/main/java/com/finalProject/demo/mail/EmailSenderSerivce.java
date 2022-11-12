package com.finalProject.demo.mail;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

@Service
public class EmailSenderSerivce{
	
	@Autowired
	private JavaMailSender mailSender;
	
	public void sendEmail(String toEmail,
						  String subject,
						  String body) {
		SimpleMailMessage message = new SimpleMailMessage()	;
		message.setFrom("chezmoi152@gmail.com");
		message.setTo(toEmail);
		message.setText(body);
		message.setSubject(subject);
		
		mailSender.send(message);
		
		System.out.println("Mail sent succseefully...");
	}
	
	public void sendImageMail(String toEmail,String subject,String text1,
			String text2,String text3,String text4,String text5,String text6,String text7,String text8) {
		
		try {
			MimeMessage mimeMessage = mailSender.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(mimeMessage,true);
			helper.setFrom("chezmoi152@gmail.com");
			helper.setTo(toEmail);
			helper.setSubject(subject);
			String content = "<html><body>"+"<p>"+text1+"</p>"+"<p>"+text2+"</p>"+"<p>"+text3+"</p>"+
					"<p>"+text4+"</p>"+"<p>"+text5+"</p>"+"<p>"+text6+"</p>"+"<p>"+text7+"</p>"+"<p>"+text8+"</p>"
			+"<img src='https://img.onl/EflgJ6'></img>"+"</body></html>"; 
			helper.setText(content,true);
			mailSender.send(mimeMessage);
		} catch (MessagingException e) {
			System.out.println("發送失敗");
		}
	}
	public void sendPaymentMail(String toEmail,String subject,String text1,
			String text2,String text3,String text4,String text5,String text6) {
		
		try {
			MimeMessage mimeMessage = mailSender.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(mimeMessage,true);
			helper.setFrom("chezmoi152@gmail.com");
			helper.setTo(toEmail);
			helper.setSubject(subject);
			String content = "<html><body>"+"<p>"+text1+"</p>"+"<p>"+text2+"</p>"+"<p>"+text3+"</p>"+
					"<p>"+text4+"</p>"+"<p>"+text5+"</p>"+"<p>"+text6+"</p>"
					+"<img src='https://img.onl/EflgJ6'></img>"+"</body></html>"; 
			helper.setText(content,true);
			mailSender.send(mimeMessage);
		} catch (MessagingException e) {
			System.out.println("發送失敗");
		}
	}

	public void sendManagerForgotPwd(
			String toEmail,String subject,String link,
			String text1,String text2,String text3) {
		try {
			MimeMessage mimeMessage = mailSender.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(mimeMessage,true);
			helper.setFrom("chezmoi152@gmail.com");
			helper.setTo(toEmail);
			helper.setSubject(subject);
			String content = "<html><body>"
					+"<div class='card-body justify-content-center'>"
					+"<p>"+text1+"</p>"
					+"<p><a href="+link+" class='btn font-weight-semi-bold' style='background-color: #cfa98d'>"+"重設密碼"+"</a></p>"
					+"<p>"+text2+"</p>"
					+"<p>"+text3+"</p>"
					+"<img src='https://img.onl/EflgJ6'></img>"
					+"</div>"
					+"</body></html>";
			helper.setText(content,true);
			mailSender.send(mimeMessage);
		} catch (MessagingException e) {
			System.out.println("發送失敗");
		}
	}
	
					
	
}
