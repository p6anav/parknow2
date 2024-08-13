package com.carparking.project.entities;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name = "profile")
public class Profile {

    @Id
    @Column(name = "vehicle_number")
    private Long vehicleNumber;

    @Column(name = "booking_date")
    private Date bookingDate;

    @Column(name = "user_email_id", length = 255)
    private String userEmailId;

    @Column(name = "paid_status")
    private Boolean paidStatus;

    @Column(name = "allocated_slot_number", length = 50)
    private String allocatedSlotNumber;

    @Column(name = "booking_source", length = 255)
    private String bookingSource;

    @Column(name = "duration_of_allocation")
    private Integer durationOfAllocation;

    // Getters and Setters

    public Profile(Long vehicleNumber, Date bookingDate, String userEmailId, Boolean paidStatus, String allocatedSlotNumber, String bookingSource, Integer durationOfAllocation) {
        this.vehicleNumber = vehicleNumber;
        this.bookingDate = bookingDate;
        this.userEmailId = userEmailId;
        this.paidStatus = paidStatus;
        this.allocatedSlotNumber = allocatedSlotNumber;
        this.bookingSource = bookingSource;
        this.durationOfAllocation = durationOfAllocation;
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
