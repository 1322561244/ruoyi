package com.ruoyi.biz.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ruoyi.biz.domain.TqcglEnterprise;
import com.ruoyi.biz.mapper.TqcglEnterpriseMapper;
import com.ruoyi.biz.service.ITqcglEnterpriseService;
import com.ruoyi.common.utils.StringUtils;

/**
 * 企业管理Service业务层处理
 * 
 * @author ruoyi
 * @date 2023-04-25
 */
@Service
public class TqcglEnterpriseServiceImpl implements ITqcglEnterpriseService {
    @Autowired
    private TqcglEnterpriseMapper tqcglEnterpriseMapper;

    /**
     * 查询企业管理
     * 
     * @param enterpriseId 企业管理主键
     * @return 企业管理
     */
    @Override
    public TqcglEnterprise selectTqcglEnterpriseByEnterpriseId(Long enterpriseId) {
        return tqcglEnterpriseMapper.selectTqcglEnterpriseByEnterpriseId(enterpriseId);
    }

    /**
     * 查询企业管理列表
     * 
     * @param tqcglEnterprise 企业管理
     * @return 企业管理
     */
    @Override
    public List<TqcglEnterprise> selectTqcglEnterpriseList(TqcglEnterprise tqcglEnterprise) {
        return tqcglEnterpriseMapper.selectTqcglEnterpriseList(tqcglEnterprise);
    }

    /**
     * 新增企业管理
     * 
     * @param tqcglEnterprise 企业管理
     * @return 结果
     */
    @Override
    public String insertTqcglEnterprise(TqcglEnterprise tqcglEnterprise) {
        String msg = "";
        Long tqcglEnterpriseId = StringUtils.isNull(tqcglEnterprise.getEnterpriseId()) ? -1L
                : tqcglEnterprise.getEnterpriseId();
        TqcglEnterprise info = tqcglEnterpriseMapper.checkNameUnique(tqcglEnterprise.getEnterpriseName());
        if (StringUtils.isNotNull(info) && info.getEnterpriseId().longValue() != tqcglEnterpriseId.longValue()) {
            msg = "保存用户'" + tqcglEnterprise.getEnterpriseName() + "'失败，添加的企业信息已存在";
        } else {
            tqcglEnterpriseMapper.insertTqcglEnterprise(tqcglEnterprise);
        }
        return msg;
    }

    /**
     * 修改企业管理
     * 
     * @param tqcglEnterprise 企业管理
     * @return 结果
     */
    @Override
    public String updateTqcglEnterprise(TqcglEnterprise tqcglEnterprise) {

        String msg = "";
        Long tqcglEnterpriseId = StringUtils.isNull(tqcglEnterprise.getEnterpriseId()) ? -1L
                : tqcglEnterprise.getEnterpriseId();
        TqcglEnterprise info = tqcglEnterpriseMapper.checkNameUnique(tqcglEnterprise.getEnterpriseName());
        if (StringUtils.isNotNull(info) && info.getEnterpriseId().longValue() != tqcglEnterpriseId.longValue()) {
            msg = "修改失败，修改的企业信息已存在";
        } else {
            tqcglEnterpriseMapper.updateTqcglEnterprise(tqcglEnterprise);
        }
        return msg;
    }

    /**
     * 批量删除企业管理
     * 
     * @param enterpriseIds 需要删除的企业管理主键
     * @return 结果
     */
    @Override
    public int deleteTqcglEnterpriseByEnterpriseIds(Long[] enterpriseIds) {
        return tqcglEnterpriseMapper.deleteTqcglEnterpriseByEnterpriseIds(enterpriseIds);
    }

    /**
     * 删除企业管理信息
     * 
     * @param enterpriseId 企业管理主键
     * @return 结果
     */
    @Override
    public int deleteTqcglEnterpriseByEnterpriseId(Long enterpriseId) {
        return tqcglEnterpriseMapper.deleteTqcglEnterpriseByEnterpriseId(enterpriseId);
    }

    /**
     * 查询企业是否存在用户
     * 
     * @param Id 部门ID
     * @return 结果 true 存在 false 不存在
     */
    @Override
    public boolean checkExistUser(Long Id) {
        int result = tqcglEnterpriseMapper.checkExistUser(Id);
        return result > 0;
    }
}
