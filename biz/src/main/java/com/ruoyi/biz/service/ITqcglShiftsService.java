package com.ruoyi.biz.service;

import java.util.List;
import com.ruoyi.biz.domain.TqcglShifts;

/**
 * 班次管理Service接口
 * 
 * @author ruoyi
 * @date 2023-04-28
 */
public interface ITqcglShiftsService 
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
     * 批量删除班次管理
     * 
     * @param shiftsIds 需要删除的班次管理主键集合
     * @return 结果
     */
    public int deleteTqcglShiftsByShiftsIds(Long[] shiftsIds);

    /**
     * 删除班次管理信息
     * 
     * @param shiftsId 班次管理主键
     * @return 结果
     */
    public int deleteTqcglShiftsByShiftsId(Long shiftsId);

    public int selectVehicleCapacityByShiftsId(Long shiftsId);


    /**
     * 当满人时更新b班次的可预约状态为不可预约
     * */
    public int updateTqcglShiftsStatus(TqcglShifts tqcglShifts);
}
