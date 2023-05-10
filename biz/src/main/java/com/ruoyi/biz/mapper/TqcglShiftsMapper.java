package com.ruoyi.biz.mapper;

import java.util.List;
import com.ruoyi.biz.domain.TqcglShifts;

/**
 * 班次管理Mapper接口
 * 
 * @author ruoyi
 * @date 2023-04-28
 */
public interface TqcglShiftsMapper 
{
    /**
     * 查询班次管理
     * 
     * @param shiftsId 班次管理主键
     * @return 班次管理
     */
    public TqcglShifts selectTqcglShiftsByShiftsId(Long shiftsId);


    /**
     * 查询班次管理
     *
     * @param shiftsId 班次管理主键
     * @return 班次管理
     */
    public TqcglShifts selectTqcglShiftsByShiftsId2(Long shiftsId);


    /**
     * 查询班次管理列表
     * 
     * @param tqcglShifts 班次管理
     * @return 班次管理集合
     */
    public List<TqcglShifts> selectTqcglShiftsList(TqcglShifts tqcglShifts);

    /**
     * 新增班次管理
     * 
     * @param tqcglShifts 班次管理
     * @return 结果
     */
    public int insertTqcglShifts(TqcglShifts tqcglShifts);

    /**
     * 修改班次管理
     * 
     * @param tqcglShifts 班次管理
     * @return 结果
     */
    public int updateTqcglShifts(TqcglShifts tqcglShifts);

    /**
     * 删除班次管理
     * 
     * @param shiftsId 班次管理主键
     * @return 结果
     */
    public int deleteTqcglShiftsByShiftsId(Long shiftsId);

    /**
     * 批量删除班次管理
     * 
     * @param shiftsIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteTqcglShiftsByShiftsIds(Long[] shiftsIds);


    public int selectVehicleCapacityByShiftsId(Long shiftsId);


    /**
     * 修改班次管理
     *
     * @param tqcglShifts 班次管理
     * @return 结果
     */
    public int updateTqcglShiftsStatus(TqcglShifts tqcglShifts);

    /**
     * 查询班次管理列表
     *
     * @param tqcglShifts 班次管理
     * @return 班次管理集合
     */
    public List<TqcglShifts> selectShiftsList(TqcglShifts tqcglShifts);
}
