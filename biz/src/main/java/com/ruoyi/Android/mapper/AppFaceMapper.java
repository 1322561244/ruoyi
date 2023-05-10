package com.ruoyi.Android.mapper;

import com.ruoyi.Android.domain.AppPassenger;

public interface AppFaceMapper {
    public AppPassenger findByPassengerId(Long passengerId);

    public void updateReservationStatus(Long reservationId);

}
