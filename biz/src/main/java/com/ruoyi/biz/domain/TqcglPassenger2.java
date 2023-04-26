package com.ruoyi.biz.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 乘客表对象 tqcgl_passenger2
 *
 * @author zhu
 * @date 2023-04-26
 */
public class TqcglPassenger2 extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 乘客ID，自增长 */
    private Long passengerId;

    /** 乘客姓名 */
    @Excel(name = "乘客姓名")
    private String passengerName;

    /** 所属企业 */
    @Excel(name = "所属企业")
    private String enterpriseName;

    /** 所属部门 */
    @Excel(name = "所属部门")
    private String deptName;

    /** 联系电话 */
    @Excel(name = "联系电话")
    private String passengerPhone;

    /** 乘客照片 */
    @Excel(name = "乘客照片")
    private String passengerPhoto;

    public void setPassengerId(Long passengerId)
    {
        this.passengerId = passengerId;
    }

    public Long getPassengerId()
    {
        return passengerId;
    }
    public void setPassengerName(String passengerName)
    {
        this.passengerName = passengerName;
    }

    public String getPassengerName()
    {
        return passengerName;
    }
    public void setEnterpriseName(String enterpriseName)
    {
        this.enterpriseName = enterpriseName;
    }

    public String getEnterpriseName()
    {
        return enterpriseName;
    }
    public void setDeptName(String deptName)
    {
        this.deptName = deptName;
    }

    public String getDeptName()
    {
        return deptName;
    }
    public void setPassengerPhone(String passengerPhone)
    {
        this.passengerPhone = passengerPhone;
    }

    public String getPassengerPhone()
    {
        return passengerPhone;
    }
    public void setPassengerPhoto(String passengerPhoto)
    {
        this.passengerPhoto = passengerPhoto;
    }

    public String getPassengerPhoto()
    {
        return passengerPhoto;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
                .append("passengerId", getPassengerId())
                .append("passengerName", getPassengerName())
                .append("enterpriseName", getEnterpriseName())
                .append("deptName", getDeptName())
                .append("passengerPhone", getPassengerPhone())
                .append("passengerPhoto", getPassengerPhoto())
                .toString();
    }
}
