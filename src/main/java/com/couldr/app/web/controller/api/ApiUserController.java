package com.couldr.app.web.controller.api;

import com.couldr.app.model.dto.JsonResult;
import com.couldr.app.model.entity.AuthUser;
import com.couldr.app.model.entity.User;
import com.couldr.app.model.params.LoginQuery;
import com.couldr.app.model.vo.UserVo;
import com.couldr.app.service.AuthUserService;
import com.couldr.app.service.UserService;
import com.couldr.app.service.WebSiteUserService;
import com.couldr.app.utils.AuthTokenUtil;
import cn.hutool.core.lang.Validator;
import cn.hutool.crypto.SecureUtil;
import com.couldr.app.web.controller.api.base.BaseController;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import org.springframework.web.bind.annotation.ModelAttribute;
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
public class ApiUserController extends BaseController {

  private UserService userService;

  private WebSiteUserService webSiteUserService;

  private AuthUserService authUserService;

  public ApiUserController(UserService userService,WebSiteUserService webSiteUserService,AuthUserService authUserService) {
    this.userService = userService;
    this.webSiteUserService = webSiteUserService;
    this.authUserService = authUserService;
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
    logger.info("用户[{}]登录成功。",user.getUsername());
    return new JsonResult(1, "登陆成功",token);
  }

  @RequestMapping("/register")
  public JsonResult register(@ModelAttribute User user) {

    if (user.getUsername().equals("admin") || user.getUsername().equals("system")) {
      return new JsonResult(0, "用户名已存在");
    }


    if (null != userService.findByName(user.getUsername())) {
        return new JsonResult(0, "该用户名已被注册");
    } else if(null != userService.findByEmail(user.getEmail())){
        return new JsonResult(0, "该邮箱已被注册");
    }

    String password = SecureUtil.md5(user.getPassword());
    user.setNickname(user.getUsername());
    user.setPassword(password);
    user.setCreateTime(new Date());
    user.setStatus(1);
    user.setIp(getUserIp());
    user.setUserAvatar("https://www.168dh.cn/favicon.ico");
    user = userService.create(user);
    webSiteUserService.initUserWeb(user.getUserId().intValue());
    logger.info("用户[{}]注册成功。注册ip:[{}]",user.getUsername(),user.getIp());
    return new JsonResult(1, "注册成功");
  }


  @RequestMapping("/info")
  public JsonResult info(){
    User user = getUser();
    List<AuthUser> authUsers = new ArrayList<>();
    UserVo userVo = new UserVo();
    userVo.setUsername(user.getUsername());
    userVo.setNickname(user.getNickname());
    userVo.setUserAvatar(user.getUserAvatar());
    userVo.setEmail(user.getEmail());

    AuthUser authUser = authUserService.findByUuid(user.getQq());
    if (authUser != null){
      authUsers.add(authUser);
    }
    userVo.setAuthUserList(authUsers);


    if (user.getStatus() == 0){
      return new JsonResult(1, user.getNickname());
    } else {
      return new JsonResult(1, userVo);
    }
  }

  @RequestMapping("/info/update")
  public JsonResult infoUpdate(@ModelAttribute User user){
    User acUser = getUser();
    acUser.setNickname(user.getNickname());
    acUser.setUserAvatar(user.getUserAvatar());
    userService.update(acUser);
    return new JsonResult(1,"保存成功");
  }

  @RequestMapping("/info/email/update")
  public JsonResult infoEmailUpdate(@RequestParam("email") String email,@RequestParam("password") String password){
    User acUser = getUser();
    String pass = SecureUtil.md5(password);
    if (!acUser.getPassword().equals(pass)){
      return new JsonResult(0,"密码不匹配请重试。");
    }
    acUser.setEmail(email);
    userService.update(acUser);
    return new JsonResult(1,"保存成功");
  }

  @RequestMapping("/info/pass/update")
  public JsonResult infoPassUpdate(@RequestParam("oldPass") String oldPass,@RequestParam("newPass") String newPass){
    User acUser = getUser();
    String pass = SecureUtil.md5(oldPass);
    if (!acUser.getPassword().equals(pass)){
      return new JsonResult(0,"当前登陆密码不匹配请重试。");
    }
    acUser.setPassword(SecureUtil.md5(newPass));
    userService.update(acUser);
    return new JsonResult(1,"保存成功");
  }


  @RequestMapping("/info/cancel")
  public JsonResult cancel(String source){
    User user = getUser();
    AuthUser authUser = authUserService.findByUuid(user.getQq());
    if (source.contains("QQ")){
      authUserService.remove(authUser);
      user.setQq("");
    }
    userService.update(user);
    return new JsonResult(1,"保存成功");
  }

  @RequestMapping("/fail")
  @ResponseBody
  public JsonResult fail(){
    return new JsonResult(0, "访问失败，请登陆后再继续操作");
  }
}
