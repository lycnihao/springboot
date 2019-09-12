package cn.hom1.app.controller.api;

import cn.hom1.app.model.entity.Category;
import cn.hom1.app.model.entity.WebSite;
import cn.hom1.app.model.vo.CategoryWebSiteVo;
import cn.hom1.app.model.vo.WebSiteVo;
import cn.hom1.app.service.CategoryService;
import cn.hom1.app.service.WebSiteCategoryService;
import cn.hom1.app.service.WebSiteService;
import cn.hom1.app.service.RequestService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("api")
public class ApiController {

    private WebSiteService webSiteService;

    private CategoryService categoryService;

    private RequestService requestService;

    public ApiController(WebSiteService webSiteService, CategoryService categoryService,
                  RequestService requestService) {
        this.webSiteService = webSiteService;
        this.categoryService = categoryService;
        this.requestService = requestService;
    }

    @RequestMapping("getList")
    @Cacheable(value="webSite",key="'webSite'")
    public CategoryWebSiteVo getList() {
        List<Category> categories = categoryService.listAll();
        Map<Integer, List<WebSite>> webSites = webSiteService.convertToListMap(categories);
        return new CategoryWebSiteVo(categories,webSites);
    }


    @RequestMapping("getTouch")
    public List<WebSite> getTouch(){
        return webSiteService.findTouch();
    }


    @RequestMapping("getRecommend")
    public List<WebSite> getRecommend(){
        return webSiteService.findRecommend();
    }

    @RequestMapping("getHotList")
    public Object[] getHotList(){
        return requestService.getHotList();
    }

}
