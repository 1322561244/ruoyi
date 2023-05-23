package com.ruoyi.biz.service.impl;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.Validator;

import com.ruoyi.biz.domain.TqcglDrivers;
import com.ruoyi.biz.mapper.TqcglDriversMapper;
import com.ruoyi.biz.service.ITqcglDriversService;
import com.ruoyi.common.exception.ServiceException;
import com.ruoyi.common.utils.StringUtils;

/**
 * 司机管理Service业务层处理
 * 
 * @author ruoyi
 * @date 2023-04-25
 */
@Service
public class TqcglDriversServiceImpl implements ITqcglDriversService {
    @Autowired
    private TqcglDriversMapper tqcglDriversMapper;

    /**
     * 查询司机管理
     * 
     * @param driversId 司机管理主键
     * @return 司机管理
     */
    @Override
    public TqcglDrivers selectTqcglDriversByDriversId(Long driversId) {
        return tqcglDriversMapper.selectTqcglDriversByDriversId(driversId);
    }

    /**
     * 查询司机管理列表
     * 
     * @param tqcglDrivers 司机管理
     * @return 司机管理
     */
    @Override
    public List<TqcglDrivers> selectTqcglDriversList(TqcglDrivers tqcglDrivers) {
        return tqcglDriversMapper.selectTqcglDriversList(tqcglDrivers);
    }

    /**
     * 新增司机管理
     * 
     * @param tqcglDrivers 司机管理
     * @return 结果
     */
    @Override
    public String insertTqcglDrivers(TqcglDrivers tqcglDrivers) {
        String msg = "";
        Long driversId = StringUtils.isNull(tqcglDrivers.getDriversId()) ? -1L : tqcglDrivers.getDriversId();
        TqcglDrivers info = tqcglDriversMapper.checkNameUnique(tqcglDrivers.getDriversName());
        if (StringUtils.isNotNull(info) && info.getDriversId().longValue() != driversId.longValue()) {
            msg = "保存用户'" + tqcglDrivers.getDriversName() + "'失败，添加的司机信息已存在";
        } else {
            tqcglDriversMapper.insertTqcglDrivers(tqcglDrivers);
        }
        return msg;
    }

    /**
     * 修改司机管理
     * 
     * @param tqcglDrivers 司机管理
     * @return 结果
     */
    @Override
    public String updateTqcglDrivers(TqcglDrivers tqcglDrivers) {
        String msg = "";
        Long driversId = StringUtils.isNull(tqcglDrivers.getDriversId()) ? -1L : tqcglDrivers.getDriversId();
        TqcglDrivers info = tqcglDriversMapper.checkNameUnique(tqcglDrivers.getDriversName());
        if (StringUtils.isNotNull(info) && info.getDriversId().longValue() != driversId.longValue()) {
            msg = "修改失败，已存在该司机信息";
        } else {
            tqcglDriversMapper.updateTqcglDrivers(tqcglDrivers);
        }
        return msg;
    }

    /**
     * 批量删除司机管理
     * 
     * @param driversIds 需要删除的司机管理主键
     * @return 结果
     */
    @Override
    public int deleteTqcglDriversByDriversIds(Long[] driversIds) {
        return tqcglDriversMapper.deleteTqcglDriversByDriversIds(driversIds);
    }

    /**
     * 删除司机管理信息
     * 
     * @param driversId 司机管理主键
     * @return 结果
     */
    @Override
    public int deleteTqcglDriversByDriversId(Long driversId) {
        return tqcglDriversMapper.deleteTqcglDriversByDriversId(driversId);
    }

    @Override
    public boolean checkExistUser(Long Id) {
        int result = tqcglDriversMapper.checkExistUser(Id);
        return result > 0;
    }

    /**
     * 导入用户数据
     * 
     * @param userList        用户数据列表
     * @param isUpdateSupport 是否更新支持，如果已存在，则进行更新数据
     * @param operName        操作用户
     * @return 结果
     */
    @Autowired
    protected Validator validator;

    private static final Logger log = LoggerFactory.getLogger(TqcglDriversServiceImpl.class);

    @Override
    public String importUser(List<TqcglDrivers> userList, Boolean isUpdateSupport, String operName) {
        if (StringUtils.isNull(userList) || userList.size() == 0) {
            throw new ServiceException("导入用户数据不能为空！");
        }
        int successNum = 0;
        int failureNum = 0;
        StringBuilder successMsg = new StringBuilder();
        StringBuilder failureMsg = new StringBuilder();
        for (TqcglDrivers user : userList) {
            try {
                // 验证是否存在这个用户
                TqcglDrivers u = tqcglDriversMapper.checkNameUnique(user.getDriversName());
                if (StringUtils.isNull(u)) {
                    user.setCreateBy(operName);
                    this.insertTqcglDrivers(user);
                    successNum++;
                    // successMsg.append("<br/>" + successNum + "、司机 " + user.getDriversName() + "
                    // 导入成功");
                } else if (isUpdateSupport) {
                    user.setUpdateBy(operName);
                    this.updateTqcglDrivers(user);
                    successNum++;
                    // successMsg.append("<br/>" + successNum + "、司机 " + user.getDriversName() + "
                    // 更新成功");
                } else {
                    failureNum++;
                    failureMsg.append("<br/>" + failureNum + "、司机 " + user.getDriversName() + " 已存在");
                }
            } catch (Exception e) {
                failureNum++;
                String msg = "<br/>" + failureNum + "、司机 " + user.getDriversName() + " 导入失败：";
                failureMsg.append(msg + e.getMessage());
                log.error(msg, e);
            }
        }
        if (failureNum > 0) {
            failureMsg.insert(0, "共 " + successNum + " 条数据导入成功，共 " + failureNum + " 条数据导入失败，错误如下：");
            throw new ServiceException(failureMsg.toString());
        } else {
            successMsg.insert(0, "恭喜您，数据已全部导入成功！共 " + successNum + " 条。");
        }
        return successMsg.toString();
    }

}
