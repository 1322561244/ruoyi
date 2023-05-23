package com.ruoyi.biz.service.impl;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ruoyi.biz.domain.TqcglEnterprise;
import com.ruoyi.biz.domain.TqcglPassenger;
import com.ruoyi.biz.mapper.TqcglEnterpriseMapper;
import com.ruoyi.biz.mapper.TqcglPassengerMapper;
import com.ruoyi.biz.service.ITqcglPassengerService;
import com.ruoyi.common.core.domain.entity.SysDept;
import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.common.exception.ServiceException;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.system.mapper.SysDeptMapper;
import com.ruoyi.system.mapper.SysUserMapper;
import com.ruoyi.system.service.impl.SysUserServiceImpl;

/**
 * 乘客管理Service业务层处理
 * 
 * @author zhu
 * @date 2023-05-01
 */
@Service
public class TqcglPassengerServiceImpl implements ITqcglPassengerService {
    @Autowired
    private TqcglPassengerMapper tqcglPassengerMapper;

    @Autowired
    private SysUserMapper sysUserMapper;

    @Autowired
    private TqcglEnterpriseMapper tqcglEnterpriseMapper;

    @Autowired
    private SysDeptMapper sysDeptMapper;

    /**
     * 查询乘客管理
     * 
     * @param passengerId 乘客管理主键
     * @return 乘客管理
     */
    @Override
    public TqcglPassenger selectTqcglPassengerByPassengerId(Long passengerId) {
        return tqcglPassengerMapper.selectTqcglPassengerByPassengerId(passengerId);
    }

    /**
     * 查询乘客管理
     *
     * @param passengerId 乘客管理主键
     * @return 乘客管理
     */
    @Override
    public TqcglPassenger selectTqcglPassengerByPassengerId2(Long passengerId) {
        return tqcglPassengerMapper.selectTqcglPassengerByPassengerId2(passengerId);
    }

    /**
     * 查询乘客管理列表
     * 
     * @param tqcglPassenger 乘客管理
     * @return 乘客管理
     */
    @Override
    public List<TqcglPassenger> selectTqcglPassengerList(TqcglPassenger tqcglPassenger) {
        return tqcglPassengerMapper.selectTqcglPassengerList(tqcglPassenger);
    }

    /**
     * 新增乘客管理
     * 
     * @param tqcglPassenger 乘客管理
     * @return 结果
     */
    @Override
    public int insertTqcglPassenger(TqcglPassenger tqcglPassenger) {
        return tqcglPassengerMapper.insertTqcglPassenger(tqcglPassenger);
    }

    /**
     * 修改乘客管理
     * 
     * @param tqcglPassenger 乘客管理
     * @return 结果
     */
    @Override
    public int updateTqcglPassenger(TqcglPassenger tqcglPassenger) {
        return tqcglPassengerMapper.updateTqcglPassenger(tqcglPassenger);
    }

    /**
     * 批量删除乘客管理
     * 
     * @param passengerIds 需要删除的乘客管理主键
     * @return 结果
     */
    @Override
    public int deleteTqcglPassengerByPassengerIds(Long[] passengerIds) {
        return tqcglPassengerMapper.deleteTqcglPassengerByPassengerIds(passengerIds);
    }

    /**
     * 删除乘客管理信息
     * 
     * @param passengerId 乘客管理主键
     * @return 结果
     */
    @Override
    public int deleteTqcglPassengerByPassengerId(Long passengerId) {
        return tqcglPassengerMapper.deleteTqcglPassengerByPassengerId(passengerId);
    }

    @Override
    public boolean checkExistUser(Long Id) {
        int result = tqcglPassengerMapper.checkExistUser(Id);
        return result > 0;
    }

    private static final Logger log = LoggerFactory.getLogger(SysUserServiceImpl.class);

    @Override
    public String importUser(List<TqcglPassenger> stuList, Boolean isUpdateSupport, String operName) {
        if (StringUtils.isNull(stuList) || stuList.size() == 0) {
            throw new ServiceException("导入乘客基本信息数据不能为空！");
        }
        int successNum = 0;
        int failureNum = 0;
        StringBuilder successMsg = new StringBuilder();
        StringBuilder failureMsg = new StringBuilder();
        for (TqcglPassenger stu : stuList) {
            try {
                // 验证是否存在这个用户
                TqcglPassenger u = tqcglPassengerMapper.select_Passenger_toName(stu.getPassengerName());
                if (StringUtils.isNull(u)) {
                    TqcglEnterprise enterprise = tqcglEnterpriseMapper.checkNameUnique(stu.getEnterpriseName());
                    SysDept dept = sysDeptMapper.select_DeptId_toName(stu.getDeptName());
                    SysUser user = sysUserMapper.selectUserByUserName(stu.getUserName());
                    if (StringUtils.isNull(user)) {
                        failureNum++;
                        failureMsg.append("<br/>" + failureNum + "、乘客 " + stu.getPassengerName() + " 乘客未创建账号");
                    } else {
                        if (StringUtils.isNull(enterprise)) {
                            failureNum++;
                            failureMsg.append("<br/>" + failureNum + "、乘客 " + stu.getPassengerName() + " 所属企业不存在");
                        } else {
                            if (StringUtils.isNull(dept)) {
                                failureNum++;
                                failureMsg.append("<br/>" + failureNum + "、乘客 " + stu.getPassengerName() + " 所属部门不存在");
                            } else {
                                stu.setUserId(user.getUserId());
                                stu.setDeptId(dept.getDeptId());
                                stu.setEnterpriseId(enterprise.getEnterpriseId());
                                stu.setCreateBy(operName);
                                this.insertTqcglPassenger(stu);
                                successNum++;
                                // successMsg.append("<br/>" + successNum + "、乘客 " + stu.getPassengerName() + "
                                // 导入成功");
                            }
                        }
                    }
                } else if (isUpdateSupport) {
                    stu.setUpdateBy(operName);
                    this.updateTqcglPassenger(stu);
                    successNum++;
                    // successMsg.append("<br/>" + successNum + "、乘客 " + stu.getPassengerName() + "
                    // 更新成功");
                } else {
                    failureNum++;
                    failureMsg.append("<br/>" + failureNum + "、乘客 " + stu.getPassengerName() + " 已存在");
                }
            } catch (Exception e) {
                failureNum++;
                String msg = "<br/>" + failureNum + "、乘客 " + stu.getPassengerName() + " 导入失败：";
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
