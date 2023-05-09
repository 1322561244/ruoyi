package com.ruoyi.Android.domain;

import java.util.Date;

public class AppLeader {
    private Long leaderId;
    private Long shiftsId;
    private Long driversId;
    private Long vehiclesId;
    private Long passengerId;
    private Date shiftsDepartureTime;
    private Date reservationTime;
    private Date dateTime;
    private String shiftsName;
    private String driversName;
    private String driversPhone;
    private String vehiclesLicensePlate;
    private String passengerName;
    private int reservationStatus;

    private String userName;

    private String cancelOperator;

    private Date cancelDateTime;

    public Long getLeaderId() {
        return leaderId;
    }

    public void setLeaderId(Long leaderId) {
        this.leaderId = leaderId;
    }

    public Long getShiftsId() {
        return shiftsId;
    }

    public void setShiftsId(Long shiftsId) {
        this.shiftsId = shiftsId;
    }

    public Long getDriversId() {
        return driversId;
    }

    public void setDriversId(Long driversId) {
        this.driversId = driversId;
    }

    public Long getVehiclesId() {
        return vehiclesId;
    }

    public void setVehiclesId(Long vehiclesId) {
        this.vehiclesId = vehiclesId;
    }

    public Long getPassengerId() {
        return passengerId;
    }

    public void setPassengerId(Long passengerId) {
        this.passengerId = passengerId;
    }

    public Date getShiftsDepartureTime() {
        return shiftsDepartureTime;
    }

    public void setShiftsDepartureTime(Date shiftsDepartureTime) {
        this.shiftsDepartureTime = shiftsDepartureTime;
    }

    public Date getReservationTime() {
        return reservationTime;
    }

    public void setReservationTime(Date reservationTime) {
        this.reservationTime = reservationTime;
    }

    public Date getDateTime() {
        return dateTime;
    }

    public void setDateTime(Date dateTime) {
        this.dateTime = dateTime;
    }

    public String getShiftsName() {
        return shiftsName;
    }

    public void setShiftsName(String shiftsName) {
        this.shiftsName = shiftsName;
    }

    public String getDriversName() {
        return driversName;
    }

    public void setDriversName(String driversName) {
        this.driversName = driversName;
    }

    public String getDriversPhone() {
        return driversPhone;
    }

    public void setDriversPhone(String driversPhone) {
        this.driversPhone = driversPhone;
    }

    public String getVehiclesLicensePlate() {
        return vehiclesLicensePlate;
    }

    public void setVehiclesLicensePlate(String vehiclesLicensePlate) {
        this.vehiclesLicensePlate = vehiclesLicensePlate;
    }

    public String getPassengerName() {
        return passengerName;
    }

    public void setPassengerName(String passengerName) {
        this.passengerName = passengerName;
    }

    public int getReservationStatus() {
        return reservationStatus;
    }

    public void setReservationStatus(int reservationStatus) {
        this.reservationStatus = reservationStatus;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getCancelOperator() {
        return cancelOperator;
    }

    public void setCancelOperator(String cancelOperator) {
        this.cancelOperator = cancelOperator;
    }

    public Date getCancelDateTime() {
        return cancelDateTime;
    }

    public void setCancelDateTime(Date cancelDateTime) {
        this.cancelDateTime = cancelDateTime;
    }

    @Override
    public String toString() {
        return "AppLeader{" +
                "leaderId=" + leaderId +
                ", shiftsId=" + shiftsId +
                ", driversId=" + driversId +
                ", vehiclesId=" + vehiclesId +
                ", passengerId=" + passengerId +
                ", shiftsDepartureTime=" + shiftsDepartureTime +
                ", reservationTime=" + reservationTime +
                ", dateTime=" + dateTime +
                ", shiftsName='" + shiftsName + '\'' +
                ", driversName='" + driversName + '\'' +
                ", driversPhone='" + driversPhone + '\'' +
                ", vehiclesLicensePlate='" + vehiclesLicensePlate + '\'' +
                ", passengerName='" + passengerName + '\'' +
                ", reservationStatus=" + reservationStatus +
                ", userName='" + userName + '\'' +
                ", cancelOperator='" + cancelOperator + '\'' +
                ", cancelDateTime=" + cancelDateTime +
                '}';
    }
}
