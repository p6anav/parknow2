package com.carparking.project.service;

import com.carparking.project.domain.UserDto;
import com.carparking.project.entities.User;
import com.carparking.project.repository.LoginRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Objects;

@Service
public class AdminService {

    @Autowired
    LoginRepository loginRepository;

    public String login(UserDto userDto) throws Exception {
        User user =  loginRepository.findByEmailAndpassWord(userDto.getEmail(),userDto.getPassword());
        if(Objects.nonNull(user)){
            return "User Is Valid";
        }
        else{
            throw new Exception("Invalid Credential");
        }
    }
}
