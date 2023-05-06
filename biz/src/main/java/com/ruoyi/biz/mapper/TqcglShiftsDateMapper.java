package com.ruoyi.biz.mapper;

import java.util.List;
import com.ruoyi.biz.domain.TqcglShiftsDate;

/**
 * 班次日期管理Mapper接口
 * 
 * @author zhu
 * @date 2023-05-07
 */
public interface TqcglShiftsDateMapper 
{
    /**
     * 查询班次日期管理
     * 
     * @param dateId 班次日期管理主键
     * @return 班次日期管理
     */
    public TqcglShiftsDate selectTqcglShiftsDateByDateId(Long dateId);

    /**
     * 查询班次日期管理列表
     * 
     * @param tqcglShiftsDate 班次日期管理
     * @return 班次日期管理集合
     */
    public List<TqcglShiftsDate> selectTqcglShiftsDateList(TqcglShiftsDate tqcglShiftsDate);

    /**
     * 新增班次日期管理
     * 
     * @param tqcglShiftsDate 班次日期管理
     * @return 结果
     */
    public int insertTqcglShiftsDate(TqcglShiftsDate tqcglShiftsDate);

    /**
     * 修改班次日期管理
     * 
     * @param tqcglShiftsDate 班次日期管理
     * @return 结果
     */
    public int updateTqcglShiftsDate(TqcglShiftsDate tqcglShiftsDate);

    /**
     * 删除班次日期管理
     * 
     * @param dateId 班次日期管理主键
     * @return 结果
     */
    public int deleteTqcglShiftsDateByDateId(Long dateId);

    /**
     * 批量删除班次日期管理
     * 
     * @param dateIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteTqcglShiftsDateByDateIds(Long[] dateIds);
}
