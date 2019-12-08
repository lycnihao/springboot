package com.couldr.app.web.controller.api;

import com.couldr.app.model.dto.Const;
import com.couldr.app.oauth.config.AuthConfig;
import com.couldr.app.oauth.model.AuthCallback;
import com.couldr.app.oauth.model.AuthResponse;
import com.couldr.app.oauth.model.AuthUser;
import com.couldr.app.oauth.request.AuthQqRequest;
import com.couldr.app.oauth.request.AuthRequest;
import com.couldr.app.oauth.utils.AuthStateUtils;
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
                .redirectUri("http://www.168dh.cn/oauth/callback")
                .unionId(false)
                .build());
        String state = AuthStateUtils.createState();
        String authorize = request.authorize(state);
        Const.REQUEST = request;
        return "redirect:"+authorize;
    }

    @RequestMapping("callback")
    public String callback(String code,String state){
        AuthCallback callback = AuthCallback.builder()
                .code(code)
                .state(state)
                .build();
        AuthResponse response = Const.REQUEST.login(callback);
        AuthUser user = (AuthUser) response.getData();
        System.out.println(JSON.toJSONString(user));
        String redirectUrl = "http://168dh.cn";
        return "redirect:"+redirectUrl;
    }

}

