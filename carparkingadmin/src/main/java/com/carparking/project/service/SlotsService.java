package com.carparking.project.service;

import com.carparking.project.domain.FloorSlotDto;
import com.carparking.project.domain.SlotsDto;
import com.carparking.project.entities.Slots;
import com.carparking.project.repository.RatesRepository;
import com.carparking.project.repository.SlotsRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Objects;
import java.util.stream.Collectors;
import java.util.stream.Stream;

@Service
public class SlotsService {

    @Autowired
    SlotsRepository slotsRepository;

    @Autowired
    LoginService loginService;

    @Autowired
    RatesService ratesService;

    @Autowired
    private RoleService roleService;

    public String createSlots(SlotsDto slotsDto) throws Exception {
        Iterable<Slots> slots = slotsRepository.saveAll(getSlots(slotsDto));
        if(slots.iterator().hasNext()){
            loginService.signUp(slotsDto.getUserDto(),roleService.ADMIN_USER);
            ratesService.saveRates(slotsDto.getRatesDto(),slotsDto.getUserDto().getEmail());
            roleService.stageRoles(slotsDto.getRoleDto(),slotsDto.getUserDto().getEmail());
            return "Slots Added Successfully";
        }
        else{
            throw new Exception("Slots saving is  Failed");
        }
    }

    private List<Slots> getSlots(SlotsDto slotsDto) {
        List<Slots> slots = slotsDto.getFloorSlotDto().stream().flatMap(fs->createSlots(slotsDto,fs)).collect(Collectors.toUnmodifiableList());
        return slots;
    }

    public List<Slots> getAllSlots(String adminName){
        return slotsRepository.findByAdminName(adminName);
    }

    private Stream<Slots> createSlots(SlotsDto slotsDto, FloorSlotDto floorSlotDto){
       return floorSlotDto.getSlotNumber().stream().map(s->new Slots(slotsDto,s,floorSlotDto.getFloor()) );
    }

}
