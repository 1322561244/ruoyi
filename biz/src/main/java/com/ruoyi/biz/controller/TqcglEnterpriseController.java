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
import com.ruoyi.biz.domain.TqcglEnterprise;
import com.ruoyi.biz.service.ITqcglEnterpriseService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 企业管理Controller
 * 
 * @author ruoyi
 * @date 2023-04-25
 */
@RestController
@RequestMapping("/biz/enterprise")
public class TqcglEnterpriseController extends BaseController
{
    @Autowired
    private ITqcglEnterpriseService tqcglEnterpriseService;

    /**
     * 查询企业管理列表
     */
    @PreAuthorize("@ss.hasPermi('biz:enterprise:list')")
    @GetMapping("/list")
    public TableDataInfo list(TqcglEnterprise tqcglEnterprise)
    {
        startPage();
        List<TqcglEnterprise> list = tqcglEnterpriseService.selectTqcglEnterpriseList(tqcglEnterprise);
        return getDataTable(list);
    }

    /**
     * 导出企业管理列表
     */
    @PreAuthorize("@ss.hasPermi('biz:enterprise:export')")
    @Log(title = "企业管理", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, TqcglEnterprise tqcglEnterprise)
    {
        List<TqcglEnterprise> list = tqcglEnterpriseService.selectTqcglEnterpriseList(tqcglEnterprise);
        ExcelUtil<TqcglEnterprise> util = new ExcelUtil<TqcglEnterprise>(TqcglEnterprise.class);
        util.exportExcel(response, list, "企业管理数据");
    }

    /**
     * 获取企业管理详细信息
     */
    @PreAuthorize("@ss.hasPermi('biz:enterprise:query')")
    @GetMapping(value = "/{enterpriseId}")
    public AjaxResult getInfo(@PathVariable("enterpriseId") Long enterpriseId)
    {
        return success(tqcglEnterpriseService.selectTqcglEnterpriseByEnterpriseId(enterpriseId));
    }

    /**
     * 新增企业管理
     */
    @PreAuthorize("@ss.hasPermi('biz:enterprise:add')")
    @Log(title = "企业管理", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody TqcglEnterprise tqcglEnterprise)
    {
        return toAjax(tqcglEnterpriseService.insertTqcglEnterprise(tqcglEnterprise));
    }

    /**
     * 修改企业管理
     */
    @PreAuthorize("@ss.hasPermi('biz:enterprise:edit')")
    @Log(title = "企业管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody TqcglEnterprise tqcglEnterprise)
    {
        return toAjax(tqcglEnterpriseService.updateTqcglEnterprise(tqcglEnterprise));
    }

    /**
     * 删除企业管理
     */
    @PreAuthorize("@ss.hasPermi('biz:enterprise:remove')")
    @Log(title = "企业管理", businessType = BusinessType.DELETE)
	@DeleteMapping("/{enterpriseIds}")
    public AjaxResult remove(@PathVariable Long[] enterpriseIds)
    {
        return toAjax(tqcglEnterpriseService.deleteTqcglEnterpriseByEnterpriseIds(enterpriseIds));
    }
}
