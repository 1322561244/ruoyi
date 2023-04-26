package com.ruoyi.biz.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.biz.mapper.TqcglDriversMapper;
import com.ruoyi.biz.domain.TqcglDrivers;
import com.ruoyi.biz.service.ITqcglDriversService;

/**
 * 司机管理Service业务层处理
 * 
 * @author ruoyi
 * @date 2023-04-25
 */
@Service
public class TqcglDriversServiceImpl implements ITqcglDriversService 
{
    @Autowired
    private TqcglDriversMapper tqcglDriversMapper;

    /**
     * 查询司机管理
     * 
     * @param driversId 司机管理主键
     * @return 司机管理
     */
    @Override
    public TqcglDrivers selectTqcglDriversByDriversId(Long driversId)
    {
        return tqcglDriversMapper.selectTqcglDriversByDriversId(driversId);
    }

    /**
     * 查询司机管理列表
     * 
     * @param tqcglDrivers 司机管理
     * @return 司机管理
     */
    @Override
    public List<TqcglDrivers> selectTqcglDriversList(TqcglDrivers tqcglDrivers)
    {
        return tqcglDriversMapper.selectTqcglDriversList(tqcglDrivers);
    }

    /**
     * 新增司机管理
     * 
     * @param tqcglDrivers 司机管理
     * @return 结果
     */
    @Override
    public int insertTqcglDrivers(TqcglDrivers tqcglDrivers)
    {
        return tqcglDriversMapper.insertTqcglDrivers(tqcglDrivers);
    }

    /**
     * 修改司机管理
     * 
     * @param tqcglDrivers 司机管理
     * @return 结果
     */
    @Override
    public int updateTqcglDrivers(TqcglDrivers tqcglDrivers)
    {
        return tqcglDriversMapper.updateTqcglDrivers(tqcglDrivers);
    }

    /**
     * 批量删除司机管理
     * 
     * @param driversIds 需要删除的司机管理主键
     * @return 结果
     */
    @Override
    public int deleteTqcglDriversByDriversIds(Long[] driversIds)
    {
        return tqcglDriversMapper.deleteTqcglDriversByDriversIds(driversIds);
    }

    /**
     * 删除司机管理信息
     * 
     * @param driversId 司机管理主键
     * @return 结果
     */
    @Override
    public int deleteTqcglDriversByDriversId(Long driversId)
    {
        return tqcglDriversMapper.deleteTqcglDriversByDriversId(driversId);
    }
}
