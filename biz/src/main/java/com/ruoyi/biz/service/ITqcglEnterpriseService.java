package com.ruoyi.biz.service;

import java.util.List;

import com.ruoyi.biz.domain.TqcglEnterprise;

/**
 * 企业管理Service接口
 * 
 * @author ruoyi
 * @date 2023-04-25
 */
public interface ITqcglEnterpriseService {
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
    public String insertTqcglEnterprise(TqcglEnterprise tqcglEnterprise);

    /**
     * 修改企业管理
     * 
     * @param tqcglEnterprise 企业管理
     * @return 结果
     */
    public String updateTqcglEnterprise(TqcglEnterprise tqcglEnterprise);

    /**
     * 批量删除企业管理
     * 
     * @param enterpriseIds 需要删除的企业管理主键集合
     * @return 结果
     */
    public int deleteTqcglEnterpriseByEnterpriseIds(Long[] enterpriseIds);

    /**
     * 删除企业管理信息
     * 
     * @param enterpriseId 企业管理主键
     * @return 结果
     */
    public int deleteTqcglEnterpriseByEnterpriseId(Long enterpriseId);

    /**
     * 查询企业是否存在用户
     * 
     * @param Id 部门ID
     * @return 结果 true 存在 false 不存在
     */
    public boolean checkExistUser(Long Id);

    /**
     * 导入用户数据
     *
     * @param driverList      用户数据列表
     * @param isUpdateSupport 是否更新支持，如果已存在，则进行更新数据
     * @param operName        操作用户
     * @return 结果
     */
    public String importUser(List<TqcglEnterprise> driverList, Boolean isUpdateSupport, String operName);

}
