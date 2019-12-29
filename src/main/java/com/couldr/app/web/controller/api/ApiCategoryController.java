package com.couldr.app.web.controller.api;

import com.couldr.app.model.entity.Category;
import com.couldr.app.service.CategoryService;
import com.couldr.app.web.controller.api.base.BaseController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/api/cate")
public class ApiCategoryController  extends BaseController {

    private CategoryService categoryService;

    public ApiCategoryController(CategoryService categoryService) {
        this.categoryService = categoryService;
    }

    @RequestMapping("getUserCategoryList")
    @ResponseBody
    public List<Category> getCategoryList() {
        System.out.println(getUser());
        List<Category> categories =  categoryService.getUserCategoryList(getUserId());
        return categories;
    }

}
