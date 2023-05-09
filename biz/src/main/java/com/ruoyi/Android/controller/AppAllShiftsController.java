package com.ruoyi.Android.controller;

import com.ruoyi.biz.domain.TqcglShifts;
import com.ruoyi.biz.service.ITqcglShiftsService;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.poi.ExcelUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * 车长App班次管理Controller
 * 获取所有班次的列表
 * 这里直接调用后台那里的Service接口了
 * @author zhu
 * @date 2023-05-08
 */
@RestController
@RequestMapping("/app/shifts")
public class AppAllShiftsController extends BaseController  {
    @Autowired
    private ITqcglShiftsService tqcglShiftsService;

    /**
     * 查询班次管理列表
     */
    @PreAuthorize("@ss.hasPermi('app:shifts:list')")
    @GetMapping("/list")
    public TableDataInfo list(TqcglShifts tqcglShifts)
    {
        startPage();
        List<TqcglShifts> list = tqcglShiftsService.selectTqcglShiftsList(tqcglShifts);
        return getDataTable(list);
    }

    /**
     * 导出班次管理列表
     */
    @PreAuthorize("@ss.hasPermi('app:shifts:export')")
    @Log(title = "班次管理", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, TqcglShifts tqcglShifts)
    {
        List<TqcglShifts> list = tqcglShiftsService.selectTqcglShiftsList(tqcglShifts);
        ExcelUtil<TqcglShifts> util = new ExcelUtil<TqcglShifts>(TqcglShifts.class);
        util.exportExcel(response, list, "班次管理数据");
    }

    /**
     * 获取班次管理详细信息
     */
    @PreAuthorize("@ss.hasPermi('app:shifts:query')")
    @GetMapping(value = "/{shiftsId}")
    public AjaxResult getInfo(@PathVariable("shiftsId") Long shiftsId)
    {
        return success(tqcglShiftsService.selectTqcglShiftsByShiftsId(shiftsId));
    }

    /**
     * 新增班次管理
     */
    @PreAuthorize("@ss.hasPermi('app:shifts:add')")
    @Log(title = "班次管理", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody TqcglShifts tqcglShifts)
    {
        return toAjax(tqcglShiftsService.insertTqcglShifts(tqcglShifts));
    }

    /**
     * 修改班次管理
     */
    @PreAuthorize("@ss.hasPermi('app:shifts:edit')")
    @Log(title = "班次管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody TqcglShifts tqcglShifts)
    {
        return toAjax(tqcglShiftsService.updateTqcglShifts(tqcglShifts));
    }

    /**
     * 删除班次管理
     */
    @PreAuthorize("@ss.hasPermi('app:shifts:remove')")
    @Log(title = "班次管理", businessType = BusinessType.DELETE)
    @DeleteMapping("/{shiftsIds}")
    public AjaxResult remove(@PathVariable Long[] shiftsIds)
    {
        return toAjax(tqcglShiftsService.deleteTqcglShiftsByShiftsIds(shiftsIds));
    }


    /**
     * 获取班次管理详细信息
     */
    @GetMapping(value = "/2{shiftsId}")
    public AjaxResult getInfo2(@PathVariable("shiftsId") Long shiftsId)
    {
        return success(tqcglShiftsService.selectTqcglShiftsByShiftsId2(shiftsId));
    }
}
