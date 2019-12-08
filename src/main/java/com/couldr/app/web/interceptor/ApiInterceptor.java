package com.couldr.app.web.interceptor;

import com.couldr.app.model.entity.User;
import com.couldr.app.service.UserService;
import com.auth0.jwt.JWT;
import com.auth0.jwt.JWTVerifier;
import com.auth0.jwt.algorithms.Algorithm;
import com.auth0.jwt.exceptions.JWTDecodeException;
import com.auth0.jwt.exceptions.JWTVerificationException;
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

    @Autowired
    private UserService userService;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        // 从 http 请求头中取出 token
        String token = request.getHeader("token");
        System.out.println("token--"+token);
        // 执行认证
        if (token == null) {
            /*throw new RuntimeException("无token，请重新登录");*/
            System.out.println("无token，请重新登录");
            response.sendRedirect("/api/user/fail");
            return false;
        }
        // 获取 token 中的 user id
        String userId;
        try {
            userId = JWT.decode(token).getAudience().get(0);
        } catch (JWTDecodeException j) {
            /*throw new RuntimeException("401");*/
            System.out.println("user id获取失败");
            response.sendRedirect("/api/user/fail");
            return false;
        }
        User user = userService.fetchById(Long.valueOf(userId)).orElse(new User());
        if (null == user) {
            /*throw new RuntimeException("用户不存在，请重新登录");*/
            System.out.println("用户不存在，请重新登录");
            response.sendRedirect("/api/user/fail");
            return false;
        }
        // 验证 token
        JWTVerifier jwtVerifier = JWT.require(Algorithm.HMAC256(user.getPassword())).build();
        try {
            jwtVerifier.verify(token);
        } catch (JWTVerificationException e) {
            /*throw new RuntimeException("401");*/
            System.out.println("token解析失败");
            response.sendRedirect("/api/user/fail");
            return false;
        }

        request.setAttribute("user",user);
        request.setAttribute("userId",user.getUserId());

        return true;
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
    }
}
