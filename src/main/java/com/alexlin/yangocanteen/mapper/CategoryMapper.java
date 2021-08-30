package com.alexlin.yangocanteen.mapper;

import com.alexlin.yangocanteen.bean.Category;
import com.alexlin.yangocanteen.bean.Menu;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface CategoryMapper {
    // 查询所有分类
    @Select("SELECT NAME 'category' FROM category;")
    List<Category> findAll();

    // 从菜单中查找分类
    @Select("SELECT * FROM menu WHERE category = #{category}")
    List<Menu> findCategoryFromMenu (String category);
}
