package com.carparking.project.entities;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name = "profile")
public class Profile {

    @Id
    private Long vehicleNumber;

    private Date bookingDate;

    private String userEmailId;

    private Boolean paidStatus;

    private String allocatedSlotNumber;

    private String bookingSource;

    private Integer durationOfAllocation;

    private String roleName;


    // Getters and Setters
    public Profile(Long vehicleNumber, Date bookingDate, String userEmailId, Boolean paidStatus, String allocatedSlotNumber, String bookingSource, Integer durationOfAllocation, String roleName) {
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

    public Long getVehicleNumber() {
        return vehicleNumber;
    }

    public void setVehicleNumber(Long vehicleNumber) {
        this.vehicleNumber = vehicleNumber;
    }

    public Date getBookingDate() {
        return bookingDate;
    }

    public void setBookingDate(Date bookingDate) {
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
