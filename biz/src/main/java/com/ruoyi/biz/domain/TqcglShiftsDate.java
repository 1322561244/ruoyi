package com.ruoyi.biz.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 班次日期管理对象 tqcgl_shifts_date
 *
 * @author zhu
 * @date 2023-05-10
 */
public class TqcglShiftsDate extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 日期id */
    private Long dateId;

    /** 搭乘日期 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "搭乘日期", width = 30, dateFormat = "yyyy-MM-dd")
    private Date dateTime;

    /** 班次id */
    @Excel(name = "班次id")
    private Long shiftsId;

    /** 班次id */
    @Excel(name = "班次name")
    private String shiftsName;

    /** 班次的状态0代表不可预约，1代表可预约 */
    @Excel(name = "班次的状态0代表不可预约，1代表可预约")
    private Long shiftsStatus;

    public void setDateId(Long dateId)
    {
        this.dateId = dateId;
    }

    public Long getDateId()
    {
        return dateId;
    }
    public void setDateTime(Date dateTime)
    {
        this.dateTime = dateTime;
    }

    public Date getDateTime()
    {
        return dateTime;
    }
    public void setShiftsId(Long shiftsId)
    {
        this.shiftsId = shiftsId;
    }

    public Long getShiftsId()
    {
        return shiftsId;
    }
    public void setShiftsStatus(Long shiftsStatus)
    {
        this.shiftsStatus = shiftsStatus;
    }

    public Long getShiftsStatus()
    {
        return shiftsStatus;
    }

    public String getShiftsName() {
        return shiftsName;
    }

    public void setShiftsName(String shiftsName) {
        this.shiftsName = shiftsName;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
                .append("dateId", getDateId())
                .append("dateTime", getDateTime())
                .append("shiftsId", getShiftsId())
                .append("shiftsStatus", getShiftsStatus())
                .append("shiftsName",getShiftsName())
                .toString();
    }
}
