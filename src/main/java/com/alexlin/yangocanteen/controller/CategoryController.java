package com.alexlin.yangocanteen.controller;

import com.alexlin.yangocanteen.bean.Menu;
import com.alexlin.yangocanteen.result.BaseResult;
import com.alexlin.yangocanteen.bean.Category;
import com.alexlin.yangocanteen.mapper.CategoryMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("category")
public class CategoryController {
    @Autowired
    private CategoryMapper mapper;

    @GetMapping("/get")
    public BaseResult findAll() {
        List<Category> categories = mapper.findAll();
        if (categories == null) {
            return new BaseResult(500, "未查询到数据", "");
        } else {
            return new BaseResult(200, "成功", categories);
        }
    }

    @PostMapping("/getmenu")
    public BaseResult findByMenu(@RequestParam(value = "category", defaultValue = "") String category) {

        if (category.equals("")) return new BaseResult(400, "参数不能为空", "");
        List<Menu> all = mapper.findCategoryFromMenu(category);

        return new BaseResult(200, "查询成功", all);

    }

}
