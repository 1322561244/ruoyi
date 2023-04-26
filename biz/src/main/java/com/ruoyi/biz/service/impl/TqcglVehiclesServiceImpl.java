package com.ruoyi.biz.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ruoyi.biz.domain.TqcglVehicles;
import com.ruoyi.biz.mapper.TqcglVehiclesMapper;
import com.ruoyi.biz.service.ITqcglVehiclesService;
import com.ruoyi.common.utils.StringUtils;

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
}
