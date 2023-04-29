package com.ruoyi.biz.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ruoyi.biz.domain.TqcglLeader;
import com.ruoyi.biz.mapper.TqcglLeaderMapper;
import com.ruoyi.biz.service.ITqcglLeaderService;
import com.ruoyi.common.utils.StringUtils;

/**
 * 车长管理Service业务层处理
 * 
 * @author ruoyi
 * @date 2023-04-25
 */
@Service
public class TqcglLeaderServiceImpl implements ITqcglLeaderService {
    @Autowired
    private TqcglLeaderMapper tqcglLeaderMapper;

    /**
     * 查询车长管理
     * 
     * @param leaderId 车长管理主键
     * @return 车长管理
     */
    @Override
    public TqcglLeader selectTqcglLeaderByLeaderId(Long leaderId) {
        return tqcglLeaderMapper.selectTqcglLeaderByLeaderId(leaderId);
    }

    /**
     * 查询车长管理列表
     * 
     * @param tqcglLeader 车长管理
     * @return 车长管理
     */
    @Override
    public List<TqcglLeader> selectTqcglLeaderList(TqcglLeader tqcglLeader) {
        return tqcglLeaderMapper.selectTqcglLeaderList(tqcglLeader);
    }

    /**
     * 新增车长管理
     * 
     * @param tqcglLeader 车长管理
     * @return 结果
     */
    @Override
    public String insertTqcglLeader(TqcglLeader tqcglLeader) {
        String msg = "";
        Long tqcglLeaderId = StringUtils.isNull(tqcglLeader.getLeaderId()) ? -1L
                : tqcglLeader.getLeaderId();
        TqcglLeader info = tqcglLeaderMapper.checkNameUnique(tqcglLeader.getLeaderName());
        if (StringUtils.isNotNull(info) && info.getLeaderId().longValue() != tqcglLeaderId.longValue()) {
            msg = "保存用户'" + tqcglLeader.getLeaderName() + "'失败，添加的车长信息已存在";
        } else {
            tqcglLeaderMapper.insertTqcglLeader(tqcglLeader);
        }
        return msg;
    }

    /**
     * 修改车长管理
     * 
     * @param tqcglLeader 车长管理
     * @return 结果
     */
    @Override
    public String updateTqcglLeader(TqcglLeader tqcglLeader) {
        String msg = "";
        Long tqcglLeaderId = StringUtils.isNull(tqcglLeader.getLeaderId()) ? -1L
                : tqcglLeader.getLeaderId();
        TqcglLeader info = tqcglLeaderMapper.checkNameUnique(tqcglLeader.getLeaderName());
        if (StringUtils.isNotNull(info) && info.getLeaderId().longValue() != tqcglLeaderId.longValue()) {
            msg = "修改信息失败，修改的车长信息已存在";
        } else {
            tqcglLeaderMapper.updateTqcglLeader(tqcglLeader);
        }
        return msg;
    }

    /**
     * 批量删除车长管理
     * 
     * @param leaderIds 需要删除的车长管理主键
     * @return 结果
     */
    @Override
    public int deleteTqcglLeaderByLeaderIds(Long[] leaderIds) {
        return tqcglLeaderMapper.deleteTqcglLeaderByLeaderIds(leaderIds);
    }

    /**
     * 删除车长管理信息
     * 
     * @param leaderId 车长管理主键
     * @return 结果
     */
    @Override
    public int deleteTqcglLeaderByLeaderId(Long leaderId) {
        return tqcglLeaderMapper.deleteTqcglLeaderByLeaderId(leaderId);
    }
}
