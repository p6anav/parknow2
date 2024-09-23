package com.carparking.project;

import com.carparking.project.service.ImageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.Map;

@RestController
public class AdruinoController {

    @Autowired
    private ImageService imageService;

    @PostMapping("/updateSensor")
    public void updateSensorData(@RequestParam Map<String, String> requestParams){
        System.out.println("I am in"+requestParams);
    }
}
