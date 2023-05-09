package com.ruoyi.WeChat.service;

import com.ruoyi.WeChat.domain.WeChatReservation;

import java.util.List;

public interface IWeChatReservationService
{
    /**
     * 所有班次的信息
     *
     * @return 微信服务号预约管理
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

    /**
     * 通过shiftsId索引当前班次已经预约的人数
     *
     * @return 微信服务号预约管理
     */
    public int selectShiftsCountById(WeChatReservation weChatReservation);

    /**
     * 通过shiftsId索引当前班次的限载人数
     *
     * @return 微信服务号预约管理
     */
    public int selectVehicleCapacityByShiftsId(Long shiftsId);


    /**
     * 预约人数满了修改这一天预约班次的可预约状态
     *
     * @return 微信服务号预约管理
     */
    public void updateShiftsStatus(WeChatReservation weChatReservation);


    /**
     * 所有未超时的预约信息
     *
     * @return 微信服务号预约管理
     */
    public List<WeChatReservation> selectNoTimeoutList(Long userId);

    /**
     * 取消预约信息
     *
     * @return 微信服务号预约管理
     */
    public String cancelReservation(WeChatReservation weChatReservation);

    /**
     * 所有已超时的预约信息
     *
     * @return 微信服务号预约管理
     */
    public List<WeChatReservation> selectTimeoutList(Long userId);


}
