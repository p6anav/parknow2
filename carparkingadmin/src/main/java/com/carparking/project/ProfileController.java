package com.carparking.project;

import com.carparking.project.service.ProfileService;
import com.fasterxml.jackson.core.JsonProcessingException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class ProfileController {

    @Autowired
    ProfileService profileService;



@GetMapping("/updateprofile")
    public ResponseEntity<String> updateProfile() throws JsonProcessingException {

        return new ResponseEntity<String>(profileService.updateProfile(), HttpStatus.valueOf(200));
    }
}
