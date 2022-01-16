package com.alexlin.yangocanteen.controller;

import com.alexlin.yangocanteen.result.BaseResult;
import com.alexlin.yangocanteen.bean.User;
import com.alexlin.yangocanteen.service.UserService;
import com.alexlin.yangocanteen.util.JwtUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("user")
public class UserController {
    @Autowired
    private UserService userService;

    @PostMapping("/login")
    public BaseResult login(@RequestParam(value = "username", defaultValue = "") String username,
                            @RequestParam(value = "password", defaultValue = "") String password) {
        if (username.equals("")) return new BaseResult(400, "账号必须传递！", "");
        if (password.equals("")) return new BaseResult(400, "密码必须传递！", "");
        User user = userService.login(username, password);
        if (user == null) {
            return new BaseResult(200, "账号或密码不正确", "");
        } else {
            user.setToken(JwtUtil.createToken(user));
            return new BaseResult(200, "登录成功", user);
        }
    }

    @PostMapping("/register")
    public BaseResult register(User user) {
        if (user == null || user.getUsername() == null || user.getPassword() == null)
            return new BaseResult(400, "参数错误", "");

        if (userService.findUserByName(user.getUsername()) != null)
            return new BaseResult(500, "用户已存在！", "");

        if (userService.register(user) == 0)
            return new BaseResult(500, "注册失败", "");

        return new BaseResult(200, "", "注册成功！");
    }

    @PostMapping("/token")
    public boolean tokenVerify(@RequestParam(value = "username") String username,
                               @RequestParam(value = "token") String token) {
        return JwtUtil.checkToken(username, token);
    }

    @DeleteMapping("/delete")
    public BaseResult deleteUser(@RequestParam(value = "username", defaultValue = "") String username) {
        if (username == null) return new BaseResult(400, "用户名必须传", "");

        if (userService.deleteUser(username) == 0) {
            return new BaseResult(400, "删除失败！", "");
        } else {
            return new BaseResult(200, "", "删除成功！");
        }
    }

}
