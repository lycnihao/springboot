package cn.hom1.app.controller;

import cn.hom1.app.model.dto.JsonResult;
import cn.hom1.app.model.entity.Category;
import cn.hom1.app.model.entity.WebSite;
import cn.hom1.app.model.params.WebSiteQuery;
import cn.hom1.app.model.vo.WebSiteVo;
import cn.hom1.app.service.CategoryService;
import cn.hom1.app.service.WebSiteCategoryService;
import cn.hom1.app.service.WebSiteService;
import cn.hom1.app.service.RequestService;
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

    private final WebSiteCategoryService webSiteCategoryService;

    private RequestService requestService;

  public WebSiteController(WebSiteService webSiteService, CategoryService categoryService,
      WebSiteCategoryService webSiteCategoryService,RequestService requestService) {
    this.webSiteService = webSiteService;
    this.categoryService = categoryService;
    this.webSiteCategoryService = webSiteCategoryService;
    this.requestService = requestService;
  }

  @RequestMapping()
    public String webSite(ModelMap modelMap,@PageableDefault(size = 10, sort = "websiteId", direction = Sort.Direction.DESC) Pageable pageable,
                          WebSiteQuery webSiteQuery) {
      Page<WebSite> webSitePage = webSiteService.pageBy(webSiteQuery,pageable);
      Map<Integer, List<Category>> listMap = webSiteService.convertToListMapByWebSite(webSitePage);
      // freemarker只支持key为字符串的Map对象
      Map<String, List<Category>> websiteCateMap = new HashMap<>(listMap.size());
      for (Integer key : listMap.keySet()){
        websiteCateMap.put(key.toString(),listMap.get(key));
      }

      StringBuilder sb = new StringBuilder();
      if (!StringUtils.isEmpty(webSiteQuery.getKeyword())){
        sb.append("&keyword=").append(webSiteQuery.getKeyword());
      }
      if (!StringUtils.isEmpty(webSiteQuery.getCategoryId())){
        sb.append("&categoryId=").append(webSiteQuery.getCategoryId());
      }
      modelMap.addAttribute("url", sb.toString());
      modelMap.addAttribute("website", webSitePage);
      modelMap.addAttribute("websiteCate", websiteCateMap);

        return "webSite";
    }

    @RequestMapping("updateData")
    @ResponseBody
    public WebSiteVo getWebSite(Integer websiteId) {
        WebSite webSite = webSiteService.getById(websiteId);
        List<Category> categories = categoryService.findByWebsiteId(websiteId);
        return new WebSiteVo(webSite,categories);
    }

    @RequestMapping("save")
    @ResponseBody
    public JsonResult add(@ModelAttribute WebSite webSite,
                          @RequestParam(value = "categoryIds[]" ,required = false) Set<Integer> categoryIds) {

    webSiteService.save(webSite,categoryIds);

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
