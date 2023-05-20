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
import org.springframework.web.multipart.MultipartFile;

import com.ruoyi.biz.domain.TqcglPassenger;
import com.ruoyi.biz.service.ITqcglPassengerService;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.poi.ExcelUtil;

/**
 * 乘客管理Controller
 * 
 * @author zhu
 * @date 2023-05-01
 */
@RestController
@RequestMapping("/biz/passenger")
public class TqcglPassengerController extends BaseController {
    @Autowired
    private ITqcglPassengerService tqcglPassengerService;

    /**
     * 查询乘客管理列表
     */
    @PreAuthorize("@ss.hasPermi('biz:passenger:list')")
    @GetMapping("/list")
    public TableDataInfo list(TqcglPassenger tqcglPassenger) {
        startPage();
        List<TqcglPassenger> list = tqcglPassengerService.selectTqcglPassengerList(tqcglPassenger);
        return getDataTable(list);
    }

    /**
     * 导出乘客管理列表
     */
    @PreAuthorize("@ss.hasPermi('biz:passenger:export')")
    @Log(title = "乘客管理", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, TqcglPassenger tqcglPassenger) {
        List<TqcglPassenger> list = tqcglPassengerService.selectTqcglPassengerList(tqcglPassenger);
        ExcelUtil<TqcglPassenger> util = new ExcelUtil<TqcglPassenger>(TqcglPassenger.class);
        util.exportExcel(response, list, "乘客管理数据");
    }

    /**
     * 获取乘客管理详细信息
     */
    @PreAuthorize("@ss.hasPermi('biz:passenger:query')")
    @GetMapping(value = "/{passengerId}")
    public AjaxResult getInfo(@PathVariable("passengerId") Long passengerId) {
        return success(tqcglPassengerService.selectTqcglPassengerByPassengerId(passengerId));
    }

    /**
     * 新增乘客管理
     */
    @PreAuthorize("@ss.hasPermi('biz:passenger:add')")
    @Log(title = "乘客管理", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody TqcglPassenger tqcglPassenger) {
        return toAjax(tqcglPassengerService.insertTqcglPassenger(tqcglPassenger));
    }

    /**
     * 修改乘客管理
     */
    @PreAuthorize("@ss.hasPermi('biz:passenger:edit')")
    @Log(title = "乘客管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody TqcglPassenger tqcglPassenger) {
        return toAjax(tqcglPassengerService.updateTqcglPassenger(tqcglPassenger));
    }

    /**
     * 删除乘客管理
     */
    @PreAuthorize("@ss.hasPermi('biz:passenger:remove')")
    @Log(title = "乘客管理", businessType = BusinessType.DELETE)
    @DeleteMapping("/{passengerIds}")
    public AjaxResult remove(@PathVariable Long[] passengerIds) {
        for (Long passengerId : passengerIds) {
            if (tqcglPassengerService.checkExistUser(passengerId)) {
                return warn("当前乘客信息存在于信息中,不允许删除");
            }
        }
        return toAjax(tqcglPassengerService.deleteTqcglPassengerByPassengerIds(passengerIds));
    }

    /**
     * 获取乘客管理详细信息
     */
    @PreAuthorize("@ss.hasPermi('biz:passenger:query')")
    @GetMapping(value = "/2{passengerId}")
    public AjaxResult getInfo2(@PathVariable("passengerId") Long passengerId) {
        return success(tqcglPassengerService.selectTqcglPassengerByPassengerId2(passengerId));
    }

    @Log(title = "乘客基本信息", businessType = BusinessType.IMPORT) // todo
    @PreAuthorize("@ss.hasPermi('biz:passenger:import')") // todo
    @PostMapping("/importData")
    public AjaxResult importData(MultipartFile file, boolean updateSupport) throws Exception {
        ExcelUtil<TqcglPassenger> util = new ExcelUtil<>(TqcglPassenger.class); // todo
        List<TqcglPassenger> stuList = util.importExcel(file.getInputStream()); // todo
        String operName = getUsername();
        String message = tqcglPassengerService.importUser(stuList, updateSupport, operName); // todo
        return AjaxResult.success(message);
    }

    @PostMapping("/importTemplate")
    public void importTemplate(HttpServletResponse response) {
        ExcelUtil<TqcglPassenger> util = new ExcelUtil<>(TqcglPassenger.class); // todo
        util.importTemplateExcel(response, "乘客基本信息");
    }

}
