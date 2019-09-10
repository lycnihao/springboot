package cn.hom1.app.controller.api;

import cn.hom1.app.model.entity.Category;
import cn.hom1.app.model.entity.WebSite;
import cn.hom1.app.service.CategoryService;
import cn.hom1.app.service.WebSiteService;
import cn.hom1.app.service.RequestService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("api")
public class ApiController {

    @Autowired
    private WebSiteService webSiteService;

    @Autowired
    private CategoryService categoryService;

    @Autowired
    private RequestService requestService;

    @RequestMapping("getList")
    public List<Map<String,Object>> getList() {
        List<Map<String,Object>> list = new ArrayList<>();
        for (Category category:categoryService.listAll()) {
            Map<String,Object> map = new HashMap<>(6);
            map.put("categoryId",category.getCategoryId());
            map.put("name",category.getName());
            map.put("slugName",category.getSlugName());
            map.put("icon",category.getIcon());
            map.put("description",category.getDescription());
            list.add(map);
        }
        return list;
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
