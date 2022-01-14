package com.alexlin.yangocanteen.mapper;

import com.alexlin.yangocanteen.bean.Restaurant;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface RestaurantMapper {
    // 选取某一楼层所有的餐厅信息
    List<Restaurant> restaurantInfo(int floor);

}
