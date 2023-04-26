package com.ruoyi.biz.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 预约管理对象 tqcgl_reservation
 * 
 * @author ruoyi
 * @date 2023-04-25
 */
public class TqcglReservation extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 预约ID */
    private Long reservationId;

    /** 班次ID */
    @Excel(name = "班次ID")
    private Long shiftsId;

    /** 司机ID */
    @Excel(name = "司机ID")
    private Long driversId;

    /** 车长ID */
    @Excel(name = "车长ID")
    private Long leaderId;

    /** 员工(乘客)ID */
    @Excel(name = "员工(乘客)ID")
    private Long passengerId;

    /** 发车时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "发车时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date departureTime;

    /** 预约时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "预约时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date reservationTime;

    /** 预约状态1代表已预约，0代表已取消 */
    @Excel(name = "预约状态1代表已预约，0代表已取消")
    private Long reservationStatus;

    public void setReservationId(Long reservationId) 
    {
        this.reservationId = reservationId;
    }

    public Long getReservationId() 
    {
        return reservationId;
    }
    public void setShiftsId(Long shiftsId) 
    {
        this.shiftsId = shiftsId;
    }

    public Long getShiftsId() 
    {
        return shiftsId;
    }
    public void setDriversId(Long driversId) 
    {
        this.driversId = driversId;
    }

    public Long getDriversId() 
    {
        return driversId;
    }
    public void setLeaderId(Long leaderId) 
    {
        this.leaderId = leaderId;
    }

    public Long getLeaderId() 
    {
        return leaderId;
    }
    public void setPassengerId(Long passengerId) 
    {
        this.passengerId = passengerId;
    }

    public Long getPassengerId() 
    {
        return passengerId;
    }
    public void setDepartureTime(Date departureTime) 
    {
        this.departureTime = departureTime;
    }

    public Date getDepartureTime() 
    {
        return departureTime;
    }
    public void setReservationTime(Date reservationTime) 
    {
        this.reservationTime = reservationTime;
    }

    public Date getReservationTime() 
    {
        return reservationTime;
    }
    public void setReservationStatus(Long reservationStatus) 
    {
        this.reservationStatus = reservationStatus;
    }

    public Long getReservationStatus() 
    {
        return reservationStatus;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("reservationId", getReservationId())
            .append("shiftsId", getShiftsId())
            .append("driversId", getDriversId())
            .append("leaderId", getLeaderId())
            .append("passengerId", getPassengerId())
            .append("departureTime", getDepartureTime())
            .append("reservationTime", getReservationTime())
            .append("reservationStatus", getReservationStatus())
            .toString();
    }
}
