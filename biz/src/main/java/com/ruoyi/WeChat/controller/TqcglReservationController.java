package com.ruoyi.WeChat.controller;

import com.ruoyi.biz.domain.TqcglEnterprise;
import com.ruoyi.biz.domain.TqcglReservation;
import com.ruoyi.biz.domain.TqcglShifts;
import com.ruoyi.biz.service.ITqcglReservationService;
import com.ruoyi.biz.service.ITqcglShiftsService;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.StringUtils;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import java.util.List;

public class TqcglReservationController extends BaseController {
    private ITqcglReservationService tqcglReservationService;
    private ITqcglShiftsService tqcglShiftsService;


//    /**
//     * 索引所有可以选择的班次
//     */
//
//    @GetMapping("/list")
//    public TableDataInfo list(TqcglShifts tqcglShifts)
//    {
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
