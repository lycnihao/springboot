package cn.hom1.app.controller.api;

import cn.hom1.app.model.entity.Links;
import cn.hom1.app.model.enums.SiteTypeEnum;
import cn.hom1.app.service.LinksService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("api")
public class ApiController {

    @Autowired
    private LinksService linksService;

    @RequestMapping("getList")
    public List<Links> getList() {
        return linksService.findByType(SiteTypeEnum.WEBSITE);
    }


    @RequestMapping("getTouch")
    public List<Links> getTouch(){
        return linksService.findByType(SiteTypeEnum.TOUCH);
    }


    @RequestMapping("getRecommend")
    public List<Links> getRecommend(){
        return linksService.findByType(SiteTypeEnum.RECOMMEND);
    }
}
