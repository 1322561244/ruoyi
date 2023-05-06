package com.ruoyi.biz.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.biz.mapper.TqcglShiftsDateMapper;
import com.ruoyi.biz.domain.TqcglShiftsDate;
import com.ruoyi.biz.service.ITqcglShiftsDateService;

/**
 * 班次日期管理Service业务层处理
 * 
 * @author zhu
 * @date 2023-05-07
 */
@Service
public class TqcglShiftsDateServiceImpl implements ITqcglShiftsDateService 
{
    @Autowired
    private TqcglShiftsDateMapper tqcglShiftsDateMapper;

    /**
     * 查询班次日期管理
     * 
     * @param dateId 班次日期管理主键
     * @return 班次日期管理
     */
    @Override
    public TqcglShiftsDate selectTqcglShiftsDateByDateId(Long dateId)
    {
        return tqcglShiftsDateMapper.selectTqcglShiftsDateByDateId(dateId);
    }

    /**
     * 查询班次日期管理列表
     * 
     * @param tqcglShiftsDate 班次日期管理
     * @return 班次日期管理
     */
    @Override
    public List<TqcglShiftsDate> selectTqcglShiftsDateList(TqcglShiftsDate tqcglShiftsDate)
    {
        return tqcglShiftsDateMapper.selectTqcglShiftsDateList(tqcglShiftsDate);
    }

    /**
     * 新增班次日期管理
     * 
     * @param tqcglShiftsDate 班次日期管理
     * @return 结果
     */
    @Override
    public int insertTqcglShiftsDate(TqcglShiftsDate tqcglShiftsDate)
    {
        return tqcglShiftsDateMapper.insertTqcglShiftsDate(tqcglShiftsDate);
    }

    /**
     * 修改班次日期管理
     * 
     * @param tqcglShiftsDate 班次日期管理
     * @return 结果
     */
    @Override
    public int updateTqcglShiftsDate(TqcglShiftsDate tqcglShiftsDate)
    {
        return tqcglShiftsDateMapper.updateTqcglShiftsDate(tqcglShiftsDate);
    }

    /**
     * 批量删除班次日期管理
     * 
     * @param dateIds 需要删除的班次日期管理主键
     * @return 结果
     */
    @Override
    public int deleteTqcglShiftsDateByDateIds(Long[] dateIds)
    {
        return tqcglShiftsDateMapper.deleteTqcglShiftsDateByDateIds(dateIds);
    }

    /**
     * 删除班次日期管理信息
     * 
     * @param dateId 班次日期管理主键
     * @return 结果
     */
    @Override
    public int deleteTqcglShiftsDateByDateId(Long dateId)
    {
        return tqcglShiftsDateMapper.deleteTqcglShiftsDateByDateId(dateId);
    }
}
