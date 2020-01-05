package com.couldr.app.web.controller.api;

import com.couldr.app.model.dto.JsonResult;
import com.couldr.app.model.entity.Category;
import com.couldr.app.model.entity.WebSite;
import com.couldr.app.service.CategoryService;
import com.couldr.app.service.WebSiteService;
import com.couldr.app.web.controller.api.base.BaseController;
import java.util.Comparator;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/api/cate")
public class ApiCategoryController  extends BaseController {

    private CategoryService categoryService;

    private WebSiteService webSiteService;

    public ApiCategoryController(CategoryService categoryService,WebSiteService webSiteService) {
        this.categoryService = categoryService;
        this.webSiteService = webSiteService;
    }

    @RequestMapping("getUserCategoryList")
    @ResponseBody
    public List<Category> getCategoryList() {
        List<Category>  categories =  categoryService.getUserCategoryList(getUserId());
        categories.sort(Comparator.comparing(Category::getOrdered));
        System.out.println(getUserId());
        return categories;
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

    @RequestMapping("{cateId}")
    @ResponseBody
    public JsonResult getCate(@PathVariable Integer cateId) {
        Category category = categoryService.fetchById(cateId).orElse(new Category());
        return new JsonResult(1,category);
    }

    @RequestMapping("/remove/{cateId}")
    @ResponseBody
    public JsonResult remove(@PathVariable Integer cateId) {
        List<WebSite> webSites = webSiteService.getUserWebSiteList(cateId);
        if (webSites != null && webSites.size() > 0){
            return new JsonResult(0,"该分类下还有未删除的资源,请删除后操作。");
        }
        categoryService.removeById(cateId);
        return new JsonResult(1,"删除成功！");
    }

    @RequestMapping("/sort/{cateId}")
    @ResponseBody
    public JsonResult sort(@PathVariable("cateId") Integer cateId, @RequestParam(name = "oldIndex") Integer oldIndex,
        @RequestParam(name = "newIndex") Integer newIndex){

        categoryService.updateSort( cateId, oldIndex, newIndex);

        Category category = categoryService.fetchById(cateId).orElse(new Category());
        category.setOrdered(newIndex);
        categoryService.update(category);

        return new JsonResult(1, "排序保存成功~");
    }


}
