package com.ruoyi.biz.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.annotation.Excel.ColumnType;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 乘客管理对象 tqcgl_passenger
 *
 * @author zhu
 * @date 2023-05-01
 */
public class TqcglPassenger extends BaseEntity {
    private static final long serialVersionUID = 1L;

    /**
     * 乘客ID，自增长
     */
    private Long passengerId;

    /**
     * 乘客姓名
     */
    @Excel(name = "乘客姓名")
    private String passengerName;

    /**
     * 所属企业ID
     */
    private Long enterpriseId;

    /**
     * 所属部门ID
     */
    private Long deptId;

    /**
     * 所属企业名
     */
    @Excel(name = "所属企业名")
    private String enterpriseName;

    /**
     * 所属部门名
     */
    @Excel(name = "所属部门名")
    private String deptName;

    /**
     * 联系电话
     */
    @Excel(name = "联系电话")
    private String passengerPhone;

    /**
     * 乘客照片1
     */
    @Excel(name = "乘客照片1", cellType = ColumnType.IMAGE)
    private String passengerPhoto1;

    /**
     * 乘客照片2
     */
    @Excel(name = "乘客照片2", cellType = ColumnType.IMAGE)
    private String passengerPhoto2;

    /**
     * 乘客照片3
     */
    @Excel(name = "乘客照片3", cellType = ColumnType.IMAGE)
    private String passengerPhoto3;

    /**
     * 账号id
     */
    private Long userId;

    /**
     * 账号名
     */
    @Excel(name = "账号名")
    private String userName;

    public String getUserName() {
        return userName;
    }

    public String getEnterpriseName() {
        return enterpriseName;
    }

    public void setEnterpriseName(String enterpriseName) {
        this.enterpriseName = enterpriseName;
    }

    public String getDeptName() {
        return deptName;
    }

    public void setDeptName(String deptName) {
        this.deptName = deptName;
    }

    public void setPassengerId(Long passengerId) {
        this.passengerId = passengerId;
    }

    public Long getPassengerId() {
        return passengerId;
    }

    public void setPassengerName(String passengerName) {
        this.passengerName = passengerName;
    }

    public String getPassengerName() {
        return passengerName;
    }

    public void setEnterpriseId(Long enterpriseId) {
        this.enterpriseId = enterpriseId;
    }

    public Long getEnterpriseId() {
        return enterpriseId;
    }

    public void setDeptId(Long deptId) {
        this.deptId = deptId;
    }

    public Long getDeptId() {
        return deptId;
    }

    public void setPassengerPhone(String passengerPhone) {
        this.passengerPhone = passengerPhone;
    }

    public String getPassengerPhone() {
        return passengerPhone;
    }

    public void setPassengerPhoto1(String passengerPhoto1) {
        this.passengerPhoto1 = passengerPhoto1;
    }

    public String getPassengerPhoto1() {
        return passengerPhoto1;
    }

    public void setPassengerPhoto2(String passengerPhoto2) {
        this.passengerPhoto2 = passengerPhoto2;
    }

    public String getPassengerPhoto2() {
        return passengerPhoto2;
    }

    public void setPassengerPhoto3(String passengerPhoto3) {
        this.passengerPhoto3 = passengerPhoto3;
    }

    public String getPassengerPhoto3() {
        return passengerPhoto3;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public Long getUserId() {
        return userId;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this, ToStringStyle.MULTI_LINE_STYLE)
                .append("passengerId", getPassengerId())
                .append("passengerName", getPassengerName())
                .append("enterpriseId", getEnterpriseId())
                .append("deptId", getDeptId())
                .append("passengerPhone", getPassengerPhone())
                .append("passengerPhoto1", getPassengerPhoto1())
                .append("passengerPhoto2", getPassengerPhoto2())
                .append("passengerPhoto3", getPassengerPhoto3())
                .append("userId", getUserId())
                .append("enterpriseName", getEnterpriseName())
                .append("deptName", getDeptName())
                .toString();
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }
}
