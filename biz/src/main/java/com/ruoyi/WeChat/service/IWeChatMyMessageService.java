package com.ruoyi.WeChat.service;

import com.ruoyi.WeChat.domain.WeChatMyMessage;

import java.util.List;

public interface IWeChatMyMessageService {

    /**
     * 在我的信息页 用户二次登录时获取到他的所有信息
     */
    public WeChatMyMessage selectMessage(Long userId);

    /**
     * 在我的信息页 插入乘客的信息
     */
    public String insertPassengerMessage(WeChatMyMessage weChatMyMessage);


    /**
     * 在我的信息页 索引出所有部门信息
     */
    public List<WeChatMyMessage> selectDeptList();


    /**
     * 在我的信息页 通过用户id索引处乘客表tqcgl_passenger中是否存在内容
     */
    public WeChatMyMessage selectMessageByUserId(Long userId);

    /**
     * 在我的信息页 如果二次插入消息更新表的数据
     */
    public void UpdatePassengerMessage(WeChatMyMessage weChatMyMessage);
}
