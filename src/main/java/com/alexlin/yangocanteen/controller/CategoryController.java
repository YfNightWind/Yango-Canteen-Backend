package com.alexlin.yangocanteen.controller;

import com.alexlin.yangocanteen.bean.Menu;
import com.alexlin.yangocanteen.result.BaseResult;
import com.alexlin.yangocanteen.bean.Category;
import com.alexlin.yangocanteen.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("category")
public class CategoryController {
    @Autowired
    private CategoryService categoryService;

    // 获取所有分类
    @GetMapping("/get")
    @ResponseBody
    public BaseResult findAll() {
        List<Category> categories = categoryService.findAll();
        if (categories == null) {
            return new BaseResult(500, "未查询到数据", "");
        } else {
            return new BaseResult(200, "成功", categories);
        }
    }

    // 获取某个分类下的菜单
    @PostMapping("/getmenu")
    @ResponseBody
    public BaseResult findByMenu(@RequestParam(value = "category", defaultValue = "") String category) {

        if (category.equals("")) return new BaseResult(400, "参数不能为空", "");
        List<Menu> all = categoryService.findCategoryFromMenu(category);

        return new BaseResult(200, "查询成功", all);

    }

}
