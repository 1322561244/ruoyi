package com.ruoyi.biz.service;

import java.util.List;

import com.ruoyi.biz.domain.TqcglEnterprise;
import com.ruoyi.biz.domain.TqcglLeader;
import com.ruoyi.biz.domain.TqcglLeader2;
import com.ruoyi.biz.domain.TqcglLeader_Enterprise;

/**
 * 车长管理Service接口
 * 
 * @author ruoyi
 * @date 2023-04-25
 */
public interface ITqcglLeaderService 
{
    /**
     * 查询车长管理
     * 
     * @param leaderId 车长管理主键
     * @return 车长管理
     */
    public TqcglLeader selectTqcglLeaderByLeaderId(Long leaderId);

    /**
     * 查询车长管理列表
     * 
     * @param tqcglLeader 车长管理
     * @return 车长管理集合
     */
    public List<TqcglLeader> selectTqcglLeaderList(TqcglLeader tqcglLeader);

    /**
     * 查询车长管理列表
     *
     * @param tqcglLeader 车长管理通过外键查询
     * @return 车长管理集合
     */
    public List<TqcglLeader2> selectTqcglLeaderList2(TqcglLeader tqcglLeader);


    /**
     * 在新增框中查询所有的企业名实现下拉列表
     *
     */
    public List<TqcglLeader_Enterprise> selectTqcglEnterpriseList();
    /**
     * 新增车长管理
     * 
     * @param tqcglLeader 车长管理
     * @return 结果
     */
    public int insertTqcglLeader(TqcglLeader tqcglLeader);

    /**
     * 修改车长管理
     * 
     * @param tqcglLeader 车长管理
     * @return 结果
     */
    public int updateTqcglLeader(TqcglLeader tqcglLeader);

    /**
     * 批量删除车长管理
     * 
     * @param leaderIds 需要删除的车长管理主键集合
     * @return 结果
     */
    public int deleteTqcglLeaderByLeaderIds(Long[] leaderIds);

    /**
     * 删除车长管理信息
     * 
     * @param leaderId 车长管理主键
     * @return 结果
     */
    public int deleteTqcglLeaderByLeaderId(Long leaderId);
}
