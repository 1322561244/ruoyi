package com.ruoyi.biz.service.impl;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.Validator;

import com.ruoyi.biz.domain.TqcglEnterprise;
import com.ruoyi.biz.mapper.TqcglEnterpriseMapper;
import com.ruoyi.biz.service.ITqcglEnterpriseService;
import com.ruoyi.common.exception.ServiceException;
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

    /**
     * 导入用户数据
     * 
     * @param userList        用户数据列表
     * @param isUpdateSupport 是否更新支持，如果已存在，则进行更新数据
     * @param operName        操作用户
     * @return 结果
     */
    @Autowired
    protected Validator validator;

    private static final Logger log = LoggerFactory.getLogger(TqcglEnterpriseServiceImpl.class);

    @Override
    public String importUser(List<TqcglEnterprise> userList, Boolean isUpdateSupport, String operName) {
        if (StringUtils.isNull(userList) || userList.size() == 0) {
            throw new ServiceException("导入用户数据不能为空！");
        }
        int successNum = 0;
        int failureNum = 0;
        StringBuilder successMsg = new StringBuilder();
        StringBuilder failureMsg = new StringBuilder();
        for (TqcglEnterprise user : userList) {
            try {
                // 验证是否存在这个用户
                TqcglEnterprise u = tqcglEnterpriseMapper.checkNameUnique(user.getEnterpriseName());
                if (StringUtils.isNull(u)) {
                    user.setCreateBy(operName);
                    this.insertTqcglEnterprise(user);
                    successNum++;
                    successMsg.append("<br/>" + successNum + "、企业 " + user.getEnterpriseName() + " 导入成功");
                } else if (isUpdateSupport) {
                    user.setUpdateBy(operName);
                    this.updateTqcglEnterprise(user);
                    successNum++;
                    successMsg.append("<br/>" + successNum + "、企业 " + user.getEnterpriseName() + " 更新成功");
                } else {
                    failureNum++;
                    failureMsg.append("<br/>" + failureNum + "、企业 " + user.getEnterpriseName() + " 已存在");
                }
            } catch (Exception e) {
                failureNum++;
                String msg = "<br/>" + failureNum + "、企业 " + user.getEnterpriseName() + " 导入失败：";
                failureMsg.append(msg + e.getMessage());
                log.error(msg, e);
            }
        }
        if (failureNum > 0) {
            failureMsg.insert(0, "很抱歉，导入失败！共 " + failureNum + " 条数据格式不正确，错误如下：");
            throw new ServiceException(failureMsg.toString());
        } else {
            successMsg.insert(0, "恭喜您，数据已全部导入成功！共 " + successNum + " 条，数据如下：");
        }
        return successMsg.toString();
    }
}
