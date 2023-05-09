package com.ruoyi.Android.service;

import com.ruoyi.Android.domain.AppPassenger;

public interface IAppFaceService {
    public AppPassenger findByPassengerId(Long passengerId);
}
