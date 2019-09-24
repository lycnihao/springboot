package cn.hom1.app.security.interceptor;

import static cn.hom1.app.model.dto.Const.USER_SESSION_KEY;

import cn.hom1.app.model.dto.Const;
import cn.hom1.app.model.entity.User;
import cn.hom1.app.service.UserService;
import java.util.Optional;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

/**
 *  登录控制器
 *
 */
@Component
public class LoginInterceptor implements HandlerInterceptor {

    @Autowired
    private UserService userService;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        final Object obj = request.getSession().getAttribute(USER_SESSION_KEY);
        //如果user不为空则放行
        if (null != obj) {
            return true;
        } else {
            Cookie[] cookies = request.getCookies();
            if (cookies != null){

                for (Cookie cookie : cookies) {
                    if (cookie.getName().equals(Const.USER_SESSION_KEY)) {
                        if (!StringUtils.isEmpty(cookie.getValue())) {
                            request.getSession().setAttribute(Const.USER_SESSION_KEY,cookie.getValue());
                            return true;
                        } else {
                            break;
                        }
                    }
                }

            }
        }
        //否则拦截并跳转到登录
        response.sendRedirect("/api/user/fail");
        return false;
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
    }
}
