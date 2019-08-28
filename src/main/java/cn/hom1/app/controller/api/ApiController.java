package cn.hom1.app.controller.api;

import cn.hom1.app.model.entity.Category;
import cn.hom1.app.model.entity.Links;
import cn.hom1.app.service.CategoryService;
import cn.hom1.app.service.LinksService;
import cn.hom1.app.service.RequestService;
import cn.hom1.app.utils.RequestUtil;
import java.io.IOException;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
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

    @Autowired
    private LinksService linksService;

    @Autowired
    private CategoryService categoryService;

    @Autowired
    private RequestService requestService;

    @RequestMapping("getList")
    public List<Map<String,Object>> getList() {
        List<Map<String,Object>> list = new ArrayList<>();
        for (Category category:categoryService.listAll()) {
            Map<String,Object> map = new HashMap<>();
            map.put("categoryId",category.getCategoryId());
            map.put("name",category.getName());
            map.put("slugName",category.getSlugName());
            map.put("description",category.getDescription());
            map.put("list",category.getLinks());
            list.add(map);
        }
        return list;
    }


    @RequestMapping("getTouch")
    public List<Links> getTouch(){
        return linksService.findTouch();
    }


    @RequestMapping("getRecommend")
    public List<Links> getRecommend(){
        return linksService.findRecommend();
    }

    @RequestMapping("getHotList")
    public Object[] getHotList(){
        return requestService.getHotList();
    }

}
