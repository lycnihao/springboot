package cn.hom1.app.controller.api;

import cn.hom1.app.model.entity.Category;
import cn.hom1.app.model.entity.WebSite;
import cn.hom1.app.model.entity.WebSiteUser;
import cn.hom1.app.model.vo.CategoryWebSiteVo;
import cn.hom1.app.service.CategoryService;
import cn.hom1.app.service.WebSiteService;
import cn.hom1.app.service.RequestService;

import com.auth0.jwt.JWT;
import com.auth0.jwt.exceptions.JWTDecodeException;
import javax.servlet.http.HttpServletRequest;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("api")
public class ApiDataController {

    private WebSiteService webSiteService;

    private CategoryService categoryService;

    private RequestService requestService;

    public ApiDataController(WebSiteService webSiteService, CategoryService categoryService,
                  RequestService requestService) {
        this.webSiteService = webSiteService;
        this.categoryService = categoryService;
        this.requestService = requestService;
    }

    @RequestMapping("getList")
    @Cacheable(value="webSite",key="'webSite'")
    public CategoryWebSiteVo getList() {
        List<Category> categories = categoryService.list();
        Map<Integer, List<WebSite>> webSites = webSiteService.convertToListMapByCategory(categories);
        return new CategoryWebSiteVo(categories,webSites);
    }


/*    @RequestMapping("getTouch")
    public List<WebSite> getTouch(){
        return webSiteService.findTouch();
    }


    @RequestMapping("getRecommend")
    public List<WebSite> getRecommend(){
        return webSiteService.findRecommend();
    }*/

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
        return webSiteService.listWebSiteListByUserId(Integer.valueOf(userId));
    }
}