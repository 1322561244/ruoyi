package com.ruoyi.WeChat.domain;

import com.ruoyi.common.annotation.Excel;

import java.util.Date;

public class WeChatReservation {
    /**
     * 班次ID，自增长
     */
    private Long shiftsId;

    /**
     * 班次名称
     */
    @Excel(name = "班次名称")
    private String shiftsName;

    @Excel(name = "开始时间")
    private Date startTime;

    @Excel(name = "结束")
    private Date endTime;

    @Excel(name = "用户Id")
    private Long userId;
}
