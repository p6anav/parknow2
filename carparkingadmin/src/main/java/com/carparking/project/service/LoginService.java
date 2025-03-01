package com.carparking.project.service;

import com.carparking.project.domain.UserDto;
import com.carparking.project.entities.Login;
import com.carparking.project.repository.LoginRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Objects;
import java.util.Optional;

@Service
public class LoginService {

    @Autowired
    private LoginRepository loginRepository;

    @Autowired
    private EmailService emailService;


    public String login(UserDto userDto) throws Exception {
        Login login =  loginRepository.findByEmailAndPassword(userDto.getEmail(),userDto.getPassword());
        if(Objects.nonNull(login)){
            login.setActive("ACTIVE");
            loginRepository.save(login);
            return "Login Is Valid";
        }
        else{
            throw new Exception("Invalid Credential");
        }
    }

    public void updateStatus(String errorcode,String email){
      Optional<Login> login =  loginRepository.findById(email);
      login.get().setRemarks(errorcode);
      loginRepository.save(login.get());
    }
    public String signUp(UserDto userDto, String ADMIN_USER) throws Exception {
        userDto.setRoleName(ADMIN_USER);
        Login login = loginRepository.save(new Login(userDto));
        if(Objects.nonNull(login)&& "ADMIN_USER".equals(ADMIN_USER)){
            emailService.sendEmailAdmin(login);
            return "Admin Login Is Created";
        }
        if(Objects.nonNull(login)&& "USER".equals(ADMIN_USER)){
            emailService.sendEmailUser(login);
            return "User Login Created";
        }
        else{
            throw new Exception("Operation Failed");
        }
    }


    public String logout(String emailid){
  Optional<Login> login = loginRepository.findById(emailid);
  login.get().setActive("");
        loginRepository.save(login.get());
  return "logout succesfull";
    }
}
