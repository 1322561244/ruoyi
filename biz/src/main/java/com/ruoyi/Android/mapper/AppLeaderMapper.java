package com.ruoyi.Android.mapper;

import com.ruoyi.Android.domain.AppLeader;

import java.util.List;

public interface AppLeaderMapper {

    /**
     * 获取车长==当前账号
     * @param userId
     * @return
     */
    public Long findLeaderId(Long userId);


    /***
     * 车长管理的班次信息
     * @param leaderId
     * @return
     */
    public List<AppLeader> findShiftsByLeaderId(Long leaderId);

    /***
     * 乘客预约信息
     * @param appLeader
     * @return
     */
    public List<AppLeader> findPassengerReservaionMessage(AppLeader appLeader);

    /***
     * 乘客信息
     */
    public List<AppLeader> findPassengerMessage(AppLeader appLeader);


    public String updateCancelReservation(AppLeader appLeader);

    public String updateReservationStatus(AppLeader appLeader);
}
