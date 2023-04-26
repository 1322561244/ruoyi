package com.ruoyi.biz.service.impl;

import java.util.List;

import com.ruoyi.biz.domain.TqcglEnterprise;
import com.ruoyi.biz.domain.TqcglLeader2;
import com.ruoyi.biz.domain.TqcglLeader_Enterprise;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.biz.mapper.TqcglLeaderMapper;
import com.ruoyi.biz.domain.TqcglLeader;
import com.ruoyi.biz.service.ITqcglLeaderService;

/**
 * 车长管理Service业务层处理
 * 
 * @author ruoyi
 * @date 2023-04-25
 */
@Service
public class TqcglLeaderServiceImpl implements ITqcglLeaderService 
{
    @Autowired
    private TqcglLeaderMapper tqcglLeaderMapper;

    /**
     * 查询车长管理
     * 
     * @param leaderId 车长管理主键
     * @return 车长管理
     */
    @Override
    public TqcglLeader selectTqcglLeaderByLeaderId(Long leaderId)
    {
        return tqcglLeaderMapper.selectTqcglLeaderByLeaderId(leaderId);
    }

    /**
     * 查询车长管理列表
     * 
     * @param tqcglLeader 车长管理
     * @return 车长管理
     */
    @Override
    public List<TqcglLeader> selectTqcglLeaderList(TqcglLeader tqcglLeader)
    {
        return tqcglLeaderMapper.selectTqcglLeaderList(tqcglLeader);
    }


    public List<TqcglLeader_Enterprise> selectTqcglEnterpriseList(){
        return tqcglLeaderMapper.selectTqcglEnterpriseList();
    }
    /**
     * 查询车长管理列表--通过外键查询
     * @return 车长管理
     */
    public List<TqcglLeader2> selectTqcglLeaderList2(TqcglLeader tqcglLeader){
        return tqcglLeaderMapper.selectTqcglLeaderList2(tqcglLeader);
    }


    /**
     * 新增车长管理
     * 
     * @param tqcglLeader 车长管理
     * @return 结果
     */
    @Override
    public int insertTqcglLeader(TqcglLeader tqcglLeader)
    {
        return tqcglLeaderMapper.insertTqcglLeader(tqcglLeader);
    }

    /**
     * 修改车长管理
     * 
     * @param tqcglLeader 车长管理
     * @return 结果
     */
    @Override
    public int updateTqcglLeader(TqcglLeader tqcglLeader)
    {
        return tqcglLeaderMapper.updateTqcglLeader(tqcglLeader);
    }

    /**
     * 批量删除车长管理
     * 
     * @param leaderIds 需要删除的车长管理主键
     * @return 结果
     */
    @Override
    public int deleteTqcglLeaderByLeaderIds(Long[] leaderIds)
    {
        return tqcglLeaderMapper.deleteTqcglLeaderByLeaderIds(leaderIds);
    }

    /**
     * 删除车长管理信息
     * 
     * @param leaderId 车长管理主键
     * @return 结果
     */
    @Override
    public int deleteTqcglLeaderByLeaderId(Long leaderId)
    {
        return tqcglLeaderMapper.deleteTqcglLeaderByLeaderId(leaderId);
    }
}
