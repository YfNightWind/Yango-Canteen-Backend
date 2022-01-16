package com.alexlin.yangocanteen.service;

import com.alexlin.yangocanteen.bean.User;
import com.alexlin.yangocanteen.mapper.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserService {
    @Autowired
    private UserMapper userMapper;

    public User login(String username, String password) {
        return userMapper.login(username, password);
    }

    public User findUserByName(String username) {
        return userMapper.findUserByName(username);
    }

    public int register(User bean) {
        return userMapper.register(bean);
    }

    public int deleteUser(String username) {
        return userMapper.deleteUser(username);
    }
}
