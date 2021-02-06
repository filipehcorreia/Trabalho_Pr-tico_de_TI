package home;

import java.util.*;
import javax.mail.*;
import javax.mail.internet.*;

public class Email {
	

	public void enviarMail(String mailadr,String key) {
		final String username = "ti20192020esg@gmail.com";
		final String password = "wearethechampions";

		Properties prop = new Properties();
		prop.put("mail.smtp.host", "smtp.gmail.com");
		prop.put("mail.smtp.port", "465");
		prop.put("mail.smtp.auth", "true");
		prop.put("mail.smtp.socketFactory.port", "465");
		prop.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");

		Session session = Session.getInstance(prop, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(username, password);
			}
		});

		try {

			Message message = new MimeMessage(session);
			message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(mailadr));
			message.setSubject("Atlum");
			message.setText("Olá," + "\n\n Para alterar a sua password escreva Após o /home \n ?action=forgotalterar&k="+key+" \n\n ");

			Transport.send(message);


		} catch (MessagingException e) {
			e.printStackTrace();
		}
	}
}
