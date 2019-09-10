package cn.hom1.app.controller;

import cn.hom1.app.model.dto.JsonResult;
import cn.hom1.app.model.entity.Category;
import cn.hom1.app.model.entity.WebSite;
import cn.hom1.app.model.vo.WebSiteListVo;
import cn.hom1.app.service.CategoryService;
import cn.hom1.app.service.WebSiteService;
import cn.hom1.app.service.RequestService;
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
@RequestMapping("/admin/website")
public class WebSiteController {

    private final WebSiteService webSiteService;

    private final CategoryService categoryService;

    private RequestService requestService;

  public WebSiteController(WebSiteService webSiteService,
      CategoryService categoryService) {
    this.webSiteService = webSiteService;
    this.categoryService = categoryService;
  }

  @RequestMapping()
    public String webSite(ModelMap modelMap,@PageableDefault(size = 10, sort = "websiteId", direction = Sort.Direction.DESC) Pageable pageable) {
      /*if (!StringUtils.isEmpty(category)){
        Category cate = new Category();
        cate.setCategoryId(category);
        List<Category> categories = new ArrayList<>();
        categories.add(cate);
        webSites.setCategories(categories);
      }*/
      Page<WebSite> webSitePage = webSiteService.listAll(pageable);
      webSiteService.convertToListVo(webSitePage);
      List<Category> categories = categoryService.findList();
      modelMap.addAttribute("website", "");
      modelMap.addAttribute("categories", categories);
        return "webSite";
    }

    @RequestMapping("updateData")
    @ResponseBody
    public WebSite getWebSite(Long websiteId) {
        return webSiteService.getById(websiteId);
    }

    @RequestMapping("save")
    @ResponseBody
    public JsonResult add(@ModelAttribute WebSite webSite,
                          @RequestParam("cateIds") String cateIds) {
        System.out.println(cateIds);
        String[] cateList = cateIds.split(",");
        List<Category> categories = new ArrayList<>();
        for (String str : cateList){
            if (!StringUtils.isEmpty(str))
                categories.add(categoryService.getById(Integer.valueOf(str)));
        }
        /*webSite.setCategories(categories);*/
        webSiteService.save(webSite);
        return new JsonResult(200,"");
    }

    @RequestMapping("delete/{webSiteId}")
    @ResponseBody
    public JsonResult delete(@PathVariable Integer webSiteId) {
        webSiteService.delete(webSiteId);
        return new JsonResult(200,"");
    }

  @RequestMapping("get-title")
  @ResponseBody
  public JsonResult getTitle(String url) {
    String title = requestService.getTitle(url);
    return new JsonResult(1,title);
  }
}
