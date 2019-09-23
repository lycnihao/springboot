package cn.hom1.app.controller.api;

import cn.hom1.app.model.dto.JsonResult;
import cn.hom1.app.model.entity.User;
import cn.hom1.app.service.UserService;
import cn.hutool.core.lang.Validator;
import java.util.Date;
import javax.servlet.http.HttpSession;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.util.StringUtils;
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

  public ApiUserController(UserService userService) {
    this.userService = userService;
  }

  @RequestMapping("/login")
  @ResponseBody
  public JsonResult login(String username, String password,HttpSession session) {

    User user = Validator.isEmail(username) ? userService.findByEmail(username):userService.findByName(username);

    if (user == null){
      return new JsonResult(0, "账户或密码错误");
    }

    if (!new BCryptPasswordEncoder().matches(password, user.getPassword())) {
      return new JsonResult(0, "账户或密码错误");
    }

    userService.updateLastLoginTime(user.getUserId());
    session.setAttribute("user_session_"+user.getUsername(),user);
    return new JsonResult(1, "登陆成功");
  }

  @RequestMapping("/register")
  @ResponseBody
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
}
