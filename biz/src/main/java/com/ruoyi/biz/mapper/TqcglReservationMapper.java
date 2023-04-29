package com.ruoyi.biz.mapper;

import java.util.List;
import com.ruoyi.biz.domain.TqcglReservation;

/**
 * 预约管理Mapper接口
 * 
 * @author ruoyi
 * @date 2023-04-28
 */
public interface TqcglReservationMapper 
{
    /**
     * 查询预约管理
     * 
     * @param reservationId 预约管理主键
     * @return 预约管理
     */
    public TqcglReservation selectTqcglReservationByReservationId(Long reservationId);

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
     * 删除预约管理
     * 
     * @param reservationId 预约管理主键
     * @return 结果
     */
    public int deleteTqcglReservationByReservationId(Long reservationId);

    /**
     * 批量删除预约管理
     * 
     * @param reservationIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteTqcglReservationByReservationIds(Long[] reservationIds);
}
