package com.ruoyi.biz.service;

import java.util.List;
import com.ruoyi.biz.domain.TqcglVehicles;

/**
 * 车辆管理Service接口
 * 
 * @author ruoyi
 * @date 2023-04-25
 */
public interface ITqcglVehiclesService 
{
    /**
     * 查询车辆管理
     * 
     * @param vehiclesId 车辆管理主键
     * @return 车辆管理
     */
    public TqcglVehicles selectTqcglVehiclesByVehiclesId(Long vehiclesId);

    /**
     * 查询车辆管理列表
     * 
     * @param tqcglVehicles 车辆管理
     * @return 车辆管理集合
     */
    public List<TqcglVehicles> selectTqcglVehiclesList(TqcglVehicles tqcglVehicles);

    /**
     * 新增车辆管理
     * 
     * @param tqcglVehicles 车辆管理
     * @return 结果
     */
    public int insertTqcglVehicles(TqcglVehicles tqcglVehicles);

    /**
     * 修改车辆管理
     * 
     * @param tqcglVehicles 车辆管理
     * @return 结果
     */
    public int updateTqcglVehicles(TqcglVehicles tqcglVehicles);

    /**
     * 批量删除车辆管理
     * 
     * @param vehiclesIds 需要删除的车辆管理主键集合
     * @return 结果
     */
    public int deleteTqcglVehiclesByVehiclesIds(Long[] vehiclesIds);

    /**
     * 删除车辆管理信息
     * 
     * @param vehiclesId 车辆管理主键
     * @return 结果
     */
    public int deleteTqcglVehiclesByVehiclesId(Long vehiclesId);
}
