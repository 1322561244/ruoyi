package com.ruoyi.biz.service;

import java.util.List;
import com.ruoyi.biz.domain.TqcglPassenger;

/**
 * 乘客管理Service接口
 *
 * @author zhu
 * @date 2023-05-01
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
