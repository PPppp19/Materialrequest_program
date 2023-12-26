/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.br.utility;

import java.util.Properties;
//import static javafx.scene.text.Font.font;
//import static javafx.scene.text.Font.font;
//import static javafx.scene.text.Font.font;
//import javax.activation.DataHandler;
//import javax.activation.DataSource;
//import javax.activation.FileDataSource;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;


/**
 *
 * @author Phongsathon
 */
public class Send_mail {

        public static void Sendmail_ICT(String Emailict, String LinkCreate, String SubjectEmail) {

        final String auth_host = "mail.br-bangkokranch.com";
        final String auth_email = "itcenter@br-bangkokranch.com";
        final String auth_password = "10052508";

        Properties props = new Properties();
        props.put("mail.smtp.host", auth_host);
        props.put("mail.smtp.socketFactory.class",
                "javax.net.ssl.SSLSocketFactory");

        try {

            Session mailSession = Session.getInstance(props,
                    new javax.mail.Authenticator() {
                protected PasswordAuthentication
                        getPasswordAuthentication() {
                    return new PasswordAuthentication(auth_email, auth_password);
                }
            });

            Message message = new MimeMessage(mailSession);

            message.setFrom(new InternetAddress(auth_email)); // From

            /**
             * * Recipient **
             */
            message.setRecipients(Message.RecipientType.TO,
                    InternetAddress.parse(Emailict)); // To
            message.setSubject(SubjectEmail);
            message.setText(LinkCreate);
            message.setContent(LinkCreate, "text/html; charset=utf-8");

            Transport.send(message);

//            Updateheadrequest(reqno, DATENOW, cono, divi, Appname);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

    }
   
}
