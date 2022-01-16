package com.alexlin.yangocanteen.mapper;

import com.alexlin.yangocanteen.bean.User;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface UserMapper {

    // 用户登录
    User login(String username, String password);

    //判断用户是否注册过
    User findUserByName(String username);

    // 注册
    int register(User bean);

    // 以用户名来删除用户
    int deleteUser(String username);
}
