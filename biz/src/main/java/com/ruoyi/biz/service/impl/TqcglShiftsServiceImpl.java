package com.ruoyi.biz.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.biz.mapper.TqcglShiftsMapper;
import com.ruoyi.biz.domain.TqcglShifts;
import com.ruoyi.biz.service.ITqcglShiftsService;

/**
 * 班次管理Service业务层处理
 * 
 * @author ruoyi
 * @date 2023-04-25
 */
@Service
public class TqcglShiftsServiceImpl implements ITqcglShiftsService 
{
    @Autowired
    private TqcglShiftsMapper tqcglShiftsMapper;

    /**
     * 查询班次管理
     * 
     * @param shiftsId 班次管理主键
     * @return 班次管理
     */
    @Override
    public TqcglShifts selectTqcglShiftsByShiftsId(Long shiftsId)
    {
        return tqcglShiftsMapper.selectTqcglShiftsByShiftsId(shiftsId);
    }

    /**
     * 查询班次管理列表
     * 
     * @param tqcglShifts 班次管理
     * @return 班次管理
     */
    @Override
    public List<TqcglShifts> selectTqcglShiftsList(TqcglShifts tqcglShifts)
    {
        return tqcglShiftsMapper.selectTqcglShiftsList(tqcglShifts);
    }

    /**
     * 新增班次管理
     * 
     * @param tqcglShifts 班次管理
     * @return 结果
     */
    @Override
    public int insertTqcglShifts(TqcglShifts tqcglShifts)
    {
        return tqcglShiftsMapper.insertTqcglShifts(tqcglShifts);
    }

    /**
     * 修改班次管理
     * 
     * @param tqcglShifts 班次管理
     * @return 结果
     */
    @Override
    public int updateTqcglShifts(TqcglShifts tqcglShifts)
    {
        return tqcglShiftsMapper.updateTqcglShifts(tqcglShifts);
    }

    /**
     * 批量删除班次管理
     * 
     * @param shiftsIds 需要删除的班次管理主键
     * @return 结果
     */
    @Override
    public int deleteTqcglShiftsByShiftsIds(Long[] shiftsIds)
    {
        return tqcglShiftsMapper.deleteTqcglShiftsByShiftsIds(shiftsIds);
    }

    /**
     * 删除班次管理信息
     * 
     * @param shiftsId 班次管理主键
     * @return 结果
     */
    @Override
    public int deleteTqcglShiftsByShiftsId(Long shiftsId)
    {
        return tqcglShiftsMapper.deleteTqcglShiftsByShiftsId(shiftsId);
    }
}
