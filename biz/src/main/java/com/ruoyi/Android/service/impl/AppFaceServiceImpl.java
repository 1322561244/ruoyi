package com.ruoyi.Android.service.impl;

import com.ruoyi.Android.domain.AppPassenger;
import com.ruoyi.Android.mapper.AppFaceMapper;
import com.ruoyi.Android.service.IAppFaceService;
import org.springframework.stereotype.Service;

@Service
public class AppFaceServiceImpl implements IAppFaceService {
    AppFaceMapper appFaceMapper;
    public AppPassenger findByPassengerId(Long passengerId){
        return  appFaceMapper.findByPassengerId(passengerId);
    }
}
