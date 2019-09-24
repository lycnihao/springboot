package cn.hom1.app.controller.api;

import cn.hom1.app.model.dto.Const;
import cn.hom1.app.model.dto.JsonResult;
import cn.hom1.app.model.entity.User;
import cn.hom1.app.model.params.LoginQuery;
import cn.hom1.app.service.UserService;
import cn.hutool.core.lang.Validator;
import java.util.Date;
import java.util.Optional;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

/**
 * 用户接口
 *
 * @author iksen
 * @date 2019-09-23 13:58
 */
@RestController
@RequestMapping("api/user")
public class ApiUserController {

  private UserService userService;

  public ApiUserController(UserService userService) {
    this.userService = userService;
  }

  @RequestMapping("/")
  public JsonResult index(){
    return new JsonResult(1, "访问成功");
  }

  @RequestMapping("/login")
  public JsonResult login(LoginQuery loginQuery, HttpServletResponse response,
      HttpSession session) {

    String username = loginQuery.getUsername();
    String password = loginQuery.getPassword();

    User user = Validator.isEmail(username) ? userService.findByEmail(username)
        : userService.findByName(username);

    if (user == null) {
      return new JsonResult(0, "账户或密码错误");
    }

    if (!new BCryptPasswordEncoder().matches(password, user.getPassword())) {
      return new JsonResult(0, "账户或密码错误");
    }

    userService.updateLastLoginTime(user.getUserId());

    Cookie cookie = new Cookie(Const.USER_SESSION_KEY,user.getUserId().toString() );
    cookie.setMaxAge(30 * 24 * 60 * 60);
    cookie.setPath("/");
    response.addCookie(cookie);
    session.setAttribute(Const.USER_SESSION_KEY, user.getUserId());

    return new JsonResult(1, "登陆成功");
  }

  @RequestMapping("/register")
  public JsonResult register(@ModelAttribute User user) {

    if (user.getUsername().equals("admin") || user.getUsername().equals("system")) {
      return new JsonResult(0, "用户名已存在");
    }

    User uUser = userService.findByName(user.getUsername());

    if (uUser != null) {
      return new JsonResult(0, "用户名已存在");
    }

    String password = new BCryptPasswordEncoder().encode(user.getPassword());
    user.setPassword(password);
    user.setCreateTime(new Date());
    user.setStatus(1);
    System.out.println(user);
    /*userService.create(user);*/
    return new JsonResult(1, "用户添加成功");
  }


  @RequestMapping("/info")
  public JsonResult info(HttpSession session){
    String str = (String) session.getAttribute(Const.USER_SESSION_KEY);
    Long userId = Long.valueOf(str);
    Optional<User> user = userService.fetchById(userId);
    User us = user.orElse(new User());
    us.setPassword("**");
    us.setSalt("***");
    return new JsonResult(1, us);
  }

  @RequestMapping("/fail")
  public JsonResult fail(){
    return new JsonResult(1, "访问失败，请登陆后再继续操作");
  }
}
