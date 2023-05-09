package com.ruoyi.WeChat.controller;

import com.ruoyi.WeChat.domain.WeChatMyMessage;
import com.ruoyi.WeChat.domain.WeChatReservation;
import com.ruoyi.WeChat.service.IWeChatMyMessageService;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.common.utils.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.List;


@RestController
@RequestMapping("/WeChat/myMessage")//我的信息页面
public class WeChatMyMessageController extends BaseController {

    @Autowired
    IWeChatMyMessageService weChatMyMessageService;
    /**
     * 如果是第二次登录这个页面需要先获取到这个账号的“我的信息”
     */
    @GetMapping("/UserMessage")
    public AjaxResult UserMessage() {
        startPage();
        Long userId=SecurityUtils.getUserId();
        return success(weChatMyMessageService.selectMessage(userId));
    }

    /**
     * 需要先获取所有部门列表
     */
    @GetMapping("/DeptList")
    public TableDataInfo DeptList( ) {
        startPage();
        List<WeChatMyMessage> list = weChatMyMessageService.selectDeptList();
        return getDataTable(list);
    }

    /**
     * 新增乘客信息
     */
    @PreAuthorize("@ss.hasPermi('WeChat:myMessage:addMessage')")
    @Log(title = "乘客", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult AddMessage(@RequestBody WeChatMyMessage weChatMyMessage) {

        /**
         * 这里要加一个判断，判断当前的用户对应的乘客信息是否为空，
         * 如果不为空的话说明不是第一次点击出发这个事件，说明乘客是想修改他的部门数据
         */
        Long userId= SecurityUtils.getUserId();
        WeChatMyMessage weChatMyMessage1=weChatMyMessageService.selectMessageByUserId(userId);

        weChatMyMessage.setUserId(userId);
        if(weChatMyMessage1.getDeptId()!=null){
            weChatMyMessageService.UpdatePassengerMessage(weChatMyMessage);
        }

        String msg = weChatMyMessageService.insertPassengerMessage(weChatMyMessage);
        return StringUtils.isEmpty(msg) ? success() : error(msg);
    }
}
