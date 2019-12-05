package cn.hom1.app.controller.api;

import cn.hom1.app.model.dto.Const;
import cn.hom1.app.oauth.config.AuthConfig;
import cn.hom1.app.oauth.model.AuthCallback;
import cn.hom1.app.oauth.model.AuthResponse;
import cn.hom1.app.oauth.model.AuthUser;
import cn.hom1.app.oauth.request.AuthQqRequest;
import cn.hom1.app.oauth.request.AuthRequest;
import cn.hom1.app.oauth.utils.AuthStateUtils;
import com.alibaba.fastjson.JSON;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 第三方登陆
 *
 * @author iksen
 * @date 2019-12-03 15:27
 */
@Controller
@RequestMapping("/oauth/")
public class ApiAuthController {

    private static AuthRequest request;

    @RequestMapping("qq")
    public String index(){
         request = new AuthQqRequest(AuthConfig.builder()
                .clientId("101828731")
                .clientSecret("e870b28303e89ef93e2be1a0debd67dd")
                .redirectUri("http://www.168dh.cn/oauth/login")
                .unionId(false)
                .build());
        String state = AuthStateUtils.createState();
        String authorize = request.authorize(state);
        System.out.println(authorize);
        Const.REQUEST = request;
        return "redirect:"+authorize;
    }

    @RequestMapping("login")
    public String login(String code,String state){
        AuthCallback callback = AuthCallback.builder()
                .code(code)
                .state(state)
                .build();
        System.out.println(callback);
        AuthResponse response = Const.REQUEST.login(callback);
        System.out.println(response);
        AuthUser user = (AuthUser) response.getData();
        System.out.println(JSON.toJSONString(user));
        return null;
    }

}

