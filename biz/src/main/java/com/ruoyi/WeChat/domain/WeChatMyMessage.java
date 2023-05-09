package com.ruoyi.WeChat.domain;

import com.ruoyi.common.annotation.Excel;

public class WeChatMyMessage {
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
    @Excel(name = "所属企业ID")
    private Long enterpriseId;

    /**
     * 所属部门ID
     */
    @Excel(name = "所属部门ID")
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
    @Excel(name = "乘客照片1")
    private String passengerPhoto1;

    /**
     * 乘客照片2
     */
    @Excel(name = "乘客照片2")
    private String passengerPhoto2;

    /**
     * 乘客照片3
     */
    @Excel(name = "乘客照片3")
    private String passengerPhoto3;

    /**
     * 账号id
     */
    @Excel(name = "账号id")
    private Long userId;

    public Long getPassengerId() {
        return passengerId;
    }

    public void setPassengerId(Long passengerId) {
        this.passengerId = passengerId;
    }

    public String getPassengerName() {
        return passengerName;
    }

    public void setPassengerName(String passengerName) {
        this.passengerName = passengerName;
    }

    public Long getEnterpriseId() {
        return enterpriseId;
    }

    public void setEnterpriseId(Long enterpriseId) {
        this.enterpriseId = enterpriseId;
    }

    public Long getDeptId() {
        return deptId;
    }

    public void setDeptId(Long deptId) {
        this.deptId = deptId;
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

    public String getPassengerPhone() {
        return passengerPhone;
    }

    public void setPassengerPhone(String passengerPhone) {
        this.passengerPhone = passengerPhone;
    }

    public String getPassengerPhoto1() {
        return passengerPhoto1;
    }

    public void setPassengerPhoto1(String passengerPhoto1) {
        this.passengerPhoto1 = passengerPhoto1;
    }

    public String getPassengerPhoto2() {
        return passengerPhoto2;
    }

    public void setPassengerPhoto2(String passengerPhoto2) {
        this.passengerPhoto2 = passengerPhoto2;
    }

    public String getPassengerPhoto3() {
        return passengerPhoto3;
    }

    public void setPassengerPhoto3(String passengerPhoto3) {
        this.passengerPhoto3 = passengerPhoto3;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    @Override
    public String toString() {
        return "WeChatMyMessage{" +
                "passengerId=" + passengerId +
                ", passengerName='" + passengerName + '\'' +
                ", enterpriseId=" + enterpriseId +
                ", deptId=" + deptId +
                ", enterpriseName='" + enterpriseName + '\'' +
                ", deptName='" + deptName + '\'' +
                ", passengerPhone='" + passengerPhone + '\'' +
                ", passengerPhoto1='" + passengerPhoto1 + '\'' +
                ", passengerPhoto2='" + passengerPhoto2 + '\'' +
                ", passengerPhoto3='" + passengerPhoto3 + '\'' +
                ", userId=" + userId +
                '}';
    }
}
