package com.ruoyi.biz.service;

import java.util.List;
import com.ruoyi.biz.domain.TqcglPassenger;
import com.ruoyi.biz.domain.TqcglPassenger2;

/**
 * 乘客管理Service接口
 * 
 * @author ruoyi
 * @date 2023-04-25
 */
public interface ITqcglPassengerService 
{
    /**
     * 查询乘客管理
     * 
     * @param passengerId 乘客管理主键
     * @return 乘客管理
     */
    public TqcglPassenger selectTqcglPassengerByPassengerId(Long passengerId);

    /**
     * 查询乘客管理列表
     * 
     * @param tqcglPassenger 乘客管理
     * @return 乘客管理集合
     */
    public List<TqcglPassenger> selectTqcglPassengerList(TqcglPassenger tqcglPassenger);


    /**
     * 查询乘客表列表
     *
     * @param tqcglPassenger2 乘客表
     * @return 乘客表集合
     */
    public List<TqcglPassenger2> selectTqcglPassenger2List(TqcglPassenger tqcglPassenger);
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
}
