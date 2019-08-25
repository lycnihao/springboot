package cn.hom1.app.controller;

import cn.hom1.app.model.dto.JsonResult;
import cn.hom1.app.model.entity.Category;
import cn.hom1.app.model.entity.Links;
import cn.hom1.app.service.CategoryService;
import cn.hom1.app.service.LinksService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

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
    public Links getLinks(Integer linkId) {
        return linksService.findByLinksId(linkId);
    }

    @RequestMapping("save")
    @ResponseBody
    public JsonResult add(Links link) {
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
