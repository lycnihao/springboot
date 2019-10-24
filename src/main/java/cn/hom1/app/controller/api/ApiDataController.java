package cn.hom1.app.controller.api;

import cn.hom1.app.model.dto.JsonResult;
import cn.hom1.app.model.dto.WebContent;
import cn.hom1.app.model.entity.Category;
import cn.hom1.app.model.entity.WebSite;
import cn.hom1.app.model.entity.WebSiteUser;
import cn.hom1.app.model.vo.CategoryWebSiteVo;
import cn.hom1.app.service.CategoryService;
import cn.hom1.app.service.WebSiteService;
import cn.hom1.app.service.RequestService;

import cn.hom1.app.service.WebSiteUserService;
import com.auth0.jwt.JWT;
import com.auth0.jwt.exceptions.JWTDecodeException;
import java.util.Collections;
import java.util.Comparator;
import javax.servlet.http.HttpServletRequest;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("api")
public class ApiDataController {

    private WebSiteService webSiteService;

    private CategoryService categoryService;

    private RequestService requestService;

    private WebSiteUserService webSiteUserService;

    public ApiDataController(WebSiteService webSiteService, CategoryService categoryService,
                  RequestService requestService,WebSiteUserService webSiteUserService) {
        this.webSiteService = webSiteService;
        this.categoryService = categoryService;
        this.requestService = requestService;
        this.webSiteUserService = webSiteUserService;
    }

    @RequestMapping("getList")
    @Cacheable(value="webSite",key="'webSite'")
    public CategoryWebSiteVo getList() {
        List<Category> categories = categoryService.list();
        Map<Integer, List<WebSite>> webSites = webSiteService.convertToListMapByCategory(categories);
        return new CategoryWebSiteVo(categories,webSites);
    }

    @RequestMapping("getHotList")
    public Object[] getHotList(){
        return requestService.getHotList();
    }

    @RequestMapping("userWebSite")
    public List<WebSiteUser> getUserWebSite(HttpServletRequest request) {
        String token = request.getHeader("token");
        if (token == null){
            return webSiteService.listWebSiteListByUserId(0);
        }
        // 获取 token 中的 user id
        String userId = "0";
        try {
            userId = JWT.decode(token).getAudience().get(0);
        } catch (JWTDecodeException j) {
            System.out.println("user id获取失败");
        }
        List<WebSiteUser> webSiteList = webSiteService.listWebSiteListByUserId(Integer.valueOf(userId));
        Collections.sort(webSiteList, Comparator.comparing(WebSiteUser::getSort));
        return webSiteList;
    }

    @RequestMapping("userWebSite/{siteId}")
    public JsonResult userWebSite( @PathVariable("siteId") Integer siteId){
        return new JsonResult(1,webSiteUserService.fetchById(siteId).orElse(new WebSiteUser()));
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
}
