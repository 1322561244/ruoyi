package com.ruoyi.Android.service;

import com.ruoyi.Android.domain.AppLeader;

import java.util.List;

public interface IAppLeaderService {

    public Long findLeaderId(Long userId);

    public List<AppLeader> findShiftsByLeaderId(Long leaderId);

    public List<AppLeader> findPassengerReservaionMessage(AppLeader appLeader);

    public List<AppLeader> findPassengerMessage(AppLeader appLeader);

    public String updateCancelReservation(AppLeader appLeader);

    public String updateReservationStatus(AppLeader appLeader);
}
