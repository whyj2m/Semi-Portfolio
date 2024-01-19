package com.imfreepass.prj.service;

import java.util.Properties;
import java.util.Random;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class EmailService {
	    private static final Random random = new Random();
	    private static final int VERIFICATION_CODE_LENGTH = 6;

	    public String verificationCode() {
	        StringBuilder code = new StringBuilder();
	        for (int i = 0; i < VERIFICATION_CODE_LENGTH; i++) {
	            code.append(random.nextInt(10));
	        }
	        return code.toString();
	    }

	    public void sendEmail(String email, String code) throws MessagingException {
	    	
	        Properties props = new Properties();
	        props.put("mail.smtp.host", ""); // SMTP 포트
	        props.put("mail.smtp.port", "587");// TLS 포트
	        props.put("mail.smtp.auth", "true"); // 
	        props.put("mail.smtp.starttls.enable", "true"); // 

	        // session 생성 SMTP 서버
	        Session session = Session.getInstance(props, new javax.mail.Authenticator() {
	            PasswordAuthentication getPasswordAuthenticationn() {
	                return new PasswordAuthentication("your-email@yourserver.com", "your-password");
	                // API 서버랑 유니크 키 적는건가
	            }
	        });

	        Message message = new MimeMessage(session);
	        message.setFrom(new InternetAddress("your-email@yourserver.com"));
	        message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(email));
	        message.setSubject("6자리 인증코드");
	        message.setText("인증코드는 : " + code);

	        // 이메일 발송
	        Transport.send(message);
	    }

	    public static void main(String[] args) {
	        EmailService service = new EmailService();
	        String code = service.verificationCode();
	        try {
	            service.sendEmail("입력한 이메일", code);
	            System.out.println("인증번호 :  " + code);
	        } catch (MessagingException e) {
	            e.printStackTrace();
	        }
	    }
	}

