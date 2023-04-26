package com.ruoyi.biz.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 班次管理对象 tqcgl_shifts
 * 
 * @author ruoyi
 * @date 2023-04-25
 */
public class TqcglShifts extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 班次ID，自增长 */
    private Long shiftsId;

    /** 班次名称 */
    @Excel(name = "班次名称")
    private String shiftsName;

    /** 车牌号码 */
    @Excel(name = "车牌号码")
    private String shiftsPlateNumber;

    /** 发车时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "发车时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date shiftsDepartureTime;

    /** 车长ID */
    @Excel(name = "车长ID")
    private Long leaderId;

    /** 司机ID */
    @Excel(name = "司机ID")
    private Long driversId;

    /** 车辆ID */
    @Excel(name = "车辆ID")
    private Long vehiclesId;

    public void setShiftsId(Long shiftsId) 
    {
        this.shiftsId = shiftsId;
    }

    public Long getShiftsId() 
    {
        return shiftsId;
    }
    public void setShiftsName(String shiftsName) 
    {
        this.shiftsName = shiftsName;
    }

    public String getShiftsName() 
    {
        return shiftsName;
    }
    public void setShiftsPlateNumber(String shiftsPlateNumber) 
    {
        this.shiftsPlateNumber = shiftsPlateNumber;
    }

    public String getShiftsPlateNumber() 
    {
        return shiftsPlateNumber;
    }
    public void setShiftsDepartureTime(Date shiftsDepartureTime) 
    {
        this.shiftsDepartureTime = shiftsDepartureTime;
    }

    public Date getShiftsDepartureTime() 
    {
        return shiftsDepartureTime;
    }
    public void setLeaderId(Long leaderId) 
    {
        this.leaderId = leaderId;
    }

    public Long getLeaderId() 
    {
        return leaderId;
    }
    public void setDriversId(Long driversId) 
    {
        this.driversId = driversId;
    }

    public Long getDriversId() 
    {
        return driversId;
    }
    public void setVehiclesId(Long vehiclesId) 
    {
        this.vehiclesId = vehiclesId;
    }

    public Long getVehiclesId() 
    {
        return vehiclesId;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("shiftsId", getShiftsId())
            .append("shiftsName", getShiftsName())
            .append("shiftsPlateNumber", getShiftsPlateNumber())
            .append("shiftsDepartureTime", getShiftsDepartureTime())
            .append("leaderId", getLeaderId())
            .append("driversId", getDriversId())
            .append("vehiclesId", getVehiclesId())
            .toString();
    }
}
