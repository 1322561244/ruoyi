package com.ruoyi.biz.service;

import java.util.List;

import com.ruoyi.biz.domain.TqcglLeader;

/**
 * 车长管理Service接口
 * 
 * @author ruoyi
 * @date 2023-04-25
 */
public interface ITqcglLeaderService {
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
     * 新增车长管理
     * 
     * @param tqcglLeader 车长管理
     * @return 结果
     */
    public String insertTqcglLeader(TqcglLeader tqcglLeader);

    /**
     * 修改车长管理
     * 
     * @param tqcglLeader 车长管理
     * @return 结果
     */
    public String updateTqcglLeader(TqcglLeader tqcglLeader);

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

    /**
     * 查询车长是否存在其他表
     * 
     * @param Id ID
     * @return 结果 true 存在 false 不存在
     */
    public boolean checkExistUser(Long Id);

    /**
     * 导入用户数据
     *
     * @param stuList         用户数据列表
     * @param isUpdateSupport 是否更新支持，如果已存在，则进行更新数据
     * @param operName        操作用户
     * @return 结果
     */
    public String importUser(List<TqcglLeader> stuList, Boolean isUpdateSupport, String operName);

}
