package com.ruoyi.WeChat.service.impl;


import com.ruoyi.WeChat.domain.WeChatReservation;
import com.ruoyi.WeChat.mapper.WeChatReservationMapper;
import com.ruoyi.WeChat.service.IWeChatReservationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class WeChatReservationServiceImpl implements IWeChatReservationService
{
    @Autowired
    WeChatReservationMapper weChatReservationMapper;
    /**
     * 所有班次的信息
     *
     * @return 司机管理
     */
    public List<WeChatReservation> selectShiftsList(){
        return weChatReservationMapper.selectShiftsList();
    }


    /**
     * 所有班次的状态，通过开始时间和结束时间索引
     *
     * @return 微信服务号预约管理
     */
    public List<WeChatReservation> selectShiftsListByTime(WeChatReservation weChatReservation){
        return weChatReservationMapper.selectShiftsListByTime(weChatReservation);
    }

    /**
     * 通过用户id索引当前的用户的乘客
     *
     * @return 微信服务号预约管理
     */
    public Long selectPassengerByUserId(Long userId){
        return weChatReservationMapper.selectPassengerByUserId(userId);
    }

    /**
     * 通过用户id索引当前的用户的乘客
     *
     * @return 微信服务号预约管理
     */
    public String insertReservation(WeChatReservation weChatReservation){
        return weChatReservationMapper.insertReservation(weChatReservation);
    }
}
