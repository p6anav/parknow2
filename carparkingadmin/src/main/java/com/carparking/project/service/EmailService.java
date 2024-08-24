package com.carparking.project.service;

import com.carparking.project.entities.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

@Service
public class EmailService {

    @Autowired
    private JavaMailSender mailSender;

    public void sendEmail(User user){

        SimpleMailMessage message = new SimpleMailMessage();
        message.setFrom("007parkit@gmail.com");  // Replace with your email
        message.setTo(user.getEmail());
        message.setSubject("Welcome Admin:Please find your credential");
        message.setText("Your UserName is"+user.getEmail()+"Your Passsword is "+user.getPassWord());

        mailSender.send(message);

    }
}
