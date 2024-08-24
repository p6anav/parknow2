package com.carparking.project.entities;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "actions")
class Action {

    @Id
    private String vehicleNumber;

    private String blacklisted;
    private String actionDate;
    private String emailId;

    // Default constructor
    public Action() {}

    // Constructor with fields
    public Action(String vehicleNumber, String blacklisted, String actionDate, String emailId) {
        this.vehicleNumber = vehicleNumber;
        this.blacklisted = blacklisted;
        this.actionDate = actionDate;
        this.emailId = emailId;
    }

    // Getters and Setters
    public String getVehicleNumber() {
        return vehicleNumber;
    }

    public void setVehicleNumber(String vehicleNumber) {
        this.vehicleNumber = vehicleNumber;
    }

    public String getBlacklisted() {
        return blacklisted;
    }

    public void setBlacklisted(String blacklisted) {
        this.blacklisted = blacklisted;
    }

    public String getActionDate() {
        return actionDate;
    }

    public void setActionDate(String actionDate) {
        this.actionDate = actionDate;
    }

    public String getEmailId() {
        return emailId;
    }

    public void setEmailId(String emailId) {
        this.emailId = emailId;
    }

    // toString method for easy debugging
    @Override
    public String toString() {
        return "Action{" +
                "vehicleNumber='" + vehicleNumber + '\'' +
                ", blacklisted='" + blacklisted + '\'' +
                ", actionDate='" + actionDate + '\'' +
                ", emailId='" + emailId + '\'' +
                '}';
    }
}
