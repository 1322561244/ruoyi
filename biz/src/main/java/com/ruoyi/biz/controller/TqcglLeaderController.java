package com.ruoyi.biz.controller;

import java.util.List;
import javax.servlet.http.HttpServletResponse;

import com.ruoyi.biz.domain.TqcglEnterprise;
import com.ruoyi.biz.domain.TqcglLeader2;
import com.ruoyi.biz.domain.TqcglLeader_Enterprise;
import com.ruoyi.biz.service.ITqcglEnterpriseService;
import com.ruoyi.common.core.domain.entity.SysDept;
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
import com.ruoyi.biz.domain.TqcglLeader;
import com.ruoyi.biz.service.ITqcglLeaderService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 车长管理Controller
 * 
 * @author ruoyi
 * @date 2023-04-25
 */
@RestController
@RequestMapping("/biz/leader")
public class TqcglLeaderController extends BaseController
{
    @Autowired
    private ITqcglLeaderService tqcglLeaderService;

    private ITqcglEnterpriseService tqcglEnterpriseService;

    /**
     * 查询车长管理列表
     */
    @PreAuthorize("@ss.hasPermi('biz:leader:list')")
    @GetMapping("/list")
    public TableDataInfo list(TqcglLeader tqcglLeader)
    {
        startPage();
        List<TqcglLeader2> list = tqcglLeaderService.selectTqcglLeaderList2(tqcglLeader);
        return getDataTable(list);
    }

    /**
     * 导出车长管理列表
     */
    @PreAuthorize("@ss.hasPermi('biz:leader:export')")
    @Log(title = "车长管理", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, TqcglLeader tqcglLeader)
    {
        List<TqcglLeader> list = tqcglLeaderService.selectTqcglLeaderList(tqcglLeader);
        ExcelUtil<TqcglLeader> util = new ExcelUtil<TqcglLeader>(TqcglLeader.class);
        util.exportExcel(response, list, "车长管理数据");
    }

    /**
     * 获取车长管理详细信息
     */
    @PreAuthorize("@ss.hasPermi('biz:leader:query')")
    @GetMapping(value = "/{leaderId}")
    public AjaxResult getInfo(@PathVariable("leaderId") Long leaderId)
    {
        return success(tqcglLeaderService.selectTqcglLeaderByLeaderId(leaderId));
    }

    /**
     * 新增车长管理
     */
    @PreAuthorize("@ss.hasPermi('biz:leader:add')")
    @Log(title = "车长管理", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody TqcglLeader tqcglLeader)
    {
        return toAjax(tqcglLeaderService.insertTqcglLeader(tqcglLeader));
    }

    /**
     * 修改车长管理
     */
    @PreAuthorize("@ss.hasPermi('biz:leader:edit')")
    @Log(title = "车长管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody TqcglLeader tqcglLeader)
    {
        return toAjax(tqcglLeaderService.updateTqcglLeader(tqcglLeader));
    }

    /**
     * 删除车长管理
     */
    @PreAuthorize("@ss.hasPermi('biz:leader:remove')")
    @Log(title = "车长管理", businessType = BusinessType.DELETE)
    @DeleteMapping("/{leaderIds}")
    public AjaxResult remove(@PathVariable Long[] leaderIds)
    {
        return toAjax(tqcglLeaderService.deleteTqcglLeaderByLeaderIds(leaderIds));
    }

    /**
    * 返回新增框的企业下拉列表
    * */
    @GetMapping("/enterpriseList")
    public List<TqcglLeader_Enterprise> getEnterpriseList(){

        List<TqcglLeader_Enterprise> list = tqcglLeaderService.selectTqcglEnterpriseList();
        System.out.println(list);
        System.out.println("11111111");
        return list;
    }
}
