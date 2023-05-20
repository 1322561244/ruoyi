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

import com.ruoyi.biz.domain.TqcglLeader;
import com.ruoyi.biz.service.ITqcglLeaderService;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.common.utils.poi.ExcelUtil;

/**
 * 车长管理Controller
 * 
 * @author ruoyi
 * @date 2023-04-25
 */
@RestController
@RequestMapping("/biz/leader")
public class TqcglLeaderController extends BaseController {
    @Autowired
    private ITqcglLeaderService tqcglLeaderService;

    /**
     * 查询车长管理列表
     */
    @PreAuthorize("@ss.hasPermi('biz:leader:list')")
    @GetMapping("/list")
    public TableDataInfo list(TqcglLeader tqcglLeader) {
        startPage();
        List<TqcglLeader> list = tqcglLeaderService.selectTqcglLeaderList(tqcglLeader);
        return getDataTable(list);
    }

    /**
     * 导出车长管理列表
     */
    @PreAuthorize("@ss.hasPermi('biz:leader:export')")
    @Log(title = "车长管理", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, TqcglLeader tqcglLeader) {
        List<TqcglLeader> list = tqcglLeaderService.selectTqcglLeaderList(tqcglLeader);
        ExcelUtil<TqcglLeader> util = new ExcelUtil<TqcglLeader>(TqcglLeader.class);
        util.exportExcel(response, list, "车长管理数据");
    }

    /**
     * 获取车长管理详细信息
     */
    @PreAuthorize("@ss.hasPermi('biz:leader:query')")
    @GetMapping(value = "/{leaderId}")
    public AjaxResult getInfo(@PathVariable("leaderId") Long leaderId) {
        return success(tqcglLeaderService.selectTqcglLeaderByLeaderId(leaderId));
    }

    /**
     * 新增车长管理
     */
    @PreAuthorize("@ss.hasPermi('biz:leader:add')")
    @Log(title = "车长管理", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody TqcglLeader tqcglLeader) {
        String msg = tqcglLeaderService.insertTqcglLeader(tqcglLeader);
        return StringUtils.isEmpty(msg) ? success() : error(msg);
    }

    /**
     * 修改车长管理
     */
    @PreAuthorize("@ss.hasPermi('biz:leader:edit')")
    @Log(title = "车长管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody TqcglLeader tqcglLeader) {
        String msg = tqcglLeaderService.updateTqcglLeader(tqcglLeader);
        return StringUtils.isEmpty(msg) ? success() : error(msg);
    }

    /**
     * 删除车长管理
     */
    @PreAuthorize("@ss.hasPermi('biz:leader:remove')")
    @Log(title = "车长管理", businessType = BusinessType.DELETE)
    @DeleteMapping("/{leaderIds}")
    public AjaxResult remove(@PathVariable Long[] leaderIds) {
        for (Long leaderId : leaderIds) {
            if (tqcglLeaderService.checkExistUser(leaderId)) {
                return warn("当前车长信息存在于信息中,不允许删除");
            }
        }
        return toAjax(tqcglLeaderService.deleteTqcglLeaderByLeaderIds(leaderIds));
    }

    @Log(title = "车长基本信息", businessType = BusinessType.IMPORT) // todo
    @PreAuthorize("@ss.hasPermi('biz:leader:import')") // todo
    @PostMapping("/importData")
    public AjaxResult importData(MultipartFile file, boolean updateSupport) throws Exception {
        ExcelUtil<TqcglLeader> util = new ExcelUtil<>(TqcglLeader.class); // todo
        List<TqcglLeader> stuList = util.importExcel(file.getInputStream()); // todo
        String operName = getUsername();
        String message = tqcglLeaderService.importUser(stuList, updateSupport, operName); // todo
        return AjaxResult.success(message);
    }

    @PostMapping("/importTemplate")
    public void importTemplate(HttpServletResponse response) {
        ExcelUtil<TqcglLeader> util = new ExcelUtil<>(TqcglLeader.class); // todo
        util.importTemplateExcel(response, "车长基本信息");
    }

}
