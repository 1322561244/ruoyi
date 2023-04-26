package com.ruoyi.biz.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 班次管理对象 tqcgl_shift
 * 
 * @author zhu
 * @date 2023-04-25
 */
public class TqcglShifts2 extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** $column.columnComment */
    private Long shiftsId;

    /** 班次名 */
    @Excel(name = "班次名")
    private String shiftsName;

    /** 发车时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "发车时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date shiftsDepartureTime;

    /** 司机名 */
    @Excel(name = "司机名")
    private String driversName;

    /** 司机联系电话 */
    @Excel(name = "司机联系电话")
    private String driversPhone;

    /** 车长名 */
    @Excel(name = "车长名")
    private String leaderName;

    /** 车长联系电话 */
    @Excel(name = "车长联系电话")
    private String leaderPhone;

    /** 车牌 */
    @Excel(name = "车牌")
    private String vehiclesLicensePlate;

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
    public void setShiftsDepartureTime(Date shiftsDepartureTime) 
    {
        this.shiftsDepartureTime = shiftsDepartureTime;
    }

    public Date getShiftsDepartureTime() 
    {
        return shiftsDepartureTime;
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
    public void setVehiclesLicensePlate(String vehiclesLicensePlate) 
    {
        this.vehiclesLicensePlate = vehiclesLicensePlate;
    }

    public String getVehiclesLicensePlate() 
    {
        return vehiclesLicensePlate;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("shiftsId", getShiftsId())
            .append("shiftsName", getShiftsName())
            .append("shiftsDepartureTime", getShiftsDepartureTime())
            .append("driversName", getDriversName())
            .append("driversPhone", getDriversPhone())
            .append("leaderName", getLeaderName())
            .append("leaderPhone", getLeaderPhone())
            .append("vehiclesLicensePlate", getVehiclesLicensePlate())
            .toString();
    }
}
