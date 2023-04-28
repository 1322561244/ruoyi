package com.ruoyi.biz.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.biz.mapper.TqcglReservationMapper;
import com.ruoyi.biz.domain.TqcglReservation;
import com.ruoyi.biz.service.ITqcglReservationService;

/**
 * 预约管理Service业务层处理
 * 
 * @author ruoyi
 * @date 2023-04-28
 */
@Service
public class TqcglReservationServiceImpl implements ITqcglReservationService 
{
    @Autowired
    private TqcglReservationMapper tqcglReservationMapper;

    /**
     * 查询预约管理
     * 
     * @param reservationId 预约管理主键
     * @return 预约管理
     */
    @Override
    public TqcglReservation selectTqcglReservationByReservationId(Long reservationId)
    {
        return tqcglReservationMapper.selectTqcglReservationByReservationId(reservationId);
    }

    /**
     * 查询预约管理列表
     * 
     * @param tqcglReservation 预约管理
     * @return 预约管理
     */
    @Override
    public List<TqcglReservation> selectTqcglReservationList(TqcglReservation tqcglReservation)
    {
        return tqcglReservationMapper.selectTqcglReservationList(tqcglReservation);
    }

    /**
     * 新增预约管理
     * 
     * @param tqcglReservation 预约管理
     * @return 结果
     */
    @Override
    public int insertTqcglReservation(TqcglReservation tqcglReservation)
    {
        return tqcglReservationMapper.insertTqcglReservation(tqcglReservation);
    }

    /**
     * 修改预约管理
     * 
     * @param tqcglReservation 预约管理
     * @return 结果
     */
    @Override
    public int updateTqcglReservation(TqcglReservation tqcglReservation)
    {
        return tqcglReservationMapper.updateTqcglReservation(tqcglReservation);
    }

    /**
     * 批量删除预约管理
     * 
     * @param reservationIds 需要删除的预约管理主键
     * @return 结果
     */
    @Override
    public int deleteTqcglReservationByReservationIds(Long[] reservationIds)
    {
        return tqcglReservationMapper.deleteTqcglReservationByReservationIds(reservationIds);
    }

    /**
     * 删除预约管理信息
     * 
     * @param reservationId 预约管理主键
     * @return 结果
     */
    @Override
    public int deleteTqcglReservationByReservationId(Long reservationId)
    {
        return tqcglReservationMapper.deleteTqcglReservationByReservationId(reservationId);
    }
}
