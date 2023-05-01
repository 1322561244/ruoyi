package com.ruoyi.biz.domain;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import java.util.Date;

/**
 * 预约管理对象 tqcgl_reservation
 *
 * @author ruoyi
 * @date 2023-04-28
 */
public class TqcglReservation extends BaseEntity {
    private static final long serialVersionUID = 1L;

    /**
     * 预约ID
     */
    private Long reservationId;

    /**
     * 班次ID
     */
    @Excel(name = "班次ID")
    private Long shiftsId;

    /**
     * 员工(乘客)ID
     */
    @Excel(name = "员工(乘客)ID")
    private Long passengerId;

    /**
     * 搭乘时间 --- 预约的发车时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "搭乘时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date reservationTime;

    /**
     * 创建时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "创建时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date creationTime;

    /**
     * 预约状态1代表已预约，0代表已取消
     */
    @Excel(name = "预约状态1代表已预约，0代表已取消")
    private Long reservationStatus;

    /**
     * 添加的部分
     ***/
    /** 班次名 */
    @Excel(name = "班次名")
    private String shiftsName;

    /** 车牌号 */
    @Excel(name = "车牌号")
    private String vehiclesLicensePlate;

    /** 司机姓名 */
    @Excel(name = "司机姓名")
    private String driversName;

    /** 司机联系电话 */
    @Excel(name = "司机联系电话")
    private String driversPhone;

    /** 车长姓名 */
    @Excel(name = "车长姓名")
    private String leaderName;

    /** 车长联系电话 */
    @Excel(name = "车长联系电话")
    private String leaderPhone;

    /** 乘客名 */
    @Excel(name = "乘客名")
    private String passengerName;

    /** 乘客所属部门 */
    @Excel(name = "乘客所属部门")
    private String deptName;

    /** 乘客所属企业 */
    @Excel(name = "乘客所属企业")
    private String enterpriseName;

    /** 乘客联系电话 */
    @Excel(name = "乘客联系电话")
    private String passengerPhone;

    /**
     * 添加部分的get、set方法
     */
    public void setShiftsName(String shiftsName)
    {
        this.shiftsName = shiftsName;
    }

    public String getShiftsName()
    {
        return shiftsName;
    }
    public void setVehiclesLicensePlate(String vehiclesLicensePlate)
    {
        this.vehiclesLicensePlate = vehiclesLicensePlate;
    }

    public String getVehiclesLicensePlate()
    {
        return vehiclesLicensePlate;
    }
    public void setDriversName(String driversName)
    {
        this.driversName = driversName;
    }

    public String getDriversName()
    {
        return driversName;
    }
    public void setDriversPhone(String driversPhone)
    {
        this.driversPhone = driversPhone;
    }

    public String getDriversPhone()
    {
        return driversPhone;
    }
    public void setLeaderName(String leaderName)
    {
        this.leaderName = leaderName;
    }

    public String getLeaderName()
    {
        return leaderName;
    }
    public void setLeaderPhone(String leaderPhone)
    {
        this.leaderPhone = leaderPhone;
    }

    public String getLeaderPhone()
    {
        return leaderPhone;
    }
    public void setPassengerName(String passengerName)
    {
        this.passengerName = passengerName;
    }

    public String getPassengerName()
    {
        return passengerName;
    }
    public void setDeptName(String deptName)
    {
        this.deptName = deptName;
    }

    public String getDeptName()
    {
        return deptName;
    }
    public void setEnterpriseName(String enterpriseName)
    {
        this.enterpriseName = enterpriseName;
    }

    public String getEnterpriseName()
    {
        return enterpriseName;
    }
    public void setPassengerPhone(String passengerPhone)
    {
        this.passengerPhone = passengerPhone;
    }

    public String getPassengerPhone()
    {
        return passengerPhone;
    }
    /***************/
    public void setReservationId(Long reservationId) {
        this.reservationId = reservationId;
    }

    public Long getReservationId() {
        return reservationId;
    }

    public void setShiftsId(Long shiftsId) {
        this.shiftsId = shiftsId;
    }

    public Long getShiftsId() {
        return shiftsId;
    }

    public void setPassengerId(Long passengerId) {
        this.passengerId = passengerId;
    }

    public Long getPassengerId() {
        return passengerId;
    }

    public void setReservationTime(Date reservationTime) {
        this.reservationTime = reservationTime;
    }

    public Date getReservationTime() {
        return reservationTime;
    }

    public void setCreationTime(Date creationTime) {
        this.creationTime = creationTime;
    }

    public Date getCreationTime() {
        return creationTime;
    }

    public void setReservationStatus(Long reservationStatus) {
        this.reservationStatus = reservationStatus;
    }

    public Long getReservationStatus() {
        return reservationStatus;
    }


    /**
     * 添加的部分
     ***/
    @Override
    public String toString() {
        return new ToStringBuilder(this, ToStringStyle.MULTI_LINE_STYLE)
                .append("reservationId", getReservationId())
                .append("shiftsId", getShiftsId())
                .append("passengerId", getPassengerId())
                .append("reservationTime", getReservationTime())
                .append("creationTime", getCreationTime())
                .append("reservationStatus", getReservationStatus())
                .append("shiftsName", getShiftsName())
                .append("vehiclesLicensePlate", getVehiclesLicensePlate())
                .append("driversName", getDriversName())
                .append("driversPhone", getDriversPhone())
                .append("leaderName", getLeaderName())
                .append("leaderPhone", getLeaderPhone())
                .append("reservationTime", getReservationTime())
                .append("passengerName", getPassengerName())
                .append("deptName", getDeptName())
                .append("enterpriseName", getEnterpriseName())
                .append("passengerPhone", getPassengerPhone())
                .toString();
    }
}
