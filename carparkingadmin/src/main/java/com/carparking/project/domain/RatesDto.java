package com.carparking.project.domain;

import javax.persistence.Entity;
import javax.persistence.Table;


public class RatesDto {

    private String googleLocation;
    private int duration;
    private int charge;
    private String adminName;

    // Constructors
    public RatesDto() {}

    public RatesDto(String googleLocation, int duration, int charge) {
        this.googleLocation = googleLocation;
        this.duration = duration;
        this.charge = charge;
    }

    // Getters and Setters
    public String getGoogleLocation() {
        return googleLocation;
    }

    public void setGoogleLocation(String googleLocation) {
        this.googleLocation = googleLocation;
    }

    public int getDuration() {
        return duration;
    }

    public String getAdminName() {
        return adminName;
    }

    public void setAdminName(String adminName) {
        this.adminName = adminName;
    }

    public void setDuration(int duration) {
        this.duration = duration;
    }

    public int getCharge() {
        return charge;
    }

    public void setCharge(int charge) {
        this.charge = charge;
    }

    // toString method
    @Override
    public String toString() {
        return "Rate{" +
                "googleLocation='" + googleLocation + '\'' +
                ", duration=" + duration +
                ", charge=" + charge +
                '}';
    }
}
