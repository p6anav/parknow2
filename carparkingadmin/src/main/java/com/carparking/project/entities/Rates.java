package com.carparking.project.entities;

import com.carparking.project.domain.RatesDto;

import javax.persistence.*;

@Entity
@Table(name="rates")
public class Rates {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String googleLocation;
    private int duration;
    private int charge;
    private String adminName;

    // Constructors
    public Rates() {}

    public Rates(RatesDto ratesDto,String emailId) {
        this.googleLocation = ratesDto.getGoogleLocation();
        this.duration = ratesDto.getDuration();
        this.charge = ratesDto.getCharge();
        this.adminName = emailId;
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
