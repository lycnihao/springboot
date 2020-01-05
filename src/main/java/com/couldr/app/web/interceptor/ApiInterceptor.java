package com.couldr.app.web.interceptor;

import com.couldr.app.exception.AuthException;
import com.couldr.app.exception.CouldrException;
import com.couldr.app.model.dto.Const;
import com.couldr.app.model.entity.User;
import com.couldr.app.service.UserService;
import com.auth0.jwt.JWT;
import com.auth0.jwt.JWTVerifier;
import com.auth0.jwt.algorithms.Algorithm;
import com.auth0.jwt.exceptions.JWTDecodeException;
import com.auth0.jwt.exceptions.JWTVerificationException;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

/**
 *  api登录控制器
 *
 */
@Component
public class ApiInterceptor implements HandlerInterceptor {

    private UserService userService;

    public ApiInterceptor(UserService userService) {
        this.userService = userService;
    }

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws CouldrException {
        String token = null;
        Cookie[] cookies = request.getCookies();
        if (cookies != null){
            for (Cookie cookie : cookies){
                if (cookie.getName().equals(Const.USER_TOKEN_KEY))
                    token = cookie.getValue();
            }
        }
        System.out.println("token--"+token);
        //注册或登陆放行
        if (token == null && request.getRequestURI().contains("oauth/callback")){
            return true;
        } else
        if (token == null &&  request.getRequestURI().equals("/api/webSite/user")){
            request.setAttribute("user",null);
            return true;
        } else
        if (token == null &&  request.getRequestURI().equals("/api/cate/getUserCategoryList")){
            request.setAttribute("user",null);
            return true;
        }

        // 执行认证
        if (token == null) {
            System.out.println("无token，请重新登录");
            throw new AuthException("无token，请重新登录");
        }
        // 获取 token 中的 user id
        String userId;
        try {
            userId = JWT.decode(token).getAudience().get(0);
        } catch (JWTDecodeException j) {
            System.out.println("user id获取失败");
            throw new AuthException("用户标识获取失败",j);
        }
        User user = userService.fetchById(Long.valueOf(userId)).orElse(new User());

        // 验证 token
        JWTVerifier jwtVerifier = JWT.require(Algorithm.HMAC256(user.getPassword())).build();
        try {
            jwtVerifier.verify(token);
        } catch (JWTVerificationException e) {
            System.out.println("token解析失败");
            throw new AuthException("token解析失败",e);
        }

        request.setAttribute("user",user);
        return true;
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
    }
}
