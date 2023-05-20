package com.ruoyi.biz.service;

import java.util.List;

import com.ruoyi.biz.domain.TqcglPassenger;

/**
 * 乘客管理Service接口
 * 
 * @author zhu
 * @date 2023-05-01
 */
public interface ITqcglPassengerService {
    /**
     * 查询乘客管理
     * 
     * @param passengerId 乘客管理主键
     * @return 乘客管理
     */
    public TqcglPassenger selectTqcglPassengerByPassengerId(Long passengerId);

    /**
     * 查询乘客管理
     *
     * @param passengerId 乘客管理主键
     * @return 乘客管理
     */
    public TqcglPassenger selectTqcglPassengerByPassengerId2(Long passengerId);

    /**
     * 查询乘客管理列表
     * 
     * @param tqcglPassenger 乘客管理
     * @return 乘客管理集合
     */
    public List<TqcglPassenger> selectTqcglPassengerList(TqcglPassenger tqcglPassenger);

    /**
     * 新增乘客管理
     * 
     * @param tqcglPassenger 乘客管理
     * @return 结果
     */
    public int insertTqcglPassenger(TqcglPassenger tqcglPassenger);

    /**
     * 修改乘客管理
     * 
     * @param tqcglPassenger 乘客管理
     * @return 结果
     */
    public int updateTqcglPassenger(TqcglPassenger tqcglPassenger);

    /**
     * 批量删除乘客管理
     * 
     * @param passengerIds 需要删除的乘客管理主键集合
     * @return 结果
     */
    public int deleteTqcglPassengerByPassengerIds(Long[] passengerIds);

    /**
     * 删除乘客管理信息
     * 
     * @param passengerId 乘客管理主键
     * @return 结果
     */
    public int deleteTqcglPassengerByPassengerId(Long passengerId);

    /**
     * 查询乘客是否存在其他表
     * 
     * @param Id ID
     * @return 结果 true 存在 false 不存在
     */
    public boolean checkExistUser(Long Id);

    /**
     * 导入用户数据
     *
     * @param stuList         用户数据列表
     * @param isUpdateSupport 是否更新支持，如果已存在，则进行更新数据
     * @param operName        操作用户
     * @return 结果
     */
    public String importUser(List<TqcglPassenger> stuList, Boolean isUpdateSupport, String operName);

}
