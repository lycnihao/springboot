package cn.hom1.app.controller;

import cn.hom1.app.model.entity.Links;
import cn.hom1.app.service.LinkService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IndexController {

    @Autowired
    private LinkService linksService;

    @RequestMapping("routing/{linkId}")
    public String links(@PathVariable Integer linkId) {
        Links link = linksService.findByLinksId(linkId);
        if (link != null){
            linksService.updateVisitsByLinkId(linkId);
            return "redirect:" + link.getUrl();
        }
        return "index";
    }
}
