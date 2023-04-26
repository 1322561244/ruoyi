package com.ruoyi.biz.service;

import java.util.List;

import com.ruoyi.biz.domain.TqcglDrivers;

/**
 * 司机管理Service接口
 * 
 * @author ruoyi
 * @date 2023-04-25
 */
public interface ITqcglDriversService {
    /**
     * 查询司机管理
     * 
     * @param driversId 司机管理主键
     * @return 司机管理
     */
    public TqcglDrivers selectTqcglDriversByDriversId(Long driversId);

    /**
     * 查询司机管理列表
     * 
     * @param tqcglDrivers 司机管理
     * @return 司机管理集合
     */
    public List<TqcglDrivers> selectTqcglDriversList(TqcglDrivers tqcglDrivers);

    /**
     * 新增司机管理
     * 
     * @param tqcglDrivers 司机管理
     * @return 结果
     */
    public String insertTqcglDrivers(TqcglDrivers tqcglDrivers);

    /**
     * 修改司机管理
     * 
     * @param tqcglDrivers 司机管理
     * @return 结果
     */
    public String updateTqcglDrivers(TqcglDrivers tqcglDrivers);

    /**
     * 批量删除司机管理
     * 
     * @param driversIds 需要删除的司机管理主键集合
     * @return 结果
     */
    public int deleteTqcglDriversByDriversIds(Long[] driversIds);

    /**
     * 删除司机管理信息
     * 
     * @param driversId 司机管理主键
     * @return 结果
     */
    public int deleteTqcglDriversByDriversId(Long driversId);
}
