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
 * @date 2023-04-28
 */
public class TqcglReservation extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 预约ID */
    private Long reservationId;

    /** 班次ID */
    @Excel(name = "班次ID")
    private Long shiftsId;

    /** 员工(乘客)ID */
    @Excel(name = "员工(乘客)ID")
    private Long passengerId;

    /** 搭乘时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "搭乘时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date reservationTime;

    /** 创建时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "创建时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date creationTime;

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
    public void setPassengerId(Long passengerId) 
    {
        this.passengerId = passengerId;
    }

    public Long getPassengerId() 
    {
        return passengerId;
    }
    public void setReservationTime(Date reservationTime) 
    {
        this.reservationTime = reservationTime;
    }

    public Date getReservationTime() 
    {
        return reservationTime;
    }
    public void setCreationTime(Date creationTime) 
    {
        this.creationTime = creationTime;
    }

    public Date getCreationTime() 
    {
        return creationTime;
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
            .append("passengerId", getPassengerId())
            .append("reservationTime", getReservationTime())
            .append("creationTime", getCreationTime())
            .append("reservationStatus", getReservationStatus())
            .toString();
    }
}
