package com.ruoyi.WeChat.domain;

import com.ruoyi.common.annotation.Excel;

import java.util.Date;

public class WeChatReservation {

    private static final long serialVersionUID = 1L;
    /**
     * 班次ID，自增长
     */
    private Long shiftsId;

    /**
     * 班次名称
     */
    @Excel(name = "班次名称")
    private String shiftsName;

    @Excel(name = "开始时间")
    private Date startTime;

    @Excel(name = "结束")
    private Date endTime;

    @Excel(name = "用户Id")
    private Long userId;

    @Excel(name = "班次的可预约状态")
    private int shiftsStatus;

    @Excel(name = "班次的日期")
    private Date dateTime;

    @Excel(name = "班次发车时间")
    private Date shiftsDepartureTime;

    @Excel(name = "车辆的限载人数")
    private int vehiclesCapacity;

    @Excel(name="用户名")
    private String userName;

    @Excel(name="预约id")
    private Long reservationId;

    @Excel(name="乘客的id")
    private Long passengerId;

    @Excel(name="该预约创建的时间")
    private Date creationTime;

    @Excel(name="预约的日期")
    private Date reservationTime;

    public Long getShiftsId() {
        return shiftsId;
    }

    public void setShiftsId(Long shiftsId) {
        this.shiftsId = shiftsId;
    }

    public String getShiftsName() {
        return shiftsName;
    }

    public void setShiftsName(String shiftsName) {
        this.shiftsName = shiftsName;
    }

    public Date getStartTime() {
        return startTime;
    }

    public void setStartTime(Date startTime) {
        this.startTime = startTime;
    }

    public Date getEndTime() {
        return endTime;
    }

    public void setEndTime(Date endTime) {
        this.endTime = endTime;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public int getShiftsStatus() {
        return shiftsStatus;
    }

    public void setShiftsStatus(int shiftsStatus) {
        this.shiftsStatus = shiftsStatus;
    }

    public Date getDateTime() {
        return dateTime;
    }

    public void setDateTime(Date dateTime) {
        this.dateTime = dateTime;
    }


    public Long getReservationId() {
        return reservationId;
    }

    public void setReservationId(Long reservationId) {
        this.reservationId = reservationId;
    }

    public Date getShiftsDepartureTime() {
        return shiftsDepartureTime;
    }

    public void setShiftsDepartureTime(Date shiftsDepartureTime) {
        this.shiftsDepartureTime = shiftsDepartureTime;
    }

    public int getVehiclesCapacity() {
        return vehiclesCapacity;
    }

    public void setVehiclesCapacity(int vehiclesCapacity) {
        this.vehiclesCapacity = vehiclesCapacity;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public Long getPassengerId() {
        return passengerId;
    }

    public void setPassengerId(Long passengerId) {
        this.passengerId = passengerId;
    }

    public Date getCreationTime() {
        return creationTime;
    }

    public void setCreationTime(Date creationTime) {
        this.creationTime = creationTime;
    }

    public Date getReservationTime() {
        return reservationTime;
    }

    public void setReservationTime(Date reservationTime) {
        this.reservationTime = reservationTime;
    }

    @Override
    public String toString() {
        return "WeChatReservation{" +
                "shiftsId=" + shiftsId +
                ", shiftsName='" + shiftsName + '\'' +
                ", startTime=" + startTime +
                ", endTime=" + endTime +
                ", userId=" + userId +
                ", shiftsStatus=" + shiftsStatus +
                ", dateTime=" + dateTime +
                ", shiftsDepartureTime=" + shiftsDepartureTime +
                ", vehiclesCapacity=" + vehiclesCapacity +
                ", userName='" + userName + '\'' +
                ", reservationId=" + reservationId +
                ", passengerId=" + passengerId +
                ", creationTime=" + creationTime +
                ", reservationTime=" + reservationTime +
                '}';
    }
}
