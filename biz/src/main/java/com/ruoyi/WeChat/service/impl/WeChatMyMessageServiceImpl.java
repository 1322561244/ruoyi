package com.ruoyi.WeChat.service.impl;

import com.ruoyi.WeChat.domain.WeChatMyMessage;
import com.ruoyi.WeChat.mapper.WeChatMyMessageMapper;
import com.ruoyi.WeChat.service.IWeChatMyMessageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class WeChatMyMessageServiceImpl implements IWeChatMyMessageService {
    @Autowired
    WeChatMyMessageMapper weChatMyMessageMapper;

    /**
     * 在我的信息页 插入乘客的信息
     */
    public String insertPassengerMessage(WeChatMyMessage weChatMyMessage){
        return weChatMyMessageMapper.insertPassengerMessage(weChatMyMessage);
    }

    /**
     * 在我的信息页 索引出所有部门信息
     */
    public List<WeChatMyMessage> selectDeptList(){
        return weChatMyMessageMapper.selectDeptList();
    }

    /**
     * 在我的信息页 通过用户id索引处乘客表tqcgl_passenger中是否存在内容
     */
    public WeChatMyMessage selectMessageByUserId(Long userId){
        return weChatMyMessageMapper.selectMessageByUserId(userId);
    }

    /**
     * 在我的信息页 如果二次插入消息更新表的数据
     */
    public void UpdatePassengerMessage(WeChatMyMessage weChatMyMessage){
        weChatMyMessageMapper.UpdatePassengerMessage(weChatMyMessage);
    }

    /**
     * 在我的信息页 用户二次登录时获取到他的所有信息
     */
    public WeChatMyMessage selectMessage(Long userId){
        return weChatMyMessageMapper.selectMessage(userId);
    }

}
