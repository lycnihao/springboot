package cn.hom1.app.controller;

import cn.hom1.app.model.entity.Links;
import cn.hom1.app.service.LinksService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/admin/links")
public class LinksController {

    @Autowired
    private LinksService linksService;

    @RequestMapping()
    public String links(ModelMap modelMap){
        List<Links> linkList = linksService.findAll();
        modelMap.addAttribute("links",linkList);
        return "links";
    }

}
