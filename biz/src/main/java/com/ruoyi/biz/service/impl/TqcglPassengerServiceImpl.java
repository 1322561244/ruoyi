package com.ruoyi.biz.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ruoyi.biz.domain.TqcglPassenger;
import com.ruoyi.biz.mapper.TqcglPassengerMapper;
import com.ruoyi.biz.service.ITqcglPassengerService;

/**
 * 乘客管理Service业务层处理
 * 
 * @author zhu
 * @date 2023-05-01
 */
@Service
public class TqcglPassengerServiceImpl implements ITqcglPassengerService {
    @Autowired
    private TqcglPassengerMapper tqcglPassengerMapper;

    /**
     * 查询乘客管理
     * 
     * @param passengerId 乘客管理主键
     * @return 乘客管理
     */
    @Override
    public TqcglPassenger selectTqcglPassengerByPassengerId(Long passengerId) {
        return tqcglPassengerMapper.selectTqcglPassengerByPassengerId(passengerId);
    }

    /**
     * 查询乘客管理
     *
     * @param passengerId 乘客管理主键
     * @return 乘客管理
     */
    @Override
    public TqcglPassenger selectTqcglPassengerByPassengerId2(Long passengerId) {
        return tqcglPassengerMapper.selectTqcglPassengerByPassengerId2(passengerId);
    }

    /**
     * 查询乘客管理列表
     * 
     * @param tqcglPassenger 乘客管理
     * @return 乘客管理
     */
    @Override
    public List<TqcglPassenger> selectTqcglPassengerList(TqcglPassenger tqcglPassenger) {
        return tqcglPassengerMapper.selectTqcglPassengerList(tqcglPassenger);
    }

    /**
     * 新增乘客管理
     * 
     * @param tqcglPassenger 乘客管理
     * @return 结果
     */
    @Override
    public int insertTqcglPassenger(TqcglPassenger tqcglPassenger) {
        return tqcglPassengerMapper.insertTqcglPassenger(tqcglPassenger);
    }

    /**
     * 修改乘客管理
     * 
     * @param tqcglPassenger 乘客管理
     * @return 结果
     */
    @Override
    public int updateTqcglPassenger(TqcglPassenger tqcglPassenger) {
        return tqcglPassengerMapper.updateTqcglPassenger(tqcglPassenger);
    }

    /**
     * 批量删除乘客管理
     * 
     * @param passengerIds 需要删除的乘客管理主键
     * @return 结果
     */
    @Override
    public int deleteTqcglPassengerByPassengerIds(Long[] passengerIds) {
        return tqcglPassengerMapper.deleteTqcglPassengerByPassengerIds(passengerIds);
    }

    /**
     * 删除乘客管理信息
     * 
     * @param passengerId 乘客管理主键
     * @return 结果
     */
    @Override
    public int deleteTqcglPassengerByPassengerId(Long passengerId) {
        return tqcglPassengerMapper.deleteTqcglPassengerByPassengerId(passengerId);
    }

    @Override
    public boolean checkExistUser(Long Id) {
        int result = tqcglPassengerMapper.checkExistUser(Id);
        return result > 0;
    }

}
