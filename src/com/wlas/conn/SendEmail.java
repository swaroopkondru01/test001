package com.wlas.conn;

//File Name SendEmail.java

import java.util.*;
import javax.mail.*;
import javax.mail.internet.*;
import javax.activation.*;



public class SendEmail {

	public static String toMail( String toemail, String msg ) {
		final String username = "nano.anu5@gmail.com";
		final String password = "fwesikgewrhorzji";

		Properties props = new Properties();
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.port", "587");
		props.put("mail.debug", "true");
		Session session = Session.getInstance(props,
		  new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(username, password);
			}
		  });

		try {

			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress("nano.anu5@gmail.com"));
			message.setRecipients(Message.RecipientType.TO,
				InternetAddress.parse(toemail));
			message.setSubject("Password Reset");
			message.setText("Dear User,"
				+ "\n\n "+msg +"\n\n Thanks \n\n WLAS Team");

			Transport.send(message);

			System.out.println("Done");

		} catch (MessagingException e) {
			throw new RuntimeException(e);
		}
		
		return "true";
	}
}


