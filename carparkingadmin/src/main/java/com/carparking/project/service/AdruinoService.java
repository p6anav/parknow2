package com.carparking.project.service;

import com.carparking.project.entities.Slots;
import com.carparking.project.helper.SlotsHelper;
import com.mysql.cj.util.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Map;

@Service
public class AdruinoService {

    @Autowired
    private ImageService imageService;

    @Autowired
    private SlotsHelper slotsHelper;

    @Autowired
    private EmailService emailService;

    @Autowired
    private ProfileService profileService;

    @Autowired
    private LoginService loginService;



    public void getSlot(Map<String, String> requestParams){
        System.out.println("I am in"+requestParams);
        String vehicleno = imageService.getVehicleNumber();
        Slots slots=  slotsHelper.parkCar(vehicleno);
        String activeUser = slotsHelper.getActiveuser();
        if(StringUtils.isNullOrEmpty(vehicleno)){
            emailService.sendEmailfornoca(activeUser);
            profileService.saveProfile(vehicleno,slots.getSlotNumber(),"ADMIN");
            loginService.updateStatus("ECF",activeUser);
        }
        else{
            profileService.saveProfile(vehicleno,slots.getSlotNumber(),"ADMIN");
        }
    }
}
