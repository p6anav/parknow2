package com.carparking.project.domain;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.util.List;


public class SlotsDto {


    private List<FloorSlotDto> floorSlotDto;
    private String propertyName;
    private String city;
    private String district;
    private String state;
    private String country;
    private boolean slotAvailability;
    private String googleLocation;
    private String adminName;

    private UserDto userDto;
    private List<RoleDto> roleDto;
    private List<RatesDto> ratesDto;

    // Default constructor
    public SlotsDto() {}

    public List<FloorSlotDto> getFloorSlotDto() {
        return floorSlotDto;
    }

    public List<RatesDto> getRatesDto() {
        return ratesDto;
    }

    public void setRatesDto(List<RatesDto> ratesDto) {
        this.ratesDto = ratesDto;
    }

    public void setFloorSlotDto(List<FloorSlotDto> floorSlotDto) {
        this.floorSlotDto = floorSlotDto;
    }

    public UserDto getUserDto() {
        return userDto;
    }

    public void setUserDto(UserDto userDto) {
        this.userDto = userDto;
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

    public List<RoleDto> getRoleDto() {
        return roleDto;
    }

    public void setRoleDto(List<RoleDto> roleDto) {
        this.roleDto = roleDto;
    }

    @Override
    public String toString() {
        return "SlotsDto{" +
                "floorSlotDto=" + floorSlotDto +
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
}
