package com.couldr.app.web.controller.api;

import com.couldr.app.exception.NotFoundException;
import com.couldr.app.model.dto.JsonResult;
import com.couldr.app.model.entity.Attachment;
import com.couldr.app.model.entity.Category;
import com.couldr.app.model.entity.User;
import com.couldr.app.model.entity.WebSite;
import com.couldr.app.model.entity.WebSiteUser;
import com.couldr.app.model.vo.CategoryWebSiteVo;
import com.couldr.app.service.AttachmentService;
import com.couldr.app.service.CategoryService;
import com.couldr.app.service.UserService;
import com.couldr.app.service.WebSiteService;
import com.couldr.app.service.WebSiteUserService;
import com.couldr.app.utils.HtmlUtil;
import com.couldr.app.web.controller.api.base.BaseController;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

/**
 * 网址集api
 *
 * @author iksen
 * @date 2019-12-27 10:01
 */
@Controller
@RequestMapping("/api/webSite")
public class ApiWebSiteController extends BaseController {

  private UserService userService;

  private AttachmentService attachmentService;

  private WebSiteUserService webSiteUserService;

  private CategoryService categoryService;

  private WebSiteService webSiteService;

  public ApiWebSiteController(UserService userService,AttachmentService attachmentService,WebSiteUserService webSiteUserService,CategoryService categoryService,WebSiteService webSiteService) {
    this.userService = userService;
    this.attachmentService = attachmentService;
    this.webSiteUserService = webSiteUserService;
    this.categoryService = categoryService;
    this.webSiteService = webSiteService;
  }


  @RequestMapping("list")
  @ResponseBody
  public CategoryWebSiteVo getList() {
    List<Category> categories = categoryService.list();
    Map<Integer, List<WebSite>> webSites = webSiteService.convertToListMapByCategory(categories);
    return new CategoryWebSiteVo(categories,webSites);
  }

  @RequestMapping("user")
  @ResponseBody
  public List<WebSiteUser> getUserWebSite() {
    List<WebSiteUser> webSiteList = webSiteService.listWebSiteListByUserId((int)getUserId());
    Collections.sort(webSiteList, Comparator.comparing(WebSiteUser::getSort));
    return webSiteList;
  }

  @RequestMapping("user/{siteId}")
  @ResponseBody
  public JsonResult getUserWebSite( @PathVariable("siteId") Integer siteId){
    WebSite webSite = webSiteService.fetchById(siteId).orElse(new WebSite());
    List<Category> categories  = categoryService.findByWebsiteId(siteId);
    Map<String,Object> result = new HashMap<>();
    result.put("webSite",webSite);
    result.put("categories",categories);
    return new JsonResult(1,result);
  }

  @PostMapping("/icon/upload")
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
  public JsonResult saveSite(WebSiteUser webSiteUser){
    webSiteUser.setUserId((int) getUserId());
    if (webSiteUser.getId() == null){
      Integer maxSort = webSiteUserService.findMaxSort((int) getUserId());
      webSiteUser.setSort(maxSort == null ? 1 : maxSort + 1);
    }
    webSiteUserService.create(webSiteUser);
    return new JsonResult(1, "保存成功~");
  }

  @RequestMapping("/removeSite/{siteId}")
  @ResponseBody
  public JsonResult removeSite(@PathVariable("siteId") String siteId){
    Object userId = (int) getUserId();
    try {
      WebSiteUser webSiteUser = webSiteUserService.fetchById(Integer.valueOf(siteId)).orElse(new WebSiteUser());
      webSiteUserService.updateSortAll(Integer.valueOf(userId.toString()),webSiteUser.getSort());
      webSiteUserService.removeById(Integer.valueOf(siteId));
    }catch (NotFoundException e){
      return new JsonResult(0, "网址已删除请勿重复提交。");
    }
    return new JsonResult(1, "删除成功~");
  }

  @RequestMapping("/sortSite/{siteId}")
  @ResponseBody
  public JsonResult sort(@PathVariable("siteId") Integer siteId, @RequestParam(name = "oldIndex") Integer oldIndex,
      @RequestParam(name = "newIndex") Integer newIndex){
    Object userId = (int) getUserId();

    webSiteUserService.updateSort(Integer.valueOf(userId.toString()), oldIndex, newIndex);

    WebSiteUser webSiteUser = webSiteUserService.fetchById(siteId).orElse(new WebSiteUser());
    webSiteUser.setSort(newIndex);
    webSiteUserService.update(webSiteUser);

    return new JsonResult(1, "排序保存成功~");
  }


  @RequestMapping("/active")
  @ResponseBody
  public JsonResult active(String userName){
    Object userId = (int) getUserId();

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


  @RequestMapping("/import")
  @ResponseBody
  private JsonResult inport(@RequestParam("file") MultipartFile file){
    try {
      Map<String, String>  resultMap = HtmlUtil.parseHtmlOne(file.getInputStream());
      webSiteUserService.inportHtml(resultMap,(int)getUserId());
    } catch (IOException e) {
      e.printStackTrace();
      logger.error("导入html异常:",e);
    }
    return new JsonResult(1,"导入成功。");
  }

  @RequestMapping("/export")
  private void export(HttpServletResponse response){
    try {
      String date = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
      String fileName= "couldr_" + date + ".html";
      StringBuilder sb = new StringBuilder();
      try {
        sb = sb.append(webSiteUserService.exportToHtml((int)getUserId()));
      } catch (Exception e) {
        logger.error("异常：",e);
      }
      sb = HtmlUtil.exportHtml("酷达导航", sb);
      response.setCharacterEncoding("UTF-8");
      response.setHeader("Content-disposition","attachment; filename=" + fileName);
      response.getWriter().print(sb);
    } catch (Exception e) {
      logger.error("异常：",e);
    }
  }
}
