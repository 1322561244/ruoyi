package com.ruoyi.biz.service.impl;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ruoyi.biz.domain.TqcglDrivers;
import com.ruoyi.biz.domain.TqcglLeader;
import com.ruoyi.biz.domain.TqcglShifts;
import com.ruoyi.biz.domain.TqcglVehicles;
import com.ruoyi.biz.mapper.TqcglDriversMapper;
import com.ruoyi.biz.mapper.TqcglLeaderMapper;
import com.ruoyi.biz.mapper.TqcglShiftsMapper;
import com.ruoyi.biz.mapper.TqcglVehiclesMapper;
import com.ruoyi.biz.service.ITqcglShiftsService;
import com.ruoyi.common.exception.ServiceException;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.system.service.impl.SysUserServiceImpl;

/**
 * 班次管理Service业务层处理
 * 
 * @author ruoyi
 * @date 2023-04-28
 */
@Service
public class TqcglShiftsServiceImpl implements ITqcglShiftsService {
    @Autowired
    private TqcglShiftsMapper tqcglShiftsMapper;

    @Autowired
    private TqcglLeaderMapper tqcglLeaderMapper;

    @Autowired
    private TqcglDriversMapper tqcglDriversMapper;

    @Autowired
    private TqcglVehiclesMapper tqcglVehiclesMapper;

    /**
     * 查询班次管理
     * 
     * @param shiftsId 班次管理主键
     * @return 班次管理
     */
    @Override
    public TqcglShifts selectTqcglShiftsByShiftsId(Long shiftsId) {
        return tqcglShiftsMapper.selectTqcglShiftsByShiftsId(shiftsId);
    }

    /**
     * 查询班次管理
     *
     * @param shiftsId 班次管理主键
     * @return 班次管理
     */
    @Override
    public TqcglShifts selectTqcglShiftsByShiftsId2(Long shiftsId) {
        return tqcglShiftsMapper.selectTqcglShiftsByShiftsId2(shiftsId);
    }

    /**
     * 查询班次管理列表
     * 
     * @param tqcglShifts 班次管理
     * @return 班次管理
     */
    @Override
    public List<TqcglShifts> selectTqcglShiftsList(TqcglShifts tqcglShifts) {
        return tqcglShiftsMapper.selectTqcglShiftsList(tqcglShifts);
    }

    /**
     * 新增班次管理
     * 
     * @param tqcglShifts 班次管理
     * @return 结果
     */
    @Override
    public int insertTqcglShifts(TqcglShifts tqcglShifts) {
        return tqcglShiftsMapper.insertTqcglShifts(tqcglShifts);
    }

    /**
     * 修改班次管理
     * 
     * @param tqcglShifts 班次管理
     * @return 结果
     */
    @Override
    public int updateTqcglShifts(TqcglShifts tqcglShifts) {
        return tqcglShiftsMapper.updateTqcglShifts(tqcglShifts);
    }

    /**
     * 批量删除班次管理
     * 
     * @param shiftsIds 需要删除的班次管理主键
     * @return 结果
     */
    @Override
    public int deleteTqcglShiftsByShiftsIds(Long[] shiftsIds) {
        return tqcglShiftsMapper.deleteTqcglShiftsByShiftsIds(shiftsIds);
    }

    /**
     * 删除班次管理信息
     * 
     * @param shiftsId 班次管理主键
     * @return 结果
     */
    @Override
    public int deleteTqcglShiftsByShiftsId(Long shiftsId) {
        return tqcglShiftsMapper.deleteTqcglShiftsByShiftsId(shiftsId);
    }

    /**
     * 搜索当前班次的限载人数
     */
    public int selectVehicleCapacityByShiftsId(Long shiftsId) {
        return tqcglShiftsMapper.selectVehicleCapacityByShiftsId(shiftsId);
    }

    /**
     * 当满人时更新b班次的可预约状态为不可预约
     */
    public int updateTqcglShiftsStatus(TqcglShifts tqcglShifts) {
        return tqcglShiftsMapper.updateTqcglShiftsStatus(tqcglShifts);
    }

    /**
     * 查询班次管理列表
     *
     * @param tqcglShifts 班次管理
     * @return 班次管理集合
     */
    public List<TqcglShifts> selectShiftsList(TqcglShifts tqcglShifts) {
        return tqcglShiftsMapper.selectShiftsList(tqcglShifts);
    }

    private static final Logger log = LoggerFactory.getLogger(SysUserServiceImpl.class);

    @Override
    public String importUser(List<TqcglShifts> stuList, Boolean isUpdateSupport, String operName) {
        if (StringUtils.isNull(stuList) || stuList.size() == 0) {
            throw new ServiceException("导入班次基本信息数据不能为空！");
        }
        int successNum = 0;
        int failureNum = 0;
        StringBuilder successMsg = new StringBuilder();
        StringBuilder failureMsg = new StringBuilder();
        for (TqcglShifts stu : stuList) {
            try {
                // 验证是否存在这个用户
                TqcglShifts u = tqcglShiftsMapper.checkNameUnique(stu.getShiftsName());
                TqcglVehicles vehicles = tqcglVehiclesMapper.checkNameUnique(stu.getVehiclesLicensePlate());
                TqcglLeader leader = tqcglLeaderMapper.checkNameUnique(stu.getLeaderName());
                TqcglDrivers driver = tqcglDriversMapper.checkNameUnique(stu.getDriversName());
                if (StringUtils.isNull(u)) {
                    if (StringUtils.isNull(leader)) {
                        failureNum++;
                        failureMsg.append("<br/>" + failureNum + "、车长 " + stu.getLeaderName() + " 不存在");
                    } else {
                        if (StringUtils.isNull(driver)) {
                            failureNum++;
                            failureMsg.append("<br/>" + failureNum + "、司机 " + stu.getDriversName() + " 不存在");
                        } else {
                            if (StringUtils.isNull(vehicles)) {
                                failureNum++;
                                failureMsg.append(
                                        "<br/>" + failureNum + "、车辆的车牌号 " + stu.getVehiclesLicensePlate() + " 不存在");
                            } else {
                                stu.setCreateBy(operName);
                                stu.setLeaderId(leader.getLeaderId());
                                stu.setDriversId(driver.getDriversId());
                                stu.setVehiclesId(vehicles.getVehiclesId());
                                this.insertTqcglShifts(stu);
                                successNum++;
                                // successMsg.append("<br/>" + successNum + "、班次 " + stu.getShiftsName() + "
                                // 导入成功");
                            }
                        }
                    }
                } else if (isUpdateSupport) {
                    stu.setUpdateBy(operName);
                    this.updateTqcglShifts(stu);
                    successNum++;
                    // successMsg.append("<br/>" + successNum + "、班次 " + stu.getShiftsName() + "
                    // 更新成功");
                } else {
                    failureNum++;
                    failureMsg.append("<br/>" + failureNum + "、班次 " + stu.getShiftsName() + " 已存在");
                }
            } catch (Exception e) {
                failureNum++;
                String msg = "<br/>" + failureNum + "、班次 " + stu.getShiftsName() + " 导入失败：";
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
