package io.jht.modules.api.controller;


import org.springframework.web.bind.annotation.*;

import io.jht.common.utils.R;
import io.jht.modules.api.annotation.AuthIgnore;
import io.jht.modules.api.annotation.LoginUser;
import io.jht.modules.api.entity.TokenEntity;
import io.jht.modules.api.entity.UserEntity;

/**
 * API测试接口
 *
 * @author zhang.xin
 * @email zhangxin2198@gmail.com
 * @date 2018-10-21 15:47
 */
@RestController
@RequestMapping("/api")
public class ApiTestController {

    /**
     * 获取用户信息
     */
    @GetMapping("userInfo")
    public R userInfo(@LoginUser UserEntity user){
        return R.ok().put("user", user);
    }

    /**
     * 忽略Token验证测试
     */
    @AuthIgnore
    @GetMapping("notToken")
    public R notToken(){
        return R.ok().put("msg", "无需token也能访问。。。");
    }

    /**
     * 接收JSON数据
     */
    @PostMapping("jsonData")
    public R jsonData(@LoginUser UserEntity user, @RequestBody TokenEntity token){
        return R.ok().put("user", user).put("token", token);
    }
}
