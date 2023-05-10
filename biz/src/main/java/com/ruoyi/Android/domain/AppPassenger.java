package com.ruoyi.Android.domain;

import com.ruoyi.common.annotation.Excel;
import org.springframework.data.annotation.Id;



public class AppPassenger {

    @Excel(name = "passenger_id")
    private Long passengerId;

    @Excel(name = "passenger_photo1")
    private String passengerPhoto1;


    @Excel(name = "passenger_photo2")
    private String passengerPhoto2;

    @Excel(name = "passenger_photo3")
    private String passengerPhoto3;

    public Long getPassengerId() {
        return passengerId;
    }

    public void setPassengerId(Long passengerId) {
        this.passengerId = passengerId;
    }

    public String getPassengerPhoto1() {
        return passengerPhoto1;
    }

    public void setPassengerPhoto1(String passengerPhoto1) {
        this.passengerPhoto1 = passengerPhoto1;
    }

    public String getPassengerPhoto2() {
        return passengerPhoto2;
    }

    public void setPassengerPhoto2(String passengerPhoto2) {
        this.passengerPhoto2 = passengerPhoto2;
    }

    public String getPassengerPhoto3() {
        return passengerPhoto3;
    }

    public void setPassengerPhoto3(String passengerPhoto3) {
        this.passengerPhoto3 = passengerPhoto3;
    }

    @Override
    public String toString() {
        return "AppPassenger{" +
                "passengerId=" + passengerId +
                ", passengerPhoto1='" + passengerPhoto1 + '\'' +
                ", passengerPhoto2='" + passengerPhoto2 + '\'' +
                ", passengerPhoto3='" + passengerPhoto3 + '\'' +
                '}';
    }
}
