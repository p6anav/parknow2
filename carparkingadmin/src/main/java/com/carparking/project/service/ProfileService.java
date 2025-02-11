package com.carparking.project.service;

import com.carparking.project.entities.Profile;
import com.carparking.project.helper.SlotsHelper;
import com.carparking.project.repository.ProfileRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;

@Service
public class ProfileService {


    @Autowired
    ProfileRepository profileRepository;


    public Profile saveProfile(String vehiclenumbe,String slot,String bookingsource){
        return profileRepository.save(new Profile(vehiclenumbe, LocalDateTime.now(),"",false,slot,"ON-SITE",Integer.parseInt("1"),"USER"));
    }




}
