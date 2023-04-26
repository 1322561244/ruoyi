package com.ruoyi.biz.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.biz.mapper.TqcglVehiclesMapper;
import com.ruoyi.biz.domain.TqcglVehicles;
import com.ruoyi.biz.service.ITqcglVehiclesService;

/**
 * 车辆管理Service业务层处理
 * 
 * @author ruoyi
 * @date 2023-04-25
 */
@Service
public class TqcglVehiclesServiceImpl implements ITqcglVehiclesService 
{
    @Autowired
    private TqcglVehiclesMapper tqcglVehiclesMapper;

    /**
     * 查询车辆管理
     * 
     * @param vehiclesId 车辆管理主键
     * @return 车辆管理
     */
    @Override
    public TqcglVehicles selectTqcglVehiclesByVehiclesId(Long vehiclesId)
    {
        return tqcglVehiclesMapper.selectTqcglVehiclesByVehiclesId(vehiclesId);
    }

    /**
     * 查询车辆管理列表
     * 
     * @param tqcglVehicles 车辆管理
     * @return 车辆管理
     */
    @Override
    public List<TqcglVehicles> selectTqcglVehiclesList(TqcglVehicles tqcglVehicles)
    {
        return tqcglVehiclesMapper.selectTqcglVehiclesList(tqcglVehicles);
    }

    /**
     * 新增车辆管理
     * 
     * @param tqcglVehicles 车辆管理
     * @return 结果
     */
    @Override
    public int insertTqcglVehicles(TqcglVehicles tqcglVehicles)
    {
        return tqcglVehiclesMapper.insertTqcglVehicles(tqcglVehicles);
    }

    /**
     * 修改车辆管理
     * 
     * @param tqcglVehicles 车辆管理
     * @return 结果
     */
    @Override
    public int updateTqcglVehicles(TqcglVehicles tqcglVehicles)
    {
        return tqcglVehiclesMapper.updateTqcglVehicles(tqcglVehicles);
    }

    /**
     * 批量删除车辆管理
     * 
     * @param vehiclesIds 需要删除的车辆管理主键
     * @return 结果
     */
    @Override
    public int deleteTqcglVehiclesByVehiclesIds(Long[] vehiclesIds)
    {
        return tqcglVehiclesMapper.deleteTqcglVehiclesByVehiclesIds(vehiclesIds);
    }

    /**
     * 删除车辆管理信息
     * 
     * @param vehiclesId 车辆管理主键
     * @return 结果
     */
    @Override
    public int deleteTqcglVehiclesByVehiclesId(Long vehiclesId)
    {
        return tqcglVehiclesMapper.deleteTqcglVehiclesByVehiclesId(vehiclesId);
    }
}
