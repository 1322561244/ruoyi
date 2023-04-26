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
import com.ruoyi.biz.domain.TqcglVehicles;
import com.ruoyi.biz.service.ITqcglVehiclesService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 车辆管理Controller
 * 
 * @author ruoyi
 * @date 2023-04-25
 */
@RestController
@RequestMapping("/biz/vehicles")
public class TqcglVehiclesController extends BaseController
{
    @Autowired
    private ITqcglVehiclesService tqcglVehiclesService;

    /**
     * 查询车辆管理列表
     */
    @PreAuthorize("@ss.hasPermi('biz:vehicles:list')")
    @GetMapping("/list")
    public TableDataInfo list(TqcglVehicles tqcglVehicles)
    {
        startPage();
        List<TqcglVehicles> list = tqcglVehiclesService.selectTqcglVehiclesList(tqcglVehicles);
        return getDataTable(list);
    }

    /**
     * 导出车辆管理列表
     */
    @PreAuthorize("@ss.hasPermi('biz:vehicles:export')")
    @Log(title = "车辆管理", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, TqcglVehicles tqcglVehicles)
    {
        List<TqcglVehicles> list = tqcglVehiclesService.selectTqcglVehiclesList(tqcglVehicles);
        ExcelUtil<TqcglVehicles> util = new ExcelUtil<TqcglVehicles>(TqcglVehicles.class);
        util.exportExcel(response, list, "车辆管理数据");
    }

    /**
     * 获取车辆管理详细信息
     */
    @PreAuthorize("@ss.hasPermi('biz:vehicles:query')")
    @GetMapping(value = "/{vehiclesId}")
    public AjaxResult getInfo(@PathVariable("vehiclesId") Long vehiclesId)
    {
        return success(tqcglVehiclesService.selectTqcglVehiclesByVehiclesId(vehiclesId));
    }

    /**
     * 新增车辆管理
     */
    @PreAuthorize("@ss.hasPermi('biz:vehicles:add')")
    @Log(title = "车辆管理", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody TqcglVehicles tqcglVehicles)
    {
        return toAjax(tqcglVehiclesService.insertTqcglVehicles(tqcglVehicles));
    }

    /**
     * 修改车辆管理
     */
    @PreAuthorize("@ss.hasPermi('biz:vehicles:edit')")
    @Log(title = "车辆管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody TqcglVehicles tqcglVehicles)
    {
        return toAjax(tqcglVehiclesService.updateTqcglVehicles(tqcglVehicles));
    }

    /**
     * 删除车辆管理
     */
    @PreAuthorize("@ss.hasPermi('biz:vehicles:remove')")
    @Log(title = "车辆管理", businessType = BusinessType.DELETE)
	@DeleteMapping("/{vehiclesIds}")
    public AjaxResult remove(@PathVariable Long[] vehiclesIds)
    {
        return toAjax(tqcglVehiclesService.deleteTqcglVehiclesByVehiclesIds(vehiclesIds));
    }
}
