package com.carparking.project;

import com.carparking.project.domain.SlotsDto;
import com.carparking.project.entities.Slots;
import com.carparking.project.service.SlotsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
public class SlotsController {

    @Autowired
    SlotsService slotsService;

    @GetMapping("/slots")
    public ResponseEntity<List<Slots>> getAllSlots(@RequestParam String adminName){
        return ResponseEntity.ok(slotsService.getAllSlots(adminName));
    }

    @PostMapping("/slotEnroll")
    public ResponseEntity<String> enrollSlots(@RequestBody SlotsDto slotsDto) throws Exception {
        return ResponseEntity.ok(slotsService.createSlots(slotsDto));
    }

}
