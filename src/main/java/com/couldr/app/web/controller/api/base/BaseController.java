package com.couldr.app.web.controller.api.base;

import com.couldr.app.model.entity.User;
import com.couldr.app.utils.CouldrUtil;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

/**
 * 公共控制器
 *
 * @author iksen
 * @date 2019-12-27 09:48
 */
@Controller
public class BaseController {

  protected Logger logger =  LoggerFactory.getLogger(this.getClass());

  protected HttpServletRequest getRequest() {
    return ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
  }

  protected HttpSession getSession() {
    return getRequest().getSession();
  }

  protected User getUser() {
    return (User) getRequest().getAttribute("user");
  }

  protected long getUserId() {
    Long id = 0l;
    User user = getUser();
    if(user != null){
      id = user.getUserId();
    }
    return id;
  }

  protected String getUserIp() {
    /*String value = getRequest().getHeader("X-Real-IP");
    if (value != null && !"unknown".equalsIgnoreCase(value)) {
      return value;
    } else {
      return getRequest().getRemoteAddr();
    }*/
    return CouldrUtil.getIp(getRequest());
  }

}
