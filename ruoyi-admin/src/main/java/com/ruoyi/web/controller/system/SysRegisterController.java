package com.ruoyi.web.controller.system;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.ruoyi.biz.domain.TqcglLeader;
import com.ruoyi.biz.domain.TqcglPassenger;
import com.ruoyi.biz.service.ITqcglLeaderService;
import com.ruoyi.biz.service.ITqcglPassengerService;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.domain.entity.SysRole;
import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.common.core.domain.model.RegisterBody;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.framework.web.service.SysRegisterService;
import com.ruoyi.system.domain.SysUserRole;
import com.ruoyi.system.service.ISysConfigService;
import com.ruoyi.system.service.ISysRoleService;
import com.ruoyi.system.service.ISysUserService;

/**
 * 注册验证
 * 
 * @author ruoyi
 */
@RestController
public class SysRegisterController extends BaseController {
    @Autowired
    private SysRegisterService registerService;

    @Autowired
    private ISysConfigService configService;

    @Autowired
    private ISysRoleService roleService;

    @Autowired
    private ISysUserService userService;

    @Autowired
    private ITqcglPassengerService passengerService;

    @Autowired
    private ITqcglLeaderService leaderService;

    @PostMapping("/register")
    public AjaxResult register(@RequestBody RegisterBody user) {
        if (!("true".equals(configService.selectConfigByKey("sys.account.registerUser")))) {
            return error("当前系统没有开启注册功能！");
        }
        String msg = registerService.register(user);

        SysUser select_user = userService.selectUserId(user.getUsername());
        SysRole select_roleId = roleService.selectRoleId(user.getRole());
        SysUserRole userRole = new SysUserRole();
        userRole.setUserId(select_user.getUserId());
        userRole.setRoleId(select_roleId.getRoleId());
        // 角色id与用户id关联

        userService.insertUserRoleId(userRole);

        if ("leader".equals(user.getRole())) {
            TqcglLeader tqcglLeader = new TqcglLeader();
            tqcglLeader.setUserId(select_user.getUserId());
            leaderService.insertTqcglLeader(tqcglLeader);
        } else if ("passenger".equals(user.getRole())) {
            TqcglPassenger tqcglPassenger = new TqcglPassenger();
            tqcglPassenger.setUserId(select_user.getUserId());
            passengerService.insertTqcglPassenger(tqcglPassenger);
        }
        return StringUtils.isEmpty(msg) ? success() : error(msg);
    }
}
