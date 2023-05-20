package com.ruoyi.biz.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 车长管理对象 tqcgl_leader
 * 
 * @author ruoyi
 * @date 2023-04-25
 */
public class TqcglLeader extends BaseEntity {
    private static final long serialVersionUID = 1L;

    /** 车长ID，自增长 */
    private Long leaderId;

    /** 账号ID */
    private Long userId;

    /**
     * 账号名
     */
    @Excel(name = "账号名")
    private String userName;

    /** 车长姓名 */
    @Excel(name = "车长姓名")
    private String leaderName;

    /** 联系电话 */
    @Excel(name = "联系电话")
    private String leaderPhone;

    /** 所属企业ID */
    private Long enterpriseId;

    @Excel(name = "所属企业名称")
    private String enterpriseName;

    public void setLeaderId(Long leaderId) {
        this.leaderId = leaderId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public Long getLeaderId() {
        return leaderId;
    }

    public Long getUserId() {
        return userId;
    }

    public void setLeaderName(String leaderName) {
        this.leaderName = leaderName;
    }

    public String getLeaderName() {
        return leaderName;
    }

    public void setLeaderPhone(String leaderPhone) {
        this.leaderPhone = leaderPhone;
    }

    public String getLeaderPhone() {
        return leaderPhone;
    }

    public void setEnterpriseId(Long enterpriseId) {
        this.enterpriseId = enterpriseId;
    }

    public Long getEnterpriseId() {
        return enterpriseId;
    }

    public void setEnterpriseName(String enterpriseName) {
        this.enterpriseName = enterpriseName;
    }

    public String getEnterpriseName() {
        return enterpriseName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getUserName() {
        return userName;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this, ToStringStyle.MULTI_LINE_STYLE)
                .append("leaderId", getLeaderId())
                .append("leaderName", getLeaderName())
                .append("leaderPhone", getLeaderPhone())
                .append("enterpriseName", getEnterpriseName())
                .append("enterpriseId", getEnterpriseId())
                .toString();
    }
}
