package com.ruoyi.biz.service.impl;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.Validator;

import com.ruoyi.biz.domain.TqcglVehicles;
import com.ruoyi.biz.mapper.TqcglVehiclesMapper;
import com.ruoyi.biz.service.ITqcglVehiclesService;
import com.ruoyi.common.exception.ServiceException;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.system.service.impl.SysUserServiceImpl;

/**
 * 车辆管理Service业务层处理
 * 
 * @author ruoyi
 * @date 2023-04-25
 */
@Service
public class TqcglVehiclesServiceImpl implements ITqcglVehiclesService {
    @Autowired
    private TqcglVehiclesMapper tqcglVehiclesMapper;

    /**
     * 查询车辆管理
     * 
     * @param vehiclesId 车辆管理主键
     * @return 车辆管理
     */
    @Override
    public TqcglVehicles selectTqcglVehiclesByVehiclesId(Long vehiclesId) {
        return tqcglVehiclesMapper.selectTqcglVehiclesByVehiclesId(vehiclesId);
    }

    /**
     * 查询车辆管理列表
     * 
     * @param tqcglVehicles 车辆管理
     * @return 车辆管理
     */
    @Override
    public List<TqcglVehicles> selectTqcglVehiclesList(TqcglVehicles tqcglVehicles) {
        return tqcglVehiclesMapper.selectTqcglVehiclesList(tqcglVehicles);
    }

    /**
     * 新增车辆管理
     * 
     * @param tqcglVehicles 车辆管理
     * @return 结果
     */
    @Override
    public String insertTqcglVehicles(TqcglVehicles tqcglVehicles) {
        String msg = "";
        Long tqcglVehiclesId = StringUtils.isNull(tqcglVehicles.getVehiclesId()) ? -1L : tqcglVehicles.getVehiclesId();
        TqcglVehicles info = tqcglVehiclesMapper.checkNameUnique(tqcglVehicles.getVehiclesLicensePlate());
        if (StringUtils.isNotNull(info) && info.getVehiclesId().longValue() != tqcglVehiclesId.longValue()) {
            msg = "保存用户'" + tqcglVehicles.getVehiclesLicensePlate() + "'失败，添加的车牌信息已存在";
        } else {
            tqcglVehiclesMapper.insertTqcglVehicles(tqcglVehicles);
        }
        return msg;
    }

    /**
     * 修改车辆管理
     * 
     * @param tqcglVehicles 车辆管理
     * @return 结果
     */
    @Override
    public String updateTqcglVehicles(TqcglVehicles tqcglVehicles) {
        String msg = "";
        Long tqcglVehiclesId = StringUtils.isNull(tqcglVehicles.getVehiclesId()) ? -1L : tqcglVehicles.getVehiclesId();
        TqcglVehicles info = tqcglVehiclesMapper.checkNameUnique(tqcglVehicles.getVehiclesLicensePlate());
        if (StringUtils.isNotNull(info) && info.getVehiclesId().longValue() != tqcglVehiclesId.longValue()) {
            msg = "保存用户'" + tqcglVehicles.getVehiclesLicensePlate() + "'失败，添加的车牌信息已存在";
        } else {
            tqcglVehiclesMapper.updateTqcglVehicles(tqcglVehicles);
        }
        return msg;
    }

    /**
     * 批量删除车辆管理
     * 
     * @param vehiclesIds 需要删除的车辆管理主键
     * @return 结果
     */
    @Override
    public int deleteTqcglVehiclesByVehiclesIds(Long[] vehiclesIds) {
        return tqcglVehiclesMapper.deleteTqcglVehiclesByVehiclesIds(vehiclesIds);
    }

    /**
     * 删除车辆管理信息
     * 
     * @param vehiclesId 车辆管理主键
     * @return 结果
     */
    @Override
    public int deleteTqcglVehiclesByVehiclesId(Long vehiclesId) {
        return tqcglVehiclesMapper.deleteTqcglVehiclesByVehiclesId(vehiclesId);
    }

    private static final Logger log = LoggerFactory.getLogger(SysUserServiceImpl.class);

    @Autowired
    protected Validator validator;

    @Override
    public String importUser(List<TqcglVehicles> stuList, Boolean isUpdateSupport, String operName) {
        if (StringUtils.isNull(stuList) || stuList.size() == 0) {
            throw new ServiceException("导入车辆基本信息数据不能为空！");
        }
        int successNum = 0;
        int failureNum = 0;
        StringBuilder successMsg = new StringBuilder();
        StringBuilder failureMsg = new StringBuilder();
        for (TqcglVehicles stu : stuList) {
            try {
                // 验证是否存在这个用户
                TqcglVehicles u = tqcglVehiclesMapper.checkNameUnique(stu.getVehiclesLicensePlate());
                if (StringUtils.isNull(u)) {
                    stu.setCreateBy(operName);
                    this.insertTqcglVehicles(stu);
                    successNum++;
                    successMsg.append("<br/>" + successNum + "、车辆 " + stu.getVehiclesLicensePlate() + " 导入成功");
                } else if (isUpdateSupport) {
                    stu.setUpdateBy(operName);
                    this.updateTqcglVehicles(stu);
                    successNum++;
                    successMsg.append("<br/>" + successNum + "、车辆 " + stu.getVehiclesLicensePlate() + " 更新成功");
                } else {
                    failureNum++;
                    failureMsg.append("<br/>" + failureNum + "、车辆 " + stu.getVehiclesLicensePlate() + " 已存在");
                }
            } catch (Exception e) {
                failureNum++;
                String msg = "<br/>" + failureNum + "、车辆 " + stu.getVehiclesLicensePlate() + " 导入失败：";
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
