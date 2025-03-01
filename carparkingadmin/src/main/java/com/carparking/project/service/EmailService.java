package com.carparking.project.service;

import com.carparking.project.entities.Login;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

@Service
public class EmailService {

    @Autowired
    private JavaMailSender mailSender;


    public void sendEmailAdmin(Login login){

        SimpleMailMessage message = new SimpleMailMessage();
        message.setFrom("007parkit@gmail.com");  // Replace with your email
        message.setTo(login.getEmail());
        message.setSubject("Welcome Admin:Please find your credential");
        message.setText("Your UserName is"+ login.getEmail()+"Your Passsword is "+ login.getPassWord());

        mailSender.send(message);

    }

    public void sendEmailUser(Login login){

        SimpleMailMessage message = new SimpleMailMessage();
        message.setFrom("007parkit@gmail.com");  // Replace with your email
        message.setTo(login.getEmail());
        message.setSubject("Welcome User:Please find your credential");
        message.setText("Your UserName is"+ login.getEmail()+"Your Passsword is "+ login.getPassWord());

        mailSender.send(message);

    }


    public void sendEmailfornoca(String admin){

        SimpleMailMessage message = new SimpleMailMessage();
        message.setFrom("007parkit@gmail.com");  // Replace with your email
        message.setTo(admin);
        message.setSubject("inbuilt camera failed");
        message.setText("please attach the number plate manually");
        mailSender.send(message);

    }
}
