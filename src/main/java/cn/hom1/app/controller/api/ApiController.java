package cn.hom1.app.controller.api;

import cn.hom1.app.model.entity.Links;
import cn.hom1.app.service.LinksService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
<<<<<<< HEAD:src/main/java/cn/hom1/app/controller/api/ApiController.java
public class ApiController {
=======
@RequestMapping("api")
public class IndexController {
>>>>>>> 200733f5bd5a0b3e5c97bf56a7551f1fb6aa10d9:src/main/java/cn/hom1/app/controller/IndexController.java

    @Autowired
    private LinksService linksService;

    @RequestMapping("getList")
    public List<Links> getList() {
        return linksService.list();
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
