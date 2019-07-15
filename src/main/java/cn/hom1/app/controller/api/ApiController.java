package cn.hom1.app.controller.api;

import cn.hom1.app.model.entity.Links;
import cn.hom1.app.service.LinksService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RequestMapping("api")
public class ApiController {

    @Autowired
    private LinksService linksService;

    @RequestMapping("getList")
    public List<Links> getList() {
        return linksService.findSite();
    }


    @RequestMapping("getTouch")
    public List<Links> getTouch(){
        return linksService.findTouch();
    }

    @RequestMapping("getRecommend")
    public List<Links> getRecommend(){
        return linksService.findTouch();
    }
}
