package com.carparking.project;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.Map;

@RestController
public class AdruinoController {


    @PostMapping("/updateSensor")
    public void updateSensorData(@RequestParam Map<String, String> requestParams){
        System.out.println("I am in"+requestParams);
    }
}
