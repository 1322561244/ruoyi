package com.ruoyi.Android.service.impl;

import com.ruoyi.Android.domain.AppLeader;
import com.ruoyi.Android.mapper.AppLeaderMapper;
import com.ruoyi.Android.service.IAppFaceService;
import com.ruoyi.Android.service.IAppLeaderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class AppLeaderServiceImpl implements IAppLeaderService {
    @Autowired
    AppLeaderMapper appLeaderMapper;

    public Long findLeaderId(Long userId){
        return appLeaderMapper.findLeaderId(userId);
    }

    public List<AppLeader> findShiftsByLeaderId(Long leaderId){
        return appLeaderMapper.findShiftsByLeaderId(leaderId);
    }

    public List<AppLeader> findPassengerReservaionMessage(AppLeader appLeader){
        return appLeaderMapper.findPassengerReservaionMessage(appLeader);
    }

    public List<AppLeader> findPassengerMessage(AppLeader appLeader){
        return appLeaderMapper.findPassengerMessage(appLeader);
    }


    public String updateCancelReservation(AppLeader appLeader){
        return appLeaderMapper.updateCancelReservation(appLeader);
    }

    public String updateReservationStatus(AppLeader appLeader){
        return appLeaderMapper.updateReservationStatus(appLeader);
    }
}
