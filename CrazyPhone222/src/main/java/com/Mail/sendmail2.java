package com.Mail;

import java.io.UnsupportedEncodingException;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.mail.internet.MimeUtility;
import javax.sound.midi.Receiver;

public class sendmail2 {
	

	
	public static void send(String name, String toemail, String mailsubject, String url, String mailmessage) throws Exception {
		System.out.println("使用方法中...");
		String myAccountEmail="eeit11413@gmail.com";
		String password="60513apple";
		String to = toemail;
		String from = "eeit11413@gmail.com";
		String bd=null;
		int a=(int)Math.floor(Math.random()*3+1);
		if(a==3) {
			bd="5rhx9eh";
		}else if (a==2) {
			bd="9thsn9wj";
		}else {
			bd="y7qk3si6";
		}
			
		
		
		String body = "<h3>"+"會員您好,請在網頁輸入下列驗證碼以重置密碼"+"</h3>"+"<br>"+"<h2 style='color:red'>"+bd+"</h2>";
		String subject = "重製密碼";
		
		Properties properties = System.getProperties();
		// 設定傳輸協定為smtp
		properties.setProperty("mail.transport.protocol", "smtp");
		// 設定mail Server
		properties.setProperty("mail.smtp.host", "smtp.gmail.com");
		properties.setProperty("mail.smtp.port", "465");

		properties.put("mail.smtp.auth", "true");// 需要驗證帳號密碼
		// SSL authentication
		properties.put("mail.smtp.ssl.enable", "true");
		properties.put("mail.smtp.starttls.enable", "true");

		Session session =Session.getInstance(properties,new Authenticator() {
			@Override
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(myAccountEmail, password);
			}
			
		});
		
		try {
			// 建立一個 MimeMessage object.
			MimeMessage message = new MimeMessage(session);
			// 設定郵件
			message.setFrom(new InternetAddress(from)); // 設定寄件人
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(to)); // 設定收件人
			message.setSubject(subject,"UTF-8"); // 設定主旨

			
			Multipart multipart = new MimeMultipart();
			// 第一個段落
			BodyPart messageBodyPart = new MimeBodyPart(); // 宣告一個BodyPart用以夾帶內文
			messageBodyPart.setContent(body, "text/html; charset=UTF-8");
	
			multipart.addBodyPart(messageBodyPart); 

			message.setContent(multipart); // 設定eMultipart為messag的Content
			//message.setContent(, "text/html;charset=UTF-8");
			Transport transport = session.getTransport("smtp");
			transport.connect("smtp.gmail.com", myAccountEmail, password);
			// 傳送信件
			transport.sendMessage(message, message.getAllRecipients());

			System.out.println("發送成功");
			// 關閉連線
			transport.close();

		} catch (MessagingException mex) {
			mex.printStackTrace();
		}
		
	}
	
	public static void send2(String name, String email, String mailsubject, String mailmessage) {
		System.out.println("使用方法中...");
		String user = "tp6gl4d93@gmail.com";// user
		String pwd = "60513apple";// password
		String to = "tp6gl4d93@gmail.com";
		String from = "tp6gl4d93@gmail.com";// 寄件人的email
		/*
		 * host yahoo:"smtp.mail.yahoo.com" outlook:"smtp-mail.outlook.com"
		 */
		String host = "smtp.gmail.com";

		String subject = "聯絡問題";
//		try {
//			subject=MimeUtility.encodeText(subject,
//			        "UTF-8", null);
//		} catch (UnsupportedEncodingException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
		
		String body = "姓名:" + name + "<br>" + "Email:" + email + "<br>" + "標題:" + mailsubject + "<br>" + "問題:" + mailmessage;
		System.out.println(mailmessage);
		Properties properties = System.getProperties();
		// 設定傳輸協定為smtp
		properties.setProperty("mail.transport.protocol", "smtp");
		// 設定mail Server
		properties.setProperty("mail.smtp.host", "smtp.gmail.com");
		properties.setProperty("mail.smtp.port", "465");

		properties.put("mail.smtp.auth", "true");// 需要驗證帳號密碼
		// SSL authentication
		properties.put("mail.smtp.ssl.enable", "true");
		properties.put("mail.smtp.starttls.enable", "true");

		Session session =Session.getInstance(properties,new Authenticator() {
			@Override
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(user, pwd);
			}
			
		});
		
		try {
			// 建立一個 MimeMessage object.
			MimeMessage message = new MimeMessage(session);
			// 設定郵件
			message.setFrom(new InternetAddress(from)); // 設定寄件人
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(to)); // 設定收件人
			message.setSubject(subject,"UTF-8"); // 設定主旨

			
			Multipart multipart = new MimeMultipart();
			// 第一個段落
			BodyPart messageBodyPart = new MimeBodyPart(); // 宣告一個BodyPart用以夾帶內文
			messageBodyPart.setContent(body, "text/html; charset=UTF-8");
	
			multipart.addBodyPart(messageBodyPart); 

			message.setContent(multipart); // 設定eMultipart為messag的Content
			//message.setContent(, "text/html;charset=UTF-8");
			Transport transport = session.getTransport("smtp");
			transport.connect("smtp.gmail.com", user, pwd);
			// 傳送信件
			transport.sendMessage(message, message.getAllRecipients());

			System.out.println("發送成功");
			// 關閉連線
			transport.close();

		} catch (MessagingException mex) {
			mex.printStackTrace();
		}
		
	}
	
}
