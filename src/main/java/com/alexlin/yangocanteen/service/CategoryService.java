package com.alexlin.yangocanteen.service;

import com.alexlin.yangocanteen.bean.Category;
import com.alexlin.yangocanteen.bean.Menu;
import com.alexlin.yangocanteen.mapper.CategoryMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class CategoryService {
    @Autowired
    private CategoryMapper categoryMapper;

    public List<Category> findAll() {
        return categoryMapper.findAll();
    }

    public List<Menu> findCategoryFromMenu (String category) {
        return categoryMapper.findCategoryFromMenu(category);
    }
}
