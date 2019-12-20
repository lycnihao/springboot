package com.couldr.app.web.controller.api;

import com.couldr.app.model.dto.JsonResult;
import com.couldr.app.model.entity.Attachment;
import com.couldr.app.model.entity.AuthUser;
import com.couldr.app.model.entity.User;
import com.couldr.app.model.entity.WebSiteUser;
import com.couldr.app.model.params.LoginQuery;
import com.couldr.app.model.vo.UserVo;
import com.couldr.app.service.AttachmentService;
import com.couldr.app.service.AuthUserService;
import com.couldr.app.service.UserService;
import com.couldr.app.service.WebSiteUserService;
import com.couldr.app.utils.AuthTokenUtil;
import com.couldr.app.utils.CouldrUtil;
import cn.hutool.core.lang.Validator;
import cn.hutool.crypto.SecureUtil;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

/**
 * 用户接口
 *
 * @author iksen
 * @date 2019-09-23 13:58
 */
@RestController
@RequestMapping("api/user")
public class ApiUserController {

  private final static Logger logger = LoggerFactory.getLogger(ApiUserController.class);

  private UserService userService;

  private AttachmentService attachmentService;

  private WebSiteUserService webSiteUserService;

  private AuthUserService authUserService;

  public ApiUserController(UserService userService,AttachmentService attachmentService,WebSiteUserService webSiteUserService,AuthUserService authUserService) {
    this.userService = userService;
    this.attachmentService = attachmentService;
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
  public JsonResult register(@ModelAttribute User user,HttpServletRequest request) {

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
    user.setIp(CouldrUtil.getIp(request));
    user.setUserAvatar("https://cube.elemecdn.com/0/88/03b0d39583f48206768a7534e55bcpng.png");
    user = userService.create(user);
    webSiteUserService.initUserWeb(user.getUserId().intValue());
    logger.info("用户[{}]注册成功。注册ip:[{}]",user.getUsername(),user.getIp());
    return new JsonResult(1, "注册成功");
  }


  @RequestMapping("/info")
  public JsonResult info(HttpServletRequest request){
    User user = (User) request.getAttribute("user");
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
  public JsonResult infoUpdate(@ModelAttribute User user,HttpServletRequest request){
    User acUser = (User) request.getAttribute("user");
    acUser.setNickname(user.getNickname());
    acUser.setUserAvatar(user.getUserAvatar());
    userService.update(acUser);
    return new JsonResult(1,"保存成功");
  }

  @RequestMapping("/info/email/update")
  public JsonResult infoEmailUpdate(@RequestParam("email") String email,@RequestParam("password") String password,HttpServletRequest request){
    User acUser = (User) request.getAttribute("user");
    String pass = SecureUtil.md5(password);
    if (!acUser.getPassword().equals(pass)){
      return new JsonResult(0,"密码不匹配请重试。");
    }
    acUser.setEmail(email);
    userService.update(acUser);
    return new JsonResult(1,"保存成功");
  }

  @RequestMapping("/info/pass/update")
  public JsonResult infoPassUpdate(@RequestParam("oldPass") String oldPass,@RequestParam("newPass") String newPass,HttpServletRequest request){
    User acUser = (User) request.getAttribute("user");
    String pass = SecureUtil.md5(oldPass);
    if (!acUser.getPassword().equals(pass)){
      return new JsonResult(0,"当前登陆密码不匹配请重试。");
    }
    acUser.setPassword(SecureUtil.md5(newPass));
    userService.update(acUser);
    return new JsonResult(1,"保存成功");
  }


  @RequestMapping("/info/cancel")
  public JsonResult cancel(String source,HttpServletRequest request){
    User user = (User) request.getAttribute("user");
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


  @PostMapping("/upload")
  @ResponseBody
  public JsonResult upload(@RequestParam("file") MultipartFile file,
      HttpServletRequest request) {
    Map<String, String> resultMap = null;
    if (!file.isEmpty()) {
      resultMap = attachmentService.upload(file, request);
    }
    //保存在数据库
    Attachment attachment = new Attachment();
    attachment.setAttachName(resultMap.get("fileName"));
    attachment.setAttachPath(resultMap.get("filePath"));
    attachment.setAttachSmallPath(resultMap.get("smallPath"));
    attachment.setAttachType(file.getContentType());
    attachment.setAttachSuffix(resultMap.get("suffix"));
    attachment.setAttachSize(resultMap.get("size"));
    attachment.setAttachWh(resultMap.get("wh"));
    attachment.setAttachLocation(resultMap.get("location"));
    attachmentService.create(attachment);
    return new JsonResult(1,"图标上传成功", resultMap);
  }

  @RequestMapping("/saveSite")
  @ResponseBody
  public JsonResult saveSite(WebSiteUser webSiteUser, HttpServletRequest request){
    Object userId = request.getAttribute("userId");
    webSiteUser.setUserId(Integer.valueOf(userId.toString()));
    if (webSiteUser.getId() == null){
      Integer maxSort = webSiteUserService.findMaxSort(Integer.valueOf(userId.toString()));
      webSiteUser.setSort(maxSort == null ? 1 : maxSort + 1);
    }
    webSiteUserService.create(webSiteUser);
    return new JsonResult(1, "保存成功~");
  }

  @RequestMapping("/removeSite/{siteId}")
  @ResponseBody
  public JsonResult removeSite(@PathVariable("siteId") String siteId, HttpServletRequest request){
    Object userId = request.getAttribute("userId");

    WebSiteUser webSiteUser = webSiteUserService.fetchById(Integer.valueOf(siteId)).orElse(new WebSiteUser());
    webSiteUserService.updateSortAll(Integer.valueOf(userId.toString()),webSiteUser.getSort());
    webSiteUserService.removeById(Integer.valueOf(siteId));
    return new JsonResult(1, "删除成功~");
  }

  @RequestMapping("/sortSite/{siteId}")
  @ResponseBody
  public JsonResult sort(@PathVariable("siteId") Integer siteId, @RequestParam(name = "oldIndex") Integer oldIndex,
      @RequestParam(name = "newIndex") Integer newIndex,HttpServletRequest request){
    Object userId = request.getAttribute("userId");

    webSiteUserService.updateSort(Integer.valueOf(userId.toString()), oldIndex, newIndex);

    WebSiteUser webSiteUser = webSiteUserService.fetchById(siteId).orElse(new WebSiteUser());
    webSiteUser.setSort(newIndex);
    webSiteUserService.update(webSiteUser);

    return new JsonResult(1, "排序保存成功~");
  }


  @RequestMapping("/active")
  @ResponseBody
  public JsonResult active(String userName,HttpServletRequest request){
    Object userId = request.getAttribute("userId");

    User user = userService.fetchById((Long) userId).orElse(new User());
    if (user.getStatus() == 0){
      user.setStatus(1);
      user.setUsername(userName);
      user.setNickname(userName);
      user.setLastLoginTime(new Date());
      //状态修改为正常
      userService.update(user);
      //初始化常用网站
      webSiteUserService.initUserWeb((long)  userId);
      return new JsonResult(1,"注册成功。开始您的旅程吧。");
    }

    return new JsonResult(0,"error");
  }

}
