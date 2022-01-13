package com.alexlin.yangocanteen.mapper;

import com.alexlin.yangocanteen.bean.Category;
import com.alexlin.yangocanteen.bean.Menu;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface CategoryMapper {
    // 查询所有分类
    List<Category> findAll();

    // 从菜单中查找分类
    List<Menu> findCategoryFromMenu(@Param("category") String category);
}
