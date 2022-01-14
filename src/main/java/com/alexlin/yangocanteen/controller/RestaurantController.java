package com.alexlin.yangocanteen.controller;

import com.alexlin.yangocanteen.bean.Restaurant;
import com.alexlin.yangocanteen.result.BaseResult;
import com.alexlin.yangocanteen.service.RestaurantService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("restaurant")
public class RestaurantController {
    @Autowired
    private RestaurantService restaurantService;

    @PostMapping("/get")
    public BaseResult restaurantInfo(@RequestParam(value = "floor", defaultValue = "") int floor) {
        if (floor < 2 || floor > 7) return new BaseResult(400, "楼层不存在", "");

        List<Restaurant> restaurantInfo = restaurantService.restaurantInfo(floor);

        return new BaseResult(200, "请求成功！", restaurantInfo);
    }
}
