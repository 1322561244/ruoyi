package com.ruoyi.Android.controller;

import com.ruoyi.Android.domain.AppLeader;
import com.ruoyi.Android.service.IAppLeaderService;
import com.ruoyi.biz.domain.TqcglDrivers;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.common.utils.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;

import java.util.Date;
import java.util.List;

public class AppLeaderController extends BaseController {
    @Autowired
    IAppLeaderService appLeaderService;
    /***
     * 车长负责的班次列表
     */
    @PreAuthorize("@ss.hasPermi('app:leader:shiftsList')")
    @GetMapping("/shiftsList")
    public TableDataInfo ShiftsList() {
        startPage();
        Long userId= SecurityUtils.getUserId();
        Long leaderId = appLeaderService.findLeaderId(userId);
        List<AppLeader> list=appLeaderService.findShiftsByLeaderId(leaderId);
        return getDataTable(list);
    }

    /***
     * 当前车次的乘客预约信息列表
     */
    @PreAuthorize("@ss.hasPermi('app:leader:shiftsList')")
    @GetMapping("/passengerReservationList")
    public TableDataInfo PassengerReservationList(AppLeader appLeader) {
        startPage();
        List<AppLeader> list=appLeaderService.findPassengerReservaionMessage(appLeader);
        return getDataTable(list);
    }

    /***
     * 当前车次的乘客信息列表
     */
    @PreAuthorize("@ss.hasPermi('app:leader:shiftsList')")
    @GetMapping("/passengerReservationList")
    public TableDataInfo PassengerMessageList(AppLeader appLeader) {
        startPage();
        List<AppLeader> list=appLeaderService.findPassengerMessage(appLeader);
        return getDataTable(list);
    }

    /***
     * 手动更新乘客预约信息（以上车、已取消）
     */
    @PreAuthorize("@ss.hasPermi('app:leader:passengerReservationEdit')")
    @PutMapping
    public AjaxResult edit(@RequestBody AppLeader appLeader) {

        int reservationStatus=appLeader.getReservationStatus();

        /***
         * 如果车长执行取消操作
         */
        if(reservationStatus==2){
            String userName=SecurityUtils.getUsername();
            AppLeader appLeader1=new AppLeader();
            appLeader1.setCancelOperator(userName);
            appLeader1.setCancelDateTime(new Date());
            String message=appLeaderService.updateCancelReservation(appLeader1);
            return StringUtils.isEmpty(message) ? success() : error(message);
        }
        /***
         * 车长执行确认上车操作
         */
        String msg = appLeaderService.updateReservationStatus(appLeader);
        return StringUtils.isEmpty(msg) ? success() : error(msg);
    }

}
