package com.alexlin.yangocanteen.interceptor;


import com.alexlin.yangocanteen.controller.UserController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;

public class LoginInterceptor implements HandlerInterceptor {
    @Autowired
    UserController userController;

}
