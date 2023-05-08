package com.ruoyi.biz.mapper;

import java.util.List;

import com.ruoyi.biz.domain.TqcglPassenger;

/**
 * 乘客管理Mapper接口
 * 
 * @author zhu
 * @date 2023-05-01
 */
public interface TqcglPassengerMapper {
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
     * 删除乘客管理
     * 
     * @param passengerId 乘客管理主键
     * @return 结果
     */
    public int deleteTqcglPassengerByPassengerId(Long passengerId);

    /**
     * 批量删除乘客管理
     * 
     * @param passengerIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteTqcglPassengerByPassengerIds(Long[] passengerIds);

    /**
     * 查询是否存在用户
     * 
     * @param Id ID
     * @return 结果
     */
    public int checkExistUser(Long Id);

}
