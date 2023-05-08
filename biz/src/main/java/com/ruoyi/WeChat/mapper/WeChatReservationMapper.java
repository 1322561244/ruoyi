package com.ruoyi.WeChat.mapper;

import com.ruoyi.WeChat.domain.WeChatReservation;

import java.util.List;

public interface WeChatReservationMapper {
    /**
     * 所有班次的信息
     *
     * @return 司机管理
     */
    public List<WeChatReservation> selectShiftsList();

    /**
     * 所有班次的状态，通过开始时间和结束时间索引
     *
     * @return 微信服务号预约管理
     */
    public List<WeChatReservation> selectShiftsListByTime(WeChatReservation weChatReservation);

    /**
     * 通过用户id索引当前的用户的乘客
     *
     * @return 微信服务号预约管理
     */
    public Long selectPassengerByUserId(Long userId);


    /**
     * 通过用户id索引当前的用户的乘客
     *
     * @return 微信服务号预约管理
     */
    public String insertReservation(WeChatReservation weChatReservation);
}
