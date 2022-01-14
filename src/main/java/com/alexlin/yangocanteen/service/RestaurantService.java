package com.alexlin.yangocanteen.service;

import com.alexlin.yangocanteen.bean.Restaurant;
import com.alexlin.yangocanteen.mapper.RestaurantMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RestaurantService {
    @Autowired
    private RestaurantMapper restaurantMapper;

    public List<Restaurant> restaurantInfo(int floor) {
        return restaurantMapper.restaurantInfo(floor);
    }
}
