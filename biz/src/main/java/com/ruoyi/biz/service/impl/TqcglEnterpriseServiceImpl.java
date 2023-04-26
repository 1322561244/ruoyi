package com.ruoyi.biz.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import com.ruoyi.common.core.domain.TreeSelect;
import com.ruoyi.common.core.domain.entity.SysDept;
import com.ruoyi.common.core.domain.entity.SysRole;
import com.ruoyi.common.utils.spring.SpringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.biz.mapper.TqcglEnterpriseMapper;
import com.ruoyi.biz.domain.TqcglEnterprise;
import com.ruoyi.biz.service.ITqcglEnterpriseService;

/**
 * 企业管理Service业务层处理
 *
 * @author ruoyi
 * @date 2023-04-25
 */
@Service
public class TqcglEnterpriseServiceImpl implements ITqcglEnterpriseService
{
    @Autowired
    private TqcglEnterpriseMapper tqcglEnterpriseMapper;

    /**
     * 查询企业管理
     *
     * @param enterpriseId 企业管理主键
     * @return 企业管理
     */
    @Override
    public TqcglEnterprise selectTqcglEnterpriseByEnterpriseId(Long enterpriseId)
    {
        return tqcglEnterpriseMapper.selectTqcglEnterpriseByEnterpriseId(enterpriseId);
    }

    /**
     * 查询企业管理列表
     *
     * @param tqcglEnterprise 企业管理
     * @return 企业管理
     */
    @Override
    public List<TqcglEnterprise> selectTqcglEnterpriseList(TqcglEnterprise tqcglEnterprise)
    {
        return tqcglEnterpriseMapper.selectTqcglEnterpriseList(tqcglEnterprise);
    }

    /**
     * 新增企业管理
     *
     * @param tqcglEnterprise 企业管理
     * @return 结果
     */
    @Override
    public int insertTqcglEnterprise(TqcglEnterprise tqcglEnterprise)
    {
        return tqcglEnterpriseMapper.insertTqcglEnterprise(tqcglEnterprise);
    }

    /**
     * 修改企业管理
     *
     * @param tqcglEnterprise 企业管理
     * @return 结果
     */
    @Override
    public int updateTqcglEnterprise(TqcglEnterprise tqcglEnterprise)
    {
        return tqcglEnterpriseMapper.updateTqcglEnterprise(tqcglEnterprise);
    }

    /**
     * 批量删除企业管理
     *
     * @param enterpriseIds 需要删除的企业管理主键
     * @return 结果
     */
    @Override
    public int deleteTqcglEnterpriseByEnterpriseIds(Long[] enterpriseIds)
    {
        return tqcglEnterpriseMapper.deleteTqcglEnterpriseByEnterpriseIds(enterpriseIds);
    }

    /**
     * 删除企业管理信息
     *
     * @param enterpriseId 企业管理主键
     * @return 结果
     */
    @Override
    public int deleteTqcglEnterpriseByEnterpriseId(Long enterpriseId)
    {
        return tqcglEnterpriseMapper.deleteTqcglEnterpriseByEnterpriseId(enterpriseId);
    }



}
