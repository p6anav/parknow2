package com.carparking.project.entities;

import javax.persistence.*;
import java.time.LocalDateTime;
import java.util.Date;

@Entity
@Table(name = "profile")
public class Profile {

    @Id
    @Column(name = "vehicle_number", unique = true)
    private String vehicleNumber;

    private LocalDateTime bookingDate;

    private String userEmailId;

    private String userName;

    private Boolean paidStatus;

    private String allocatedSlotNumber;

    private String bookingSource;

    private Integer durationOfAllocation;

    @Override
    public String toString() {
        return "Profile{" +
                "vehicleNumber='" + vehicleNumber + '\'' +
                ", bookingDate=" + bookingDate +
                ", userEmailId='" + userEmailId + '\'' +
                ", userName='" + userName + '\'' +
                ", paidStatus=" + paidStatus +
                ", allocatedSlotNumber='" + allocatedSlotNumber + '\'' +
                ", bookingSource='" + bookingSource + '\'' +
                ", durationOfAllocation=" + durationOfAllocation +
                ", roleName='" + roleName + '\'' +
                '}';
    }

    private String roleName;

    public Profile(){

    }

    // Getters and Setters
    public Profile(String vehicleNumber, LocalDateTime bookingDate, String userEmailId, Boolean paidStatus, String allocatedSlotNumber, String bookingSource, Integer durationOfAllocation, String roleName) {
        this.vehicleNumber = vehicleNumber;
        this.bookingDate = bookingDate;
        this.userEmailId = userEmailId;
        this.paidStatus = paidStatus;
        this.allocatedSlotNumber = allocatedSlotNumber;
        this.bookingSource = bookingSource;
        this.durationOfAllocation = durationOfAllocation;
        this.roleName = roleName;
    }


    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }

    public String getVehicleNumber() {
        return vehicleNumber;
    }

    public void setVehicleNumber(String vehicleNumber) {
        this.vehicleNumber = vehicleNumber;
    }

    public LocalDateTime getBookingDate() {
        return bookingDate;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public void setBookingDate(LocalDateTime bookingDate) {
        this.bookingDate = bookingDate;
    }

    public String getUserEmailId() {
        return userEmailId;
    }

    public void setUserEmailId(String userEmailId) {
        this.userEmailId = userEmailId;
    }

    public Boolean getPaidStatus() {
        return paidStatus;
    }

    public void setPaidStatus(Boolean paidStatus) {
        this.paidStatus = paidStatus;
    }

    public String getAllocatedSlotNumber() {
        return allocatedSlotNumber;
    }

    public void setAllocatedSlotNumber(String allocatedSlotNumber) {
        this.allocatedSlotNumber = allocatedSlotNumber;
    }

    public String getBookingSource() {
        return bookingSource;
    }

    public void setBookingSource(String bookingSource) {
        this.bookingSource = bookingSource;
    }

    public Integer getDurationOfAllocation() {
        return durationOfAllocation;
    }

    public void setDurationOfAllocation(Integer durationOfAllocation) {
        this.durationOfAllocation = durationOfAllocation;
    }
}
