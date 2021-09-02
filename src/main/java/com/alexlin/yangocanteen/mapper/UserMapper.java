package com.alexlin.yangocanteen.mapper;

import com.alexlin.yangocanteen.bean.User;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface UserMapper {

    @Select("SELECT * FROM userinfo WHERE username = #{username} AND password = #{password}")
    User login(String username, String password);

    //判断用户是否注册过
    @Select("SELECT username FROM userinfo WHERE username = #{username}")
    User findUserByName(String username);

    @Insert("INSERT INTO userinfo(username,password,identity) VALUES (#{username},#{password},#{identify})")
    int register(User bean);

    @Delete("DELETE FROM userinfo WHERE username = #{username}")
    int deleteUser(String username);
}
