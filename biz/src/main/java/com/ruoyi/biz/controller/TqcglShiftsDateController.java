package com.ruoyi.biz.controller;

import java.util.List;
import javax.servlet.http.HttpServletResponse;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.biz.domain.TqcglShiftsDate;
import com.ruoyi.biz.service.ITqcglShiftsDateService;
import com.ruoyi.common.utils.poi.ExcelUtil;

/**
 * 班次日期管理Controller
 * 
 * @author zhu
 * @date 2023-05-07
 */
@RestController
@RequestMapping("/biz/date")
public class TqcglShiftsDateController extends BaseController
{
    @Autowired
    private ITqcglShiftsDateService tqcglShiftsDateService;

    /**
     * 查询班次日期管理列表
     */
    @PreAuthorize("@ss.hasPermi('biz:date:list')")
    @GetMapping("/list")
    public AjaxResult list(TqcglShiftsDate tqcglShiftsDate)
    {
        List<TqcglShiftsDate> list = tqcglShiftsDateService.selectTqcglShiftsDateList(tqcglShiftsDate);
        return success(list);
    }

    /**
     * 导出班次日期管理列表
     */
    @PreAuthorize("@ss.hasPermi('biz:date:export')")
    @Log(title = "班次日期管理", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, TqcglShiftsDate tqcglShiftsDate)
    {
        List<TqcglShiftsDate> list = tqcglShiftsDateService.selectTqcglShiftsDateList(tqcglShiftsDate);
        ExcelUtil<TqcglShiftsDate> util = new ExcelUtil<TqcglShiftsDate>(TqcglShiftsDate.class);
        util.exportExcel(response, list, "班次日期管理数据");
    }

    /**
     * 获取班次日期管理详细信息
     */
    @PreAuthorize("@ss.hasPermi('biz:date:query')")
    @GetMapping(value = "/{dateId}")
    public AjaxResult getInfo(@PathVariable("dateId") Long dateId)
    {
        return success(tqcglShiftsDateService.selectTqcglShiftsDateByDateId(dateId));
    }

    /**
     * 新增班次日期管理
     */
    @PreAuthorize("@ss.hasPermi('biz:date:add')")
    @Log(title = "班次日期管理", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody TqcglShiftsDate tqcglShiftsDate)
    {
        return toAjax(tqcglShiftsDateService.insertTqcglShiftsDate(tqcglShiftsDate));
    }

    /**
     * 修改班次日期管理
     */
    @PreAuthorize("@ss.hasPermi('biz:date:edit')")
    @Log(title = "班次日期管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody TqcglShiftsDate tqcglShiftsDate)
    {
        return toAjax(tqcglShiftsDateService.updateTqcglShiftsDate(tqcglShiftsDate));
    }

    /**
     * 删除班次日期管理
     */
    @PreAuthorize("@ss.hasPermi('biz:date:remove')")
    @Log(title = "班次日期管理", businessType = BusinessType.DELETE)
	@DeleteMapping("/{dateIds}")
    public AjaxResult remove(@PathVariable Long[] dateIds)
    {
        return toAjax(tqcglShiftsDateService.deleteTqcglShiftsDateByDateIds(dateIds));
    }
}
