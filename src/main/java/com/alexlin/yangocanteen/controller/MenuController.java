package com.alexlin.yangocanteen.controller;

import com.alexlin.yangocanteen.bean.Menu;
import com.alexlin.yangocanteen.mapper.MenuMapper;
import com.alexlin.yangocanteen.result.BaseResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("menu")
public class MenuController {
    @Autowired
    private MenuMapper mapper;

    @PostMapping("/insert")
    public BaseResult insertMenu(Menu menu) {

        if (menu.getName() == null || menu.getRestaurant() == null ||menu.getCategory() == null) {
            return new BaseResult(400, "参数必须填写！", "");
        }

        if (mapper.findMenuByName(menu.getName()) != null) {
            return new BaseResult(500, "该菜品已存在", "");
        }

        if (mapper.insertFood(menu) == 0) {
            return new BaseResult(500, "插入失败", "");
        }

        return new BaseResult(200, "", "添加成功！");

    }
}
