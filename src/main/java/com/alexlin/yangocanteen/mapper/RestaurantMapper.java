package com.alexlin.yangocanteen.mapper;

import com.alexlin.yangocanteen.bean.Restaurant;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface RestaurantMapper {
    // 选取某一楼层所有的餐厅信息
    @Select("SELECT * FROM restaurant WHERE floor = #{floor}")
    List<Restaurant> restaurantInfo(int floor);

}
