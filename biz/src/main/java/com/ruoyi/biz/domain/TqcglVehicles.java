package com.ruoyi.biz.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 车辆管理对象 tqcgl_vehicles
 * 
 * @author ruoyi
 * @date 2023-04-25
 */
public class TqcglVehicles extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 每个车辆记录的唯一标识符 */
    private Long vehiclesId;

    /** 车辆的车牌号码 */
    @Excel(name = "车辆的车牌号码")
    private String vehiclesLicensePlate;

    /** 车辆的型号 */
    @Excel(name = "车辆的型号")
    private String vehiclesModel;

    /** 车辆最多可搭载乘客数 */
    @Excel(name = "车辆最多可搭载乘客数")
    private Long vehiclesCapacity;

    /** 提供车辆的公司或供应商名称 */
    @Excel(name = "提供车辆的公司或供应商名称")
    private String vehiclesSupplier;

    public void setVehiclesId(Long vehiclesId) 
    {
        this.vehiclesId = vehiclesId;
    }

    public Long getVehiclesId() 
    {
        return vehiclesId;
    }
    public void setVehiclesLicensePlate(String vehiclesLicensePlate) 
    {
        this.vehiclesLicensePlate = vehiclesLicensePlate;
    }

    public String getVehiclesLicensePlate() 
    {
        return vehiclesLicensePlate;
    }
    public void setVehiclesModel(String vehiclesModel) 
    {
        this.vehiclesModel = vehiclesModel;
    }

    public String getVehiclesModel() 
    {
        return vehiclesModel;
    }
    public void setVehiclesCapacity(Long vehiclesCapacity) 
    {
        this.vehiclesCapacity = vehiclesCapacity;
    }

    public Long getVehiclesCapacity() 
    {
        return vehiclesCapacity;
    }
    public void setVehiclesSupplier(String vehiclesSupplier) 
    {
        this.vehiclesSupplier = vehiclesSupplier;
    }

    public String getVehiclesSupplier() 
    {
        return vehiclesSupplier;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("vehiclesId", getVehiclesId())
            .append("vehiclesLicensePlate", getVehiclesLicensePlate())
            .append("vehiclesModel", getVehiclesModel())
            .append("vehiclesCapacity", getVehiclesCapacity())
            .append("vehiclesSupplier", getVehiclesSupplier())
            .toString();
    }
}
