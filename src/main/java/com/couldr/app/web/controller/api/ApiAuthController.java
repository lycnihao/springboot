package com.couldr.app.web.controller.api;

import cn.hutool.crypto.SecureUtil;
import com.couldr.app.model.dto.Const;
import com.couldr.app.model.entity.User;
import com.couldr.app.oauth.config.AuthConfig;
import com.couldr.app.oauth.model.AuthCallback;
import com.couldr.app.oauth.model.AuthResponse;
import com.couldr.app.oauth.model.AuthUser;
import com.couldr.app.oauth.request.AuthQqRequest;
import com.couldr.app.oauth.request.AuthRequest;
import com.couldr.app.oauth.utils.AuthStateUtils;
import com.alibaba.fastjson.JSON;
import com.couldr.app.service.UserService;
import com.couldr.app.utils.CouldrUtil;
import com.couldr.app.utils.UuidUtils;
import java.util.Date;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
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

    private UserService userService;

    public ApiAuthController(UserService userService) {
        this.userService = userService;
    }

    @RequestMapping("qq")
    public String index(){
        AuthRequest request = new AuthQqRequest(AuthConfig.builder()
                .clientId("101828731")
                .clientSecret("e870b28303e89ef93e2be1a0debd67dd")
                .redirectUri("http://www.168dh.cn/oauth/callback")
                .unionId(false)
                .build());
        String state = AuthStateUtils.createState();
        String authorize = request.authorize(state);
        return "redirect:"+authorize;
    }

    @RequestMapping("callback")
    public String callback(String code, String state, HttpServletRequest httpServletRequest){
        AuthRequest request = new AuthQqRequest(AuthConfig.builder()
            .clientId("101828731")
            .clientSecret("e870b28303e89ef93e2be1a0debd67dd")
            .redirectUri("http://www.168dh.cn/oauth/callback")
            .unionId(false)
            .build());

        AuthCallback callback = AuthCallback.builder()
                .code(code)
                .state(state)
                .build();
        AuthResponse response = request.login(callback);
        AuthUser authUser = (AuthUser) response.getData();
        System.out.println(JSON.toJSONString(authUser));

        User user = userService.findByQq(authUser.getUuid());

        if (user == null){
            this.register(httpServletRequest,authUser);
        }

        String redirectUrl = "http://168dh.cn";
        return "redirect:"+redirectUrl;
    }

    /**
     * 注册
     * @param request 获取ip
     * @param authUser 第三方信息
     */
    private void register(HttpServletRequest request, AuthUser authUser){
        String uuid = UuidUtils.getUUID();
        User user = User.builder()
            .username(uuid)
            .password(uuid)
            .status(1).isAdmin(0)
            .qq(authUser.getUuid())
            .createTime(new Date())
            .lastLoginTime(new Date())
            .ip(CouldrUtil.getIp(request))
            .nickname(authUser.getNickname())
            .userAvatar(authUser.getAvatar())
            .build();
        userService.create(user);
    }

}

