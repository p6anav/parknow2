package com.carparking.project.domain;

import java.util.List;

public class FloorSlotDto {

    private List<String> slotNumber;
    private String floor;

    public FloorSlotDto(List<String> slotNumber, String floor) {
        this.slotNumber = slotNumber;
        this.floor = floor;
    }

    public List<String> getSlotNumber() {
        return slotNumber;
    }

    public void setSlotNumber(List<String> slotNumber) {
        this.slotNumber = slotNumber;
    }

    public String getFloor() {
        return floor;
    }

    public void setFloor(String floor) {
        this.floor = floor;
    }
}
