package cn.hom1.app.controller;

import cn.hom1.app.model.dto.JsonResult;
import cn.hom1.app.model.entity.Category;
import cn.hom1.app.model.entity.Links;
import cn.hom1.app.service.CategoryService;
import cn.hom1.app.service.LinkService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;

import java.util.*;

@Controller
@RequestMapping("/admin/links")
public class LinkController {

    @Autowired
    private LinkService linkService;

    @Autowired
    private CategoryService categoryService;

    @RequestMapping()
    public String links(ModelMap modelMap,@PageableDefault(size = 10, sort = "linkId", direction = Sort.Direction.DESC) Pageable pageable) {
        Page<Links> linkList = linkService.listAll(pageable);
        List<Category> categories = categoryService.findList();
        modelMap.addAttribute("links", linkList);
        modelMap.addAttribute("categories", categories);
        return "links";
    }

    @RequestMapping("updateData")
    @ResponseBody
    public Links getLink(Long linkId) {
        return linkService.getById(linkId);
    }

    @RequestMapping("save")
    @ResponseBody
    public JsonResult add(@ModelAttribute Links link,
                          @RequestParam("cateIds") String cateIds) {
        System.out.println(cateIds);
        String[] cateList = cateIds.split(",");
        List<Category> categories = new ArrayList<>();
        for (String str : cateList){
            if (!StringUtils.isEmpty(str))
                categories.add(categoryService.getById(Long.parseLong(str)));
        }
        link.setCategories(categories);
        linkService.save(link);
        return new JsonResult(200,"");
    }

    @RequestMapping("delete/{linkId}")
    @ResponseBody
    public JsonResult delete(@PathVariable Integer linkId) {
        linkService.delete(linkId);
        return new JsonResult(200,"");
    }
}
