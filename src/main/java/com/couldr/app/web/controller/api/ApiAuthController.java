package com.couldr.app.web.controller.api;

import com.couldr.app.model.dto.Const;
import com.couldr.app.model.entity.User;
import com.couldr.app.oauth.config.AuthConfig;
import com.couldr.app.oauth.model.AuthCallback;
import com.couldr.app.oauth.model.AuthResponse;
import com.couldr.app.model.entity.AuthUser;
import com.couldr.app.oauth.request.AuthQqRequest;
import com.couldr.app.oauth.request.AuthRequest;
import com.couldr.app.oauth.utils.AuthStateUtils;
import com.alibaba.fastjson.JSON;
import com.couldr.app.service.AuthUserService;
import com.couldr.app.service.UserService;
import com.couldr.app.utils.AuthTokenUtil;
import com.couldr.app.utils.CouldrUtil;
import com.couldr.app.utils.UuidUtils;
import java.util.Date;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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

    private AuthUserService authUserService;

    @Value("${admin.domain}")
    private String callbackUrl;

    public ApiAuthController(UserService userService, AuthUserService authUserService) {
        this.userService = userService;
        this.authUserService = authUserService;
    }

    @RequestMapping("qq")
    public String index(@RequestParam(name = "backUrl",required = false) String backUrl){
        String redirectUri = "http://www.168dh.cn/oauth/callback";
        if (backUrl != null){
            redirectUri += "?backUrl=" + backUrl;
        }
        AuthRequest request = new AuthQqRequest(AuthConfig.builder()
                .clientId("101828731")
                .clientSecret("e870b28303e89ef93e2be1a0debd67dd")
                .redirectUri(redirectUri)
                .unionId(false)
                .build());
        String state = AuthStateUtils.createState();
        String authorize = request.authorize(state);
        return "redirect:"+authorize;
    }

    @RequestMapping("callback")
    public String callback(@RequestParam("code")String code, @RequestParam("state")String state,
        @RequestParam(value = "backUrl",required = false)String backUrl, HttpServletRequest request, HttpServletResponse response){
        System.out.println("backUrl-----"+backUrl);
        AuthRequest authRequest = new AuthQqRequest(AuthConfig.builder()
            .clientId("101828731")
            .clientSecret("e870b28303e89ef93e2be1a0debd67dd")
            .redirectUri("http://www.168dh.cn/oauth/callback")
            .unionId(false)
            .build());

        AuthCallback callback = AuthCallback.builder()
                .code(code)
                .state(state)
                .build();
        AuthResponse authResponse = authRequest.login(callback);
        AuthUser authUser = (AuthUser) authResponse.getData();
        System.out.println(JSON.toJSONString(authUser));

        User user = userService.findByQq(authUser.getUuid());
        if (user == null){
            User acUser = (User) request.getAttribute("user");
            if(backUrl != null && acUser != null){
                acUser.setQq(authUser.getUuid());
                authUserService.create(authUser);
                userService.update(acUser);
                return "redirect:" + callbackUrl +"/"+ backUrl;
            } else {
                user = this.register(request,authUser);
                callbackUrl = callbackUrl + "/register/name";
            }
        } else if(user.getStatus() == 0){
            callbackUrl = callbackUrl + "/register/name";
        } else {
            userService.updateLastLoginTime(user.getUserId());
        }
        String token = AuthTokenUtil.buildAuthToken(user);
        Cookie cookie = new Cookie(Const.USER_TOKEN_KEY, token);
        cookie.setMaxAge(10 * 24 * 60 * 60 * 1000);
        cookie.setPath("/");
        response.addCookie(cookie);

        return "redirect:" + callbackUrl;
    }

    /**
     * 注册
     * @param request 获取ip
     * @param authUser 第三方信息
     */
    private User register(HttpServletRequest request, AuthUser authUser){
        String uuid = UuidUtils.getUUID();
        User user = User.builder()
            .username(uuid)
            .password(uuid)
            .status(0).isAdmin(0)
            .qq(authUser.getUuid())
            .createTime(new Date())
            .lastLoginTime(new Date())
            .ip(CouldrUtil.getIp(request))
            .nickname(authUser.getNickname())
            .userAvatar(authUser.getAvatar())
            .build();
        userService.create(user);
        authUserService.create(authUser);
        return user;
    }

}

