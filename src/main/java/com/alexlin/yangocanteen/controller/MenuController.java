package com.alexlin.yangocanteen.controller;

import com.alexlin.yangocanteen.bean.Menu;
import com.alexlin.yangocanteen.result.BaseResult;
import com.alexlin.yangocanteen.service.MenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("menu")
public class MenuController {
    @Autowired
    private MenuService menuService;

    // 添加菜品
    @PostMapping("/insert")
    public BaseResult insertMenu(Menu menu) {

        if (menu.getName() == null || menu.getRestaurant() == null || menu.getCategory() == null) {
            return new BaseResult(400, "参数必须填写！", "");
        }

        if (menuService.findMenuByName(menu.getName()) != null) {
            return new BaseResult(500, "该菜品已存在", "");
        }

        if (menuService.insertMenu(menu) == 0) {
            return new BaseResult(500, "插入失败", "");
        }

        return new BaseResult(200, "", "添加成功！");

    }

    @PostMapping("/getMenuName")
    public BaseResult findNameByRestaurantName(@RequestParam(value = "restaurant", defaultValue = "")
                                                       String restaurant) {
        if (restaurant.equals("")) {
            return new BaseResult(400, "参数必须传递", "");
        }

        List<String> menuName = menuService.findNameByRestaurantName(restaurant);

        if (menuName == null) {
            return new BaseResult(500, "查询错误", "");
        } else {
            return new BaseResult(200, "请求成功", menuName);
        }
    }

    @PostMapping("/getMenuPrice")
    public BaseResult findPriceByRestaurantName(@RequestParam(value = "restaurant", defaultValue = "")
                                                        String restaurant) {
        if (restaurant.equals("")) {
            return new BaseResult(400, "参数必须传递", "");
        }

        List<Double> menuPrice = menuService.findPriceByRestaurantName(restaurant);

        if (menuPrice == null) {
            return new BaseResult(500, "查询错误", "");
        } else {
            return new BaseResult(200, "查询成功", menuPrice);
        }
    }

    @PostMapping("/getMenuCategory")
    public BaseResult findCategoryByRestaurantName(@RequestParam(value = "restaurant", defaultValue = "")
                                                           String restaurant) {
        if (restaurant.equals("")) {
            return new BaseResult(400, "参数必须传递", "");
        }

        List<String> menuCategory = menuService.findCategoryByRestaurantName(restaurant);

        if (menuCategory == null) {
            return new BaseResult(500, "查询错误", "");
        } else {
            return new BaseResult(200, "查询成功", menuCategory);
        }
    }
}
