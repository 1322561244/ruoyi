package com.ruoyi.biz.domain;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import java.util.Date;

/**
 * 班次管理对象 tqcgl_shifts
 *
 * @author ruoyi
 * @date 2023-04-28
 */
public class TqcglShifts extends BaseEntity {
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

    /**
     * 发车时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "发车时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date shiftsDepartureTime;

    /**
     * 车长ID
     */
    @Excel(name = "车长ID")
    private Long leaderId;

    /**
     * 司机ID
     */
    @Excel(name = "司机ID")
    private Long driversId;

    /**
     * 车辆ID
     */
    @Excel(name = "车辆ID")
    private Long vehiclesId;


    /**
     * 车长名
     */
    @Excel(name = "车长名")
    private String leaderName;

    /**
     * 车长电话
     */
    @Excel(name = "车长电话")
    private String leaderPhone;

    /**
     * 司机名
     */
    @Excel(name = "司机名")
    private String driversName;

    /**
     * 司机联系电话
     */
    @Excel(name = "司机联系电话")
    private String driversPhone;

    /**
     * 车牌号
     */
    @Excel(name = "车牌号")
    private String vehiclesLicensePlate;


    public void setLeaderName(String leaderName) {
        this.leaderName = leaderName;
    }

    public String getLeaderName() {
        return leaderName;
    }

    public void setLeaderPhone(String leaderPhone) {
        this.leaderPhone = leaderPhone;
    }

    public String getLeaderPhone() {
        return leaderPhone;
    }

    public void setDriversName(String driversName) {
        this.driversName = driversName;
    }

    public String getDriversName() {
        return driversName;
    }

    public void setDriversPhone(String driversPhone) {
        this.driversPhone = driversPhone;
    }

    public String getDriversPhone() {
        return driversPhone;
    }

    public void setVehiclesLicensePlate(String vehiclesLicensePlate) {
        this.vehiclesLicensePlate = vehiclesLicensePlate;
    }

    public String getVehiclesLicensePlate() {
        return vehiclesLicensePlate;
    }


    public void setShiftsId(Long shiftsId) {
        this.shiftsId = shiftsId;
    }

    public Long getShiftsId() {
        return shiftsId;
    }

    public void setShiftsName(String shiftsName) {
        this.shiftsName = shiftsName;
    }

    public String getShiftsName() {
        return shiftsName;
    }

    public void setShiftsDepartureTime(Date shiftsDepartureTime) {
        this.shiftsDepartureTime = shiftsDepartureTime;
    }

    public Date getShiftsDepartureTime() {
        return shiftsDepartureTime;
    }

    public void setLeaderId(Long leaderId) {
        this.leaderId = leaderId;
    }

    public Long getLeaderId() {
        return leaderId;
    }

    public void setDriversId(Long driversId) {
        this.driversId = driversId;
    }

    public Long getDriversId() {
        return driversId;
    }

    public void setVehiclesId(Long vehiclesId) {
        this.vehiclesId = vehiclesId;
    }

    public Long getVehiclesId() {
        return vehiclesId;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this, ToStringStyle.MULTI_LINE_STYLE)
                .append("shiftsId", getShiftsId())
                .append("shiftsName", getShiftsName())
                .append("shiftsDepartureTime", getShiftsDepartureTime())
                .append("leaderId", getLeaderId())
                .append("driversId", getDriversId())
                .append("vehiclesId", getVehiclesId())
                .append("leaderName", getLeaderName())
                .append("leaderPhone", getLeaderPhone())
                .append("driversName", getDriversName())
                .append("driversPhone", getDriversPhone())
                .append("vehiclesLicensePlate", getVehiclesLicensePlate())
                .toString();
    }
}
