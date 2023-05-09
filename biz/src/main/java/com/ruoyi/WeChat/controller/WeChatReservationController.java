package com.ruoyi.WeChat.controller;

import com.ruoyi.WeChat.domain.WeChatReservation;
import com.ruoyi.WeChat.service.IWeChatReservationService;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.common.utils.StringUtils;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.Date;
import java.util.List;

@RestController
@RequestMapping("/WeChat/reservation")
public class WeChatReservationController extends BaseController {

    IWeChatReservationService weChatReservationService;

    /**
     * 索引所有可以选择的班次
     */

    @GetMapping("/ShiftList")
    public TableDataInfo ShiftsList() {
        startPage();
        List<WeChatReservation> list = weChatReservationService.selectShiftsList();
        return getDataTable(list);
    }

    /**
     * 根据开始时间和结束时间索引所有班次的时间信息
     */
    @GetMapping("/timeList")
    public TableDataInfo ShiftsTimelist(WeChatReservation weChatReservation) {
        startPage();
        List<WeChatReservation> list = weChatReservationService.selectShiftsListByTime(weChatReservation);
        return getDataTable(list);
    }

    /**
     * 预约班次管理，当使用人选中班次，且点击确定按钮时，传过来dateId,shiftsId,dateTime,shiftsStatus
     */
    @PreAuthorize("@ss.hasPermi('WeChat:reservation:add')")
    @Log(title = "预约班次管理", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody WeChatReservation weChatReservation) {
        Long userId = SecurityUtils.getUserId();
        String message="错误当前班次不可预约";
        if (weChatReservation.getShiftsStatus()==0){
            return StringUtils.isEmpty(message) ? success() : error(message);
        }

        Long shiftsId=weChatReservation.getShiftsId();
        Long passengerId = weChatReservationService.selectPassengerByUserId(userId);
        weChatReservation.setPassengerId(passengerId);
        Date now = new Date();
        weChatReservation.setCreationTime(now);
        String msg = weChatReservationService.insertReservation(weChatReservation);
        //插入了之后还要判断班次是否满人，如果满人了需要更新班次状态，可预约→不可预约

        //当前班次已经预约人数
        int count = weChatReservationService.selectShiftsCountById(weChatReservation);
        //当前班次的限载人数
        int number = weChatReservationService.selectVehicleCapacityByShiftsId(shiftsId);

        if (count == number) {
            weChatReservationService.updateShiftsStatus(weChatReservation);
        }


        return StringUtils.isEmpty(msg) ? success() : error(msg);
    }

    /**
     * 索引所有未过期的预约信息
     */
    @GetMapping("/noTimeoutList")
    public TableDataInfo noTimeoutList() {
        startPage();
        Long userId = SecurityUtils.getUserId();
        List<WeChatReservation> list = weChatReservationService.selectNoTimeoutList(userId);
        return getDataTable(list);
    }

    /**
     * 取消预约
     */
    @PreAuthorize("@ss.hasPermi('biz:reservation:cancel')")
    @Log(title = "预约管理", businessType = BusinessType.DELETE)
    @GetMapping("/{reservationId}")
    public AjaxResult cancelReservation(@PathVariable Long reservationId) {
        /*上面做索引全部为过期的预约信息时已经传了数据到前端，前端要保留*/

        String userName=SecurityUtils.getUsername();
        Date now=new Date();
        WeChatReservation weChatReservation=new WeChatReservation();
        weChatReservation.setReservationId(reservationId);
        weChatReservation.setUserName(userName);
        weChatReservation.setDateTime(now);
        String msg=weChatReservationService.cancelReservation(weChatReservation);
        return StringUtils.isEmpty(msg) ? success() : error(msg);
    }

    /**
     * 索引所有已过期的预约信息
     */
    @GetMapping("/timeoutList")
    public TableDataInfo TimeoutList() {
        startPage();
        Long userId = SecurityUtils.getUserId();
        List<WeChatReservation> list = weChatReservationService.selectTimeoutList(userId);
        return getDataTable(list);
    }
}
