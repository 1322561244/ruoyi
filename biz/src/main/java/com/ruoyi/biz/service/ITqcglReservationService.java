package com.ruoyi.biz.service;

import java.util.List;
import com.ruoyi.biz.domain.TqcglReservation;

/**
 * 预约管理Service接口
 * 
 * @author ruoyi
 * @date 2023-04-28
 */
public interface ITqcglReservationService 
{
    /**
     * 查询预约管理
     * 
     * @param reservationId 预约管理主键
     * @return 预约管理
     */
    public TqcglReservation selectTqcglReservationByReservationId(Long reservationId);


    /**
     * 查询预约管理
     *
     * @param reservationId 预约管理主键
     * @return 预约管理
     */
    public TqcglReservation selectTqcglReservationByReservationId2(Long reservationId);


    /**
     * 查询预约管理列表
     * 
     * @param tqcglReservation 预约管理
     * @return 预约管理集合
     */
    public List<TqcglReservation> selectTqcglReservationList(TqcglReservation tqcglReservation);

    /**
     * 新增预约管理
     * 
     * @param tqcglReservation 预约管理
     * @return 结果
     */
    public int insertTqcglReservation(TqcglReservation tqcglReservation);

    /**
     * 修改预约管理
     * 
     * @param tqcglReservation 预约管理
     * @return 结果
     */
    public int updateTqcglReservation(TqcglReservation tqcglReservation);

    /**
     * 批量删除预约管理
     * 
     * @param reservationIds 需要删除的预约管理主键集合
     * @return 结果
     */
    public int deleteTqcglReservationByReservationIds(Long[] reservationIds);

    /**
     * 删除预约管理信息
     * 
     * @param reservationId 预约管理主键
     * @return 结果
     */
    public int deleteTqcglReservationByReservationId(Long reservationId);
}
