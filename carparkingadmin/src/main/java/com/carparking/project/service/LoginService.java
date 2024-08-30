package com.carparking.project.service;

import com.carparking.project.domain.UserDto;
import com.carparking.project.entities.User;
import com.carparking.project.repository.LoginRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Objects;

@Service
public class LoginService {

    @Autowired
    private LoginRepository loginRepository;

    @Autowired
    private EmailService emailService;


    public String login(UserDto userDto) throws Exception {
        User user =  loginRepository.findByEmailAndPassword(userDto.getEmail(),userDto.getPassword());
        if(Objects.nonNull(user)){
            return "User Is Valid";
        }
        else{
            throw new Exception("Invalid Credential");
        }
    }

    public String signUp(UserDto userDto, String ADMIN_USER) throws Exception {
        userDto.setRoleName(ADMIN_USER);
        User user = loginRepository.save(new User(userDto));
        if(Objects.nonNull(user)){
            emailService.sendEmail(user);
            return "Admin User Is Created";
        }
        else{
            throw new Exception("Operation Failed");
        }
    }


}
