package com.ruoyi.biz.domain;

import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

public class TqcglLeader_Enterprise extends BaseEntity {


    @Excel(name = "所属企业名称")
    private String enterpriseName;

    public String getEnterpriseName() {
        return enterpriseName;
    }

    public void setEnterpriseName(String enterpriseName) {
        this.enterpriseName = enterpriseName;
    }

    @Override
    public String toString() {
        return "TqcglLeader_Enterprise{" +
                "enterpriseName='" + enterpriseName + '\'' +
                '}';
    }
}
