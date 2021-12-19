package com.alexlin.yangocanteen.mapper;

import com.alexlin.yangocanteen.bean.Menu;
import com.alexlin.yangocanteen.bean.User;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface MenuMapper {
    @Insert("INSERT INTO menu(name,restaurant,category,price) VALUES (#{name},#{restaurant},#{category},#{price})")
    int insertFood(Menu menu);

    @Select("SELECT name FROM menu WHERE name = #{name}")
    User findMenuByName(String name);
}
