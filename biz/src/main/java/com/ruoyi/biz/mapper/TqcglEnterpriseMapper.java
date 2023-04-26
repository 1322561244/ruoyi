package com.ruoyi.biz.mapper;

import java.util.List;
import com.ruoyi.biz.domain.TqcglEnterprise;

/**
 * 企业管理Mapper接口
 * 
 * @author ruoyi
 * @date 2023-04-25
 */
public interface TqcglEnterpriseMapper 
{
    /**
     * 查询企业管理
     * 
     * @param enterpriseId 企业管理主键
     * @return 企业管理
     */
    public TqcglEnterprise selectTqcglEnterpriseByEnterpriseId(Long enterpriseId);

    /**
     * 查询企业管理列表
     * 
     * @param tqcglEnterprise 企业管理
     * @return 企业管理集合
     */
    public List<TqcglEnterprise> selectTqcglEnterpriseList(TqcglEnterprise tqcglEnterprise);

    /**
     * 新增企业管理
     * 
     * @param tqcglEnterprise 企业管理
     * @return 结果
     */
    public int insertTqcglEnterprise(TqcglEnterprise tqcglEnterprise);

    /**
     * 修改企业管理
     * 
     * @param tqcglEnterprise 企业管理
     * @return 结果
     */
    public int updateTqcglEnterprise(TqcglEnterprise tqcglEnterprise);

    /**
     * 删除企业管理
     * 
     * @param enterpriseId 企业管理主键
     * @return 结果
     */
    public int deleteTqcglEnterpriseByEnterpriseId(Long enterpriseId);

    /**
     * 批量删除企业管理
     * 
     * @param enterpriseIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteTqcglEnterpriseByEnterpriseIds(Long[] enterpriseIds);
}
