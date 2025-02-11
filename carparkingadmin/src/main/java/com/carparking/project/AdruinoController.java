package com.carparking.project;

import com.carparking.project.entities.Slots;
import com.carparking.project.helper.SlotsHelper;
import com.carparking.project.service.*;
import com.mysql.cj.util.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.Map;

@RestController
public class AdruinoController {


    @Autowired
    AdruinoService adruinoService;

    @Autowired
    ProfileService profileService;

    @PostMapping("/updateSensor")
    public void updateSensorData(@RequestParam Map<String, String> requestParams) {
        adruinoService.getSlot(requestParams);
    }
}
