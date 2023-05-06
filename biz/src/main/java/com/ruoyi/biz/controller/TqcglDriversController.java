package com.ruoyi.biz.controller;

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

import com.ruoyi.biz.domain.TqcglDrivers;
import com.ruoyi.biz.service.ITqcglDriversService;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.common.utils.poi.ExcelUtil;

/**
 * 司机管理Controller
 * 
 * @author ruoyi
 * @date 2023-04-25
 */
@RestController
@RequestMapping("/biz/drivers")
public class TqcglDriversController extends BaseController {
    @Autowired
    private ITqcglDriversService tqcglDriversService;

    /**
     * 查询司机管理列表
     */
    @PreAuthorize("@ss.hasPermi('biz:drivers:list')")
    @GetMapping("/list")
    public TableDataInfo list(TqcglDrivers tqcglDrivers) {
        startPage();
        List<TqcglDrivers> list = tqcglDriversService.selectTqcglDriversList(tqcglDrivers);
        return getDataTable(list);
    }

    /**
     * 导出司机管理列表
     */
    @PreAuthorize("@ss.hasPermi('biz:drivers:export')")
    @Log(title = "司机管理", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, TqcglDrivers tqcglDrivers) {
        List<TqcglDrivers> list = tqcglDriversService.selectTqcglDriversList(tqcglDrivers);
        ExcelUtil<TqcglDrivers> util = new ExcelUtil<TqcglDrivers>(TqcglDrivers.class);
        util.exportExcel(response, list, "司机管理数据");
    }

    /**
     * 获取司机管理详细信息
     */
    @PreAuthorize("@ss.hasPermi('biz:drivers:query')")
    @GetMapping(value = "/{driversId}")
    public AjaxResult getInfo(@PathVariable("driversId") Long driversId) {
        return success(tqcglDriversService.selectTqcglDriversByDriversId(driversId));
    }

    /**
     * 新增司机管理
     */
    @PreAuthorize("@ss.hasPermi('biz:drivers:add')")
    @Log(title = "司机管理", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody TqcglDrivers tqcglDrivers) {
        String msg = tqcglDriversService.insertTqcglDrivers(tqcglDrivers);
        return StringUtils.isEmpty(msg) ? success() : error(msg);
    }

    /**
     * 修改司机管理
     */
    @PreAuthorize("@ss.hasPermi('biz:drivers:edit')")
    @Log(title = "司机管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody TqcglDrivers tqcglDrivers) {
        String msg = tqcglDriversService.updateTqcglDrivers(tqcglDrivers);
        return StringUtils.isEmpty(msg) ? success() : error(msg);
    }

    /**
     * 删除司机管理
     */
    @PreAuthorize("@ss.hasPermi('biz:drivers:remove')")
    @Log(title = "司机管理", businessType = BusinessType.DELETE)
    @DeleteMapping("/{driversIds}")
    public AjaxResult remove(@PathVariable Long[] driversIds) {
        for (Long driversId : driversIds) {
            if (tqcglDriversService.checkExistUser(driversId)) {
                return warn("当前司机信息存在于信息中,不允许删除");
            }
        }
        return toAjax(tqcglDriversService.deleteTqcglDriversByDriversIds(driversIds));
    }
}
