package com.alexlin.yangocanteen.mapper;

import com.alexlin.yangocanteen.bean.Menu;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface MenuMapper {

    // 添加菜品
    int insertMenu(Menu menu);

    // 以名字来找菜品
    Menu findMenuByName(@Param("name") String name);

    // 以餐厅的名字来找菜名
    List<String> findNameByRestaurantName(String restaurant);

    // 以餐厅的名字来找菜的价格
    List<Double> findPriceByRestaurantName(String restaurant);

    // 以餐厅的名字来找菜的分类
    List<String> findCategoryByRestaurantName(String restaurant);

}
