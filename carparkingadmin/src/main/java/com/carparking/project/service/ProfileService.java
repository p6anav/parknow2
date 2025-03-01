package com.carparking.project.service;


import com.carparking.project.domain.Answer;
import com.carparking.project.domain.FormContent;
import com.carparking.project.domain.JsonResponse;
import com.carparking.project.domain.UserDto;
import com.carparking.project.entities.Profile;
import com.carparking.project.helper.JotFormSubmissions;
import com.carparking.project.helper.SlotsHelper;
import com.carparking.project.repository.ProfileRepository;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Service
public class ProfileService {


@Autowired
ObjectMapper objectMapper;

@Autowired
LoginService loginService;

    @Autowired
    ProfileRepository profileRepository;

    @Autowired
    JotFormSubmissions jotFormSubmissions;

    public Profile saveProfile(String vehiclenumbe,String slot,String bookingsource){
        return profileRepository.save(new Profile(vehiclenumbe, LocalDateTime.now(),"",false,slot,"ON-SITE",Integer.parseInt("1"),"USER"));
    }


    public List<Profile> getProfiles(){
        List<Profile> list = new ArrayList<>();
         profileRepository.findAll().iterator().forEachRemaining(list::add);
         return list;
    }



    public  String updateProfile() throws JsonProcessingException {
      String jsonResponse =   jotFormSubmissions.getFormResponse();
      JsonResponse jsonResponse1 =objectMapper.readValue(jsonResponse, JsonResponse.class);
     List<FormContent> formdata = jsonResponse1.getContent();
        Map<String, Answer> answers =   formdata.stream().map(form->form.getAnswers()).findFirst().get();
        Answer vehicleData = answers.get("5");
        Answer email = answers.get("4");
        Answer fullName = answers.get("3");

        System.out.println(answers);
        String vehiclenumber = vehicleData.getAnswer().toString().replaceAll("\\s","");
        String emailData =email.getAnswer().toString().replaceAll("\\s","");
        String fullNamePrettyFormat = fullName.getPrettyFormat();
        ;        String emailinfo = emailData.replace("\"", "");  // Remove all double quotes
        String output = vehiclenumber.replace("\"", "");  // Remove all double quotes
        try {
            List<Profile> profiles = new ArrayList<>();
             profileRepository.findAll().forEach(profiles::add);
           Profile profile =   profiles.stream().filter(p->p.getVehicleNumber().equals(output.toLowerCase())).collect(Collectors.toList()).get(0);
            System.out.println(profile);
            profile.setUserEmailId(emailinfo);
            profile.setUserName(fullNamePrettyFormat);
            profileRepository.save(profile);
            UserDto userDto =new UserDto();
            userDto.setEmail(emailinfo);
            userDto.setRoleName("USER");
            userDto.setPassword(String.valueOf(Math.random())+"abc");
            userDto.setActive("");
            loginService.signUp(userDto,"USER");
        }
        catch (Exception e){
            System.out.println("e==="+e.getMessage());

        }
        return  null;
    }




}
