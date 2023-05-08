package com.ruoyi.biz.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ruoyi.biz.domain.TqcglReservation;
import com.ruoyi.biz.service.ITqcglReservationService;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.system.service.ISysUserService;

/**
 * 预约管理Controller
 * 
 * @author ruoyi
 * @date 2023-04-28
 */
@RestController
@RequestMapping("/biz/reservation")
public class TqcglReservationController extends BaseController {
    @Autowired
    private ITqcglReservationService tqcglReservationService;

    @Autowired
    private ISysUserService userService;

    /**
     * 查询预约管理列表
     */
    @PreAuthorize("@ss.hasPermi('biz:reservation:list')")
    @GetMapping("/list")
    public TableDataInfo list(TqcglReservation tqcglReservation) {
        startPage();
        List<TqcglReservation> list = tqcglReservationService.selectTqcglReservationList(tqcglReservation);
        return getDataTable(list);
    }

    /**
     * 导出预约管理列表
     */
    @PreAuthorize("@ss.hasPermi('biz:reservation:export')")
    @Log(title = "预约管理", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, TqcglReservation tqcglReservation) {
        List<TqcglReservation> list = tqcglReservationService.selectTqcglReservationList(tqcglReservation);
        ExcelUtil<TqcglReservation> util = new ExcelUtil<TqcglReservation>(TqcglReservation.class);
        util.exportExcel(response, list, "预约管理数据");
    }

    /**
     * 获取预约管理详细信息
     */
    @PreAuthorize("@ss.hasPermi('biz:reservation:query')")
    @GetMapping(value = "/{reservationId}")
    public AjaxResult getInfo(@PathVariable("reservationId") Long reservationId) {
        return success(tqcglReservationService.selectTqcglReservationByReservationId(reservationId));
    }

    /**
     * 新增预约管理
     */
    @PreAuthorize("@ss.hasPermi('biz:reservation:add')")
    @Log(title = "预约管理", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody TqcglReservation tqcglReservation) {
        return toAjax(tqcglReservationService.insertTqcglReservation(tqcglReservation));
    }

    /**
     * 修改预约管理
     */
    @PreAuthorize("@ss.hasPermi('biz:reservation:edit')")
    @Log(title = "预约管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody TqcglReservation tqcglReservation) {
        String username;
        Date now = new Date();
        if (tqcglReservation.getReservationStatus() == 2) {
            username = SecurityUtils.getUsername();
            tqcglReservation.setCancelOperator(username);
            tqcglReservation.setCancelDatetime(now);
        }
        return toAjax(tqcglReservationService.updateTqcglReservation(tqcglReservation));
    }

    /**
     * 删除预约管理
     */
    @PreAuthorize("@ss.hasPermi('biz:reservation:remove')")
    @Log(title = "预约管理", businessType = BusinessType.DELETE)
    @DeleteMapping("/{reservationIds}")
    public AjaxResult remove(@PathVariable Long[] reservationIds) {
        return toAjax(tqcglReservationService.deleteTqcglReservationByReservationIds(reservationIds));
    }

    /**
     * 获取预约管理详细信息
     */
    @PreAuthorize("@ss.hasPermi('biz:reservation:query')")
    @GetMapping(value = "/2{reservationId}")
    public AjaxResult getInfo2(@PathVariable("reservationId") Long reservationId) {
        return success(tqcglReservationService.selectTqcglReservationByReservationId2(reservationId));
    }

    @PostMapping("/userinfo")
    public AjaxResult getUserInfo() {
        // 获取当前登录用户名
        String username = SecurityUtils.getUsername();
        // 加载用户信息
        SysUser user = userService.selectUserByUserName(username);
        return AjaxResult.success(user);
    }

}
