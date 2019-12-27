package com.couldr.app.web.controller.api;

import com.couldr.app.model.dto.JsonResult;
import com.couldr.app.model.dto.WebContent;
import com.couldr.app.service.WebSiteService;
import com.couldr.app.service.RequestService;
import com.couldr.app.web.controller.api.base.BaseController;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("api")
public class ApiDataController extends BaseController {

    private WebSiteService webSiteService;

    private RequestService requestService;

    public ApiDataController(WebSiteService webSiteService,
                  RequestService requestService) {
        this.webSiteService = webSiteService;
        this.requestService = requestService;
    }


    @RequestMapping("getHotList")
    public Object[] getHotList(){
        return requestService.getHotList();
    }

    @RequestMapping("getWebContent")
    @ResponseBody
    public JsonResult getWebContent(String url) {
        WebContent webContent = requestService.getWebContent(url);
        if (webContent == null){
            return new JsonResult(0,"什么都没抓取到~");
        }
        return new JsonResult(1,webContent);
    }

    @RequestMapping("getWeather")
    @ResponseBody
    public JsonResult getWeather() {
        System.out.println(getUserIp());
        Object resultObj = requestService.getWeather(getUserIp());
        if (resultObj == null){
            return new JsonResult(0,"什么都没抓取到~");
        }
        return new JsonResult(1,resultObj);
    }

    @RequestMapping("visit/{linkId}")
    @ResponseBody
    public JsonResult getWeather(@PathVariable("linkId") Integer linkId) {
        webSiteService.updateVisitsByLinkId(linkId);
        return new JsonResult(1,"访问量又上涨啦");
    }

}
