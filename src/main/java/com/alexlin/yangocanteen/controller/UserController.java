package com.alexlin.yangocanteen.controller;

import com.alexlin.yangocanteen.base.BaseResult;
import com.alexlin.yangocanteen.bean.User;
import com.alexlin.yangocanteen.mapper.UserMapper;
import com.google.gson.Gson;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("user")
public class UserController {
    @Autowired
    private UserMapper mapper;

    @PostMapping("/login")
    public BaseResult login(@RequestParam(value = "username", defaultValue = "") String username,
                            @RequestParam(value = "password", defaultValue = "") String password) {
        if (username.equals("")) return new BaseResult(400, "账号必须传递！", "");
        if (password.equals("")) return new BaseResult(400, "密码必须传递！", "");
        User user = mapper.login(username, password);
        if (user == null) {
            return new BaseResult(500, "账号或密码不正确", "");
        } else {
            return new BaseResult(200, "登录成功", user);
        }
    }
}
