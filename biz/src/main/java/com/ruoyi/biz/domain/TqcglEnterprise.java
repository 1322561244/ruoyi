package com.ruoyi.biz.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 企业管理对象 tqcgl_enterprise
 * 
 * @author ruoyi
 * @date 2023-04-25
 */
public class TqcglEnterprise extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 每个企业记录的唯一标识符 */
    private Long enterpriseId;

    /** 企业名称 */
    @Excel(name = "企业名称")
    private String enterpriseName;

    public void setEnterpriseId(Long enterpriseId) 
    {
        this.enterpriseId = enterpriseId;
    }

    public Long getEnterpriseId() 
    {
        return enterpriseId;
    }
    public void setEnterpriseName(String enterpriseName) 
    {
        this.enterpriseName = enterpriseName;
    }

    public String getEnterpriseName() 
    {
        return enterpriseName;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("enterpriseId", getEnterpriseId())
            .append("enterpriseName", getEnterpriseName())
            .toString();
    }
}
