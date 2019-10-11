package cn.hom1.app.controller;

import static cn.hom1.app.model.dto.Const.USER_SESSION_KEY;

import cn.hom1.app.model.dto.JsonResult;
import cn.hom1.app.model.entity.User;
import cn.hom1.app.service.UserService;
import cn.hutool.core.lang.Validator;
import cn.hutool.crypto.SecureUtil;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * 后台管理
 *
 * @author iksen
 * @date 2019-07-29 15:00
 */
@Controller
@RequestMapping("admin")
public class AdminController {

  private final static Logger logger = LoggerFactory.getLogger(AdminController.class);

  @Autowired
  private UserService userService;

  @RequestMapping
  public String admin() {
    return "index";
  }

  @GetMapping("login")
  public String login() {
    return "login";
  }

  @PostMapping("login")
  @ResponseBody
  public JsonResult subLogin(HttpServletRequest request, String username, String password,
      String verification, @RequestParam(value = "rememberMe", defaultValue = "0") Integer rememberMe,
      HttpSession session) {
    logger.info("username:[{}]-password[{}]",username,password);
    if(StringUtils.isEmpty(username)||StringUtils.isEmpty(password)){
      return new JsonResult(0,"缺失参数");
    }
    User user = Validator.isEmail(username) ?
        userService.findByEmail(username) : userService.findByName(username);
    if (user != null && user.getPassword().equals(SecureUtil.md5(password))){
      userService.updateLastLoginTime(user.getUserId());
      session.setAttribute(USER_SESSION_KEY, user);
      return new JsonResult(1,"登陆成功");
    }
    return new JsonResult(0,"账号或密码不匹配！请重新输入");
  }
}
