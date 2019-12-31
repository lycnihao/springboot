package com.couldr.app.web.controller.api;

import com.couldr.app.model.dto.JsonResult;
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
        return categoryService.getUserCategoryList(getUserId());
    }

    @RequestMapping("create")
    @ResponseBody
    public JsonResult create(Category category) {
        category.setUserId(getUserId());
        category.setCateType(1);
        category.setParentId(0);
        category.setSlugName(category.getName());
        categoryService.create(category);
        return new JsonResult(1,"创建成功！");
    }

}
