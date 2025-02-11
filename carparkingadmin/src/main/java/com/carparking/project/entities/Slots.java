package com.carparking.project.entities;

import com.carparking.project.domain.SlotsDto;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "slots")
public class Slots implements Comparable<Slots>{

    @Id
    private String slotNumber;
    private String floor;
    private String propertyName;
    private String city;
    private String district;
    private String state;
    private String country;
    private boolean slotAvailability;
    private String googleLocation;
    private String adminName;

    // Default constructor
    public Slots() {}


    public Slots(SlotsDto slotsDto,String slotNumber, String floor) {
        this.slotNumber = slotNumber;
        this.floor = floor;
        this.propertyName = slotsDto.getPropertyName();
        this.city = slotsDto.getCity();
        this.district = slotsDto.getDistrict();
        this.state = slotsDto.getState();
        this.country = slotsDto.getCountry();
        this.slotAvailability = slotsDto.isSlotAvailability();
        this.googleLocation = slotsDto.getGoogleLocation();
        this.adminName = slotsDto.getAdminName();
    }

    // Getters and Setters
    public String getSlotNumber() {
        return slotNumber;
    }

    public void setSlotNumber(String slotNumber) {
        this.slotNumber = slotNumber;
    }

    public String getFloor() {
        return floor;
    }

    public void setFloor(String floor) {
        this.floor = floor;
    }

    public String getPropertyName() {
        return propertyName;
    }

    public void setPropertyName(String propertyName) {
        this.propertyName = propertyName;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getDistrict() {
        return district;
    }

    public void setDistrict(String district) {
        this.district = district;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public boolean isSlotAvailability() {
        return slotAvailability;
    }

    public void setSlotAvailability(boolean slotAvailability) {
        this.slotAvailability = slotAvailability;
    }

    public String getGoogleLocation() {
        return googleLocation;
    }

    public void setGoogleLocation(String googleLocation) {
        this.googleLocation = googleLocation;
    }

    public String getAdminName() {
        return adminName;
    }

    public void setAdminName(String adminName) {
        this.adminName = adminName;
    }

    // toString method for easy debugging
    @Override
    public String toString() {
        return "Slot{" +
                "slotNumber='" + slotNumber + '\'' +
                ", floor='" + floor + '\'' +
                ", propertyName='" + propertyName + '\'' +
                ", city='" + city + '\'' +
                ", district='" + district + '\'' +
                ", state='" + state + '\'' +
                ", country='" + country + '\'' +
                ", slotAvailability=" + slotAvailability +
                ", googleLocation='" + googleLocation + '\'' +
                ", adminName='" + adminName + '\'' +
                '}';
    }

    @Override
    public int compareTo(Slots other) {
        return this.slotNumber.compareTo(other.slotNumber); // Ascending order
    }
}
