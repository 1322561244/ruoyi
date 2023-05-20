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

    /**
     * 查询司机是否存在其他表
     * 
     * @param Id ID
     * @return 结果 true 存在 false 不存在
     */
    public boolean checkExistUser(Long Id);

    /**
     * 导入用户数据
     *
     * @param driverList      用户数据列表
     * @param isUpdateSupport 是否更新支持，如果已存在，则进行更新数据
     * @param operName        操作用户
     * @return 结果
     */
    public String importUser(List<TqcglDrivers> driverList, Boolean isUpdateSupport, String operName);

}
