package cn.hom1.app.controller;

import cn.hom1.app.model.dto.JsonResult;
import cn.hom1.app.model.entity.Category;
import cn.hom1.app.service.CategoryService;
import java.util.Optional;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping(value = "/admin/category")
public class CategoryController {

    @Autowired
    private CategoryService categoryService;

    /**
     * 查询所有分类并渲染category页面
     *
     * @return 模板路径admin/admin_category
     */
    @GetMapping
    public String categories() {
        return "category";
    }

    /**
     * 新增/修改分类目录
     *
     * @param category category对象
     * @return JsonResult
     */
    @PostMapping(value = "/save")
    @ResponseBody
    public JsonResult saveCategory(@Valid Category category, BindingResult result) {
        if (result.hasErrors()) {
            for (ObjectError error : result.getAllErrors()) {
                return new JsonResult(0, error.getDefaultMessage());
            }
        }
        final Category tempCategory = categoryService.findBySlugName(category.getSlugName());
        if (null != category.getCategoryId()) {
            if (null != tempCategory && !category.getCategoryId().equals(tempCategory.getCategoryId())) {
                return new JsonResult(0, "该路径已经存在！");
            }
        } else {
            if (null != tempCategory) {
                return new JsonResult(0, "该路径已经存在！");
            }
        }
        category = categoryService.create(category);
        if (null == category) {
            return new JsonResult(0, "保存失败！");
        }
        return new JsonResult(1, "保存成功！");
    }

    /**
     * 跳转到修改页面
     *
     * @param cateId cateId
     * @param model  model
     * @return 模板路径category
     */
    @GetMapping(value = "/edit")
    public String toEditCategory(Model model, @RequestParam("cateId") Long cateId) {
        final Optional<Category> category = categoryService.fetchById(cateId);
        model.addAttribute("updateCategory", category.orElse(new Category()));
        return "category";
    }


    /**
     * 处理删除分类目录的请求
     *
     * @param cateId cateId
     * @return 重定向到/admin/category
     */
    @GetMapping(value = "/remove")
    public String removeCategory(@RequestParam("cateId") Long cateId) {
        try {
            categoryService.removeById(cateId);
        } catch (Exception e) {
            System.out.println("Delete category failed: {}"+ e.getMessage());
        }
        return "redirect:/admin/category";
    }

}
