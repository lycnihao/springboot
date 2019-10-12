package cn.hom1.app.controller.api;

import cn.hom1.app.model.dto.Const;
import cn.hom1.app.model.dto.JsonResult;
import cn.hom1.app.model.entity.User;
import cn.hom1.app.model.entity.WebSite;
import cn.hom1.app.model.params.LoginQuery;
import cn.hom1.app.service.UserService;
import cn.hom1.app.service.WebSiteService;
import cn.hom1.app.utils.AuthTokenUtil;
import cn.hutool.core.lang.Validator;
import cn.hutool.crypto.SecureUtil;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Optional;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.auth0.jwt.JWT;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
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

  private WebSiteService webSiteService;

  public ApiUserController(UserService userService,WebSiteService webSiteService) {
    this.userService = userService;
    this.webSiteService = webSiteService;
  }

  @RequestMapping("/")
  public JsonResult index(){
    return new JsonResult(1, "访问成功");
  }

  @RequestMapping("/login")
  public JsonResult login(LoginQuery loginQuery) {

    String username = loginQuery.getUsername();
    String password = loginQuery.getPassword();

    User user = Validator.isEmail(username) ? userService.findByEmail(username)
        : userService.findByName(username);

    if (user == null) {
      return new JsonResult(0, "账户或密码错误");
    }

    if (!SecureUtil.md5(password).equals(user.getPassword())) {
      return new JsonResult(0, "账户或密码错误");
    }

    userService.updateLastLoginTime(user.getUserId());

    String token = AuthTokenUtil.buildAuthToken(user);

    Cookie cookie = new Cookie(Const.USER_TOKEN_KEY + "_"+user.getUserId(),token);
    cookie.setPath("/");
    return new JsonResult(1, "登陆成功",token);
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

    String password = SecureUtil.md5(user.getPassword());
    user.setNickname(user.getUsername());
    user.setPassword(password);
    user.setCreateTime(new Date());
    user.setStatus(1);
    if (user.getQq() == null) {
      user.setUserAvatar("https://cube.elemecdn.com/0/88/03b0d39583f48206768a7534e55bcpng.png");
    } else {
      user.setUserAvatar(String.format("http://q1.qlogo.cn/g?b=qq&nk=%s&s=100", user.getQq()));
    }
    userService.create(user);
    return new JsonResult(1, "注册成功");
  }


  @RequestMapping("/info")
  public JsonResult info(HttpServletRequest request){
    User user = (User) request.getAttribute("user");
    user.setPassword("**");
    user.setSalt("***");
    return new JsonResult(1, user);
  }

  @RequestMapping("/fail")
  @ResponseBody
  public JsonResult fail(){
    return new JsonResult(0, "访问失败，请登陆后再继续操作");
  }

  @RequestMapping("userWebSite")
  public List<WebSite> getUserWebSite(HttpServletRequest request) {
    User user = (User) request.getAttribute("user");
    return webSiteService.listWebSiteListByUserId(user.getUserId().intValue());
  }
}
