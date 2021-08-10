package com.alexlin.yangocanteen.mapper;

import com.alexlin.yangocanteen.bean.User;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface UserMapper {

    @Select("SELECT * FROM userinfo WHERE username = #{username} AND password = #{password}")
    User login(String username,String password);
}
