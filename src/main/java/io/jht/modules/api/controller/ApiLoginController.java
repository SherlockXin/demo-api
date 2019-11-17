package io.jht.modules.api.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import io.jht.common.utils.R;
import io.jht.common.validator.Assert;
import io.jht.modules.api.annotation.AuthIgnore;
import io.jht.modules.api.service.TokenService;
import io.jht.modules.api.service.UserService;

import java.util.Map;

/**
 * API登录授权
 *
 * @author zhang.xin
 * @email zhangxin2198@gmail.com
 * @date 2018-10-21 15:31
 */
@RestController
@RequestMapping("/api")
public class ApiLoginController {
    @Autowired
    private UserService userService;
    @Autowired
    private TokenService tokenService;

    /**
     * 登录
     */
    @AuthIgnore
    @PostMapping("login")
    public R login(String mobile, String password){
        Assert.isBlank(mobile, "手机号不能为空");
        Assert.isBlank(password, "密码不能为空");

        //用户登录
        long userId = userService.login(mobile, password);

        //生成token
        Map<String, Object> map = tokenService.createToken(userId);

        return R.ok(map);
    }

}
