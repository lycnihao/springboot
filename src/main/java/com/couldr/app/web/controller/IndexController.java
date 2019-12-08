package com.couldr.app.web.controller;

import com.couldr.app.model.entity.WebSite;
import com.couldr.app.service.WebSiteService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IndexController {

    private WebSiteService webSiteService;


    @RequestMapping("routing/{linkId}")
    public String webSite(@PathVariable Integer linkId) {
        WebSite webSite = webSiteService.findByWebSiteId(linkId);
        if (webSite != null){
            webSiteService.updateVisitsByLinkId(linkId);
            return "redirect:" + webSite.getUrl();
        }
        return "index";
    }
}
