package com.alexlin.yangocanteen.service;

import com.alexlin.yangocanteen.bean.Menu;
import com.alexlin.yangocanteen.mapper.MenuMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MenuService {
    @Autowired
    private MenuMapper menuMapper;

    public int insertMenu(Menu menu) {
        return menuMapper.insertMenu(menu);
    }

    public Menu findMenuByName(String name) {
        return menuMapper.findMenuByName(name);
    }

    public List<String> findNameByRestaurantName(String restaurant) {
        return menuMapper.findNameByRestaurantName(restaurant);
    }

    public List<Double> findPriceByRestaurantName(String restaurant) {
        return menuMapper.findPriceByRestaurantName(restaurant);
    }

    public List<String> findCategoryByRestaurantName(String restaurant) {
        return menuMapper.findCategoryByRestaurantName(restaurant);
    }
}
