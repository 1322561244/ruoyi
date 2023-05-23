package com.ruoyi.biz.service.impl;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.Validator;

import com.ruoyi.biz.domain.TqcglEnterprise;
import com.ruoyi.biz.domain.TqcglLeader;
import com.ruoyi.biz.mapper.TqcglEnterpriseMapper;
import com.ruoyi.biz.mapper.TqcglLeaderMapper;
import com.ruoyi.biz.service.ITqcglLeaderService;
import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.common.exception.ServiceException;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.system.mapper.SysUserMapper;
import com.ruoyi.system.service.impl.SysUserServiceImpl;

/**
 * 车长管理Service业务层处理
 * 
 * @author ruoyi
 * @date 2023-04-25
 */
@Service
public class TqcglLeaderServiceImpl implements ITqcglLeaderService {
    @Autowired
    private TqcglLeaderMapper tqcglLeaderMapper;

    @Autowired
    private SysUserMapper sysUserMapper;

    @Autowired
    private TqcglEnterpriseMapper tqcglEnterpriseMapper;

    /**
     * 查询车长管理
     * 
     * @param leaderId 车长管理主键
     * @return 车长管理
     */
    @Override
    public TqcglLeader selectTqcglLeaderByLeaderId(Long leaderId) {
        return tqcglLeaderMapper.selectTqcglLeaderByLeaderId(leaderId);
    }

    /**
     * 查询车长管理列表
     * 
     * @param tqcglLeader 车长管理
     * @return 车长管理
     */
    @Override
    public List<TqcglLeader> selectTqcglLeaderList(TqcglLeader tqcglLeader) {
        return tqcglLeaderMapper.selectTqcglLeaderList(tqcglLeader);
    }

    /**
     * 新增车长管理
     * 
     * @param tqcglLeader 车长管理
     * @return 结果
     */
    @Override
    public String insertTqcglLeader(TqcglLeader tqcglLeader) {
        String msg = "";
        Long tqcglLeaderId = StringUtils.isNull(tqcglLeader.getLeaderId()) ? -1L
                : tqcglLeader.getLeaderId();
        TqcglLeader info = tqcglLeaderMapper.checkNameUnique(tqcglLeader.getLeaderName());
        if (StringUtils.isNotNull(info) && info.getLeaderId().longValue() != tqcglLeaderId.longValue()) {
            msg = "保存用户'" + tqcglLeader.getLeaderName() + "'失败，添加的车长信息已存在";
        } else {
            tqcglLeaderMapper.insertTqcglLeader(tqcglLeader);
        }
        return msg;
    }

    /**
     * 修改车长管理
     * 
     * @param tqcglLeader 车长管理
     * @return 结果
     */
    @Override
    public String updateTqcglLeader(TqcglLeader tqcglLeader) {
        String msg = "";
        Long tqcglLeaderId = StringUtils.isNull(tqcglLeader.getLeaderId()) ? -1L
                : tqcglLeader.getLeaderId();
        TqcglLeader info = tqcglLeaderMapper.checkNameUnique(tqcglLeader.getLeaderName());
        if (StringUtils.isNotNull(info) && info.getLeaderId().longValue() != tqcglLeaderId.longValue()) {
            msg = "修改信息失败，修改的车长信息已存在";
        } else {
            tqcglLeaderMapper.updateTqcglLeader(tqcglLeader);
        }
        return msg;
    }

    /**
     * 批量删除车长管理
     * 
     * @param leaderIds 需要删除的车长管理主键
     * @return 结果
     */
    @Override
    public int deleteTqcglLeaderByLeaderIds(Long[] leaderIds) {
        return tqcglLeaderMapper.deleteTqcglLeaderByLeaderIds(leaderIds);
    }

    /**
     * 删除车长管理信息
     * 
     * @param leaderId 车长管理主键
     * @return 结果
     */
    @Override
    public int deleteTqcglLeaderByLeaderId(Long leaderId) {
        return tqcglLeaderMapper.deleteTqcglLeaderByLeaderId(leaderId);
    }

    @Override
    public boolean checkExistUser(Long Id) {
        int result = tqcglLeaderMapper.checkExistUser(Id);
        return result > 0;
    }

    private static final Logger log = LoggerFactory.getLogger(SysUserServiceImpl.class);

    @Autowired
    protected Validator validator;

    @Override
    public String importUser(List<TqcglLeader> stuList, Boolean isUpdateSupport, String operName) {
        if (StringUtils.isNull(stuList) || stuList.size() == 0) {
            throw new ServiceException("导入车长基本信息数据不能为空！");
        }
        int successNum = 0;
        int failureNum = 0;
        StringBuilder successMsg = new StringBuilder();
        StringBuilder failureMsg = new StringBuilder();
        for (TqcglLeader stu : stuList) {
            try {
                // 验证是否存在这个用户
                TqcglLeader u = tqcglLeaderMapper.checkNameUnique(stu.getLeaderName());
                SysUser user = sysUserMapper.selectUserByUserName(stu.getUserName());
                TqcglEnterprise enterprise = tqcglEnterpriseMapper.checkNameUnique(stu.getEnterpriseName());
                if (StringUtils.isNull(u)) {
                    if (StringUtils.isNull(user)) {
                        failureNum++;
                        failureMsg.append("<br/>" + failureNum + "、车长 " + stu.getLeaderName() + " 未创建账号");
                    } else {
                        stu.setUserId(user.getUserId());
                        if (StringUtils.isNull(enterprise)) {
                            failureNum++;
                            failureMsg.append("<br/>" + failureNum + "、车长 " + stu.getLeaderName() + " 所属企业不存在");
                        } else {
                            stu.setCreateBy(operName);
                            this.insertTqcglLeader(stu);
                            successNum++;
                            // successMsg.append("<br/>" + successNum + "、车长 " + stu.getLeaderName() + "
                            // 导入成功");
                        }
                    }
                } else if (isUpdateSupport) {
                    stu.setUpdateBy(operName);
                    this.updateTqcglLeader(stu);
                    successNum++;
                    // successMsg.append("<br/>" + successNum + "、车长 " + stu.getLeaderName() + "
                    // 更新成功");
                } else {
                    failureNum++;
                    failureMsg.append("<br/>" + failureNum + "、车长 " + stu.getLeaderName() + " 已存在");
                }
            } catch (Exception e) {
                failureNum++;
                String msg = "<br/>" + failureNum + "、车长 " + stu.getLeaderName() + " 导入失败：";
                failureMsg.append(msg + e.getMessage());
                log.error(msg, e);
            }
        }
        if (failureNum > 0) {
            failureMsg.insert(0, "共 " + successNum + " 条数据导入成功，共 " + failureNum + " 条数据导入失败，错误如下：");
            throw new ServiceException(failureMsg.toString());
        } else {
            successMsg.insert(0, "恭喜您，数据已全部导入成功！共 " + successNum + " 条。");
        }
        return successMsg.toString();
    }

}
