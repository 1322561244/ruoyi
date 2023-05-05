package com.ruoyi.biz.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 司机管理对象 tqcgl_drivers
 * 
 * @author ruoyi
 * @date 2023-04-25
 */
public class TqcglDrivers extends BaseEntity {
    private static final long serialVersionUID = 1L;

    /** 每个司机记录的唯一标识符 */
    private Long driversId;

    /** 司机姓名 */
    @Excel(name = "司机姓名")
    private String driversName;

    /** 司机联系电话 */
    @Excel(name = "司机联系电话")
    private String driversPhone;

    /** 提供该司机的公司或供应商名称 */
    @Excel(name = "提供该司机的公司或供应商名称")
    private String driversSupplier;

    public void setDriversId(Long driversId) {
        this.driversId = driversId;
    }

    public Long getDriversId() {
        return driversId;
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

    public void setDriversSupplier(String driversSupplier) {
        this.driversSupplier = driversSupplier;
    }

    public String getDriversSupplier() {
        return driversSupplier;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this, ToStringStyle.MULTI_LINE_STYLE)
                .append("driversId", getDriversId())
                .append("driversName", getDriversName())
                .append("driversPhone", getDriversPhone())
                .append("driversSupplier", getDriversSupplier())
                .toString();
    }
}
