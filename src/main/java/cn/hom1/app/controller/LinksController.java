package cn.hom1.app.controller;

import cn.hom1.app.model.dto.JsonResult;
import cn.hom1.app.model.entity.Category;
import cn.hom1.app.model.entity.Links;
import cn.hom1.app.service.CategoryService;
import cn.hom1.app.service.LinksService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.util.*;

@Controller
@RequestMapping("/admin/links")
public class LinksController {

    @Autowired
    private LinksService linksService;

    @Autowired
    private CategoryService categoryService;

    @RequestMapping()
    public String links(ModelMap modelMap) {
        List<Links> linkList = linksService.findList();
        List<Category> categories = categoryService.findList();
        modelMap.addAttribute("links", linkList);
        modelMap.addAttribute("categories", categories);
        return "links";
    }

    @RequestMapping("updateData")
    @ResponseBody
    public Links getLinks(Long linkId) {
        return linksService.getById(linkId);
    }

    @RequestMapping("save")
    @ResponseBody
    public JsonResult add(@ModelAttribute Links link,
                          @RequestParam("cateList") List<String> cateList) {
        List<Category> categories = new ArrayList<>();
        for (String str : cateList){
            categories.add(categoryService.getById(Long.parseLong(str)));
        }
        link.setCategories(categories);
        linksService.save(link);
        return new JsonResult(200,"");
    }

    @RequestMapping("delete/{linkId}")
    @ResponseBody
    public JsonResult delete(@PathVariable Integer linkId) {
        linksService.delete(linkId);
        return new JsonResult(200,"");
    }
}
