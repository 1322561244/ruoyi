package com.ruoyi.WeChat.controller;

import com.ruoyi.WeChat.domain.WeChatReservation;
import com.ruoyi.WeChat.service.IWeChatReservationService;
import com.ruoyi.biz.domain.TqcglReservation;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.common.utils.StringUtils;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/WeChat/reservation")
public class WeChatReservationController extends BaseController {

    IWeChatReservationService weChatReservationService;

    /**
     * 索引所有可以选择的班次
     */

    @GetMapping("/list")
    public TableDataInfo Shiftslist() {
        startPage();
        List<WeChatReservation> list = weChatReservationService.selectShiftsList();
        return getDataTable(list);
    }

    /**
     * 根据开始时间和结束时间索引所有班次的时间信息
     */
    @GetMapping("/TimeList")
    public TableDataInfo ShiftsTimelist(WeChatReservation weChatReservation) {
        startPage();
        List<WeChatReservation> list = weChatReservationService.selectShiftsListByTime(weChatReservation);
        return getDataTable(list);
    }

    /**
     * 预约班次管理，当使用人选中班次，且点击确定按钮时
     */
    @PreAuthorize("@ss.hasPermi('WeChat:reservation:add')")
    @Log(title = "预约班次管理", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody WeChatReservation weChatReservation)
    {
        Long userId= SecurityUtils.getUserId();
        Long passengerId=weChatReservationService.selectPassengerByUserId(userId);

        //weChatReservation.setPassengerId(passengerId);

        String msg=weChatReservationService.insertReservation(weChatReservation);
        //插入了之后还要判断班次是否满人，如果满人了需要更新班次状态，可预约→不可预约



        return StringUtils.isEmpty(msg) ? success() : error(msg);
    }

//    /**
//     * 索引所有班次的预约信息
//     */
//
//    @GetMapping("/reservationList")
//    public TableDataInfo Reservationlist(TqcglShifts tqcglShifts) {
//        startPage();
//        List<TqcglShifts> list = tqcglShiftsService.selectTqcglShiftsList(tqcglShifts);
//        return getDataTable(list);
//    }

//
//
//    /**
//     * 新增预约
//     *
//     */
//    //@PreAuthorize("@ss.hasPermi('biz:enterprise:add')")
//
//    @PostMapping
//    public AjaxResult add(@RequestBody TqcglReservation tqcglReservation) {
//
//        String message="错误当前班次不可预约";
//        if (tqcglReservation.getReservationStatus()==0){
//            return StringUtils.isEmpty(message) ? success() : error(message);
//        }
//
//        Long shiftsId=tqcglReservation.getShiftsId();
//
//
//        TqcglShifts tqcglshifts=new TqcglShifts();
//        tqcglshifts.setShiftsId(shiftsId);
//        //当前班次已经预约人数
//        int count=tqcglReservationService.selectShiftsCountById(shiftsId);
//        //当前班次的限载人数
//        int number=tqcglShiftsService.selectVehicleCapacityByShiftsId(shiftsId);
//        if(count==number){
//            int test=tqcglShiftsService.updateTqcglShiftsStatus(tqcglshifts);
//        }
//
//        String msg = tqcglReservationService.insertTqcglReservation2(tqcglReservation);
//        /**索引当前班次是否*/
//        return StringUtils.isEmpty(msg) ? success() : error(msg);
//    }
}
