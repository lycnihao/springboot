package com.couldr.app.web.controller.api;

import com.couldr.app.exception.NotFoundException;
import com.couldr.app.model.dto.JsonResult;
import com.couldr.app.model.entity.*;
import com.couldr.app.model.vo.CategoryWebSiteVo;
import com.couldr.app.service.*;
import com.couldr.app.utils.HtmlUtil;
import com.couldr.app.web.controller.api.base.BaseController;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
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

  private CategoryService categoryService;

  private WebSiteService webSiteService;

  private WebSiteCategoryService webSiteCategoryService;

  private WebSiteLibraryService webSiteLibraryService;

  public ApiWebSiteController(UserService userService,AttachmentService attachmentService,CategoryService categoryService,WebSiteService webSiteService,WebSiteCategoryService webSiteCategoryService,WebSiteLibraryService webSiteLibraryService) {
    this.userService = userService;
    this.attachmentService = attachmentService;
    this.categoryService = categoryService;
    this.webSiteService = webSiteService;
    this.webSiteCategoryService = webSiteCategoryService;
    this.webSiteLibraryService = webSiteLibraryService;
  }


  @RequestMapping("list")
  @ResponseBody
  public CategoryWebSiteVo getList() {
    List<Category> categories = categoryService.categoryListByType(0L,0);
    Map<Integer, List<WebSite>> webSites = webSiteService.convertToListMapByCategory(categories);
    return new CategoryWebSiteVo(categories,webSites);
  }

  @RequestMapping("user")
  @ResponseBody
  public CategoryWebSiteVo getUserWebSite() {
    List<Category> categories = categoryService.categoryListByType(getUserId(),1);
    Map<Integer, List<WebSite>> webSites = webSiteService.convertToListMapByCategory(categories);
    return new CategoryWebSiteVo(categories,webSites);
  }

  @RequestMapping("recommend")
  @ResponseBody
  public List<WebSite> getRecommend() {
    return webSiteService.findRecommend();
  }

  @RequestMapping("recommend/r")
  @ResponseBody
  public List<WebSite> recommendRefresh() {
    return webSiteService.findRecommendByRandom();
  }

/*  @RequestMapping("user/{siteId}")
  @ResponseBody
  public JsonResult getUserWebSite( @PathVariable("siteId") Integer siteId){
    WebSite webSite = webSiteService.fetchById(siteId).orElse(new WebSite());
    List<Category> categories  = categoryService.findByWebsiteId(siteId);
    Map<String,Object> result = new HashMap<>();
    result.put("webSite",webSite);
    result.put("categories",categories);
    return new JsonResult(1,result);
  }*/

  @PostMapping("/icon/upload")
  @ResponseBody
  public JsonResult upload(@RequestParam("file") MultipartFile file,@RequestParam(value = "url") String url,
      HttpServletRequest request) {

    Map<String, String> resultMap = null;


    WebSiteLibrary webSiteLibrary =  webSiteLibraryService.findByUrl(url);
//    if (webSiteLibrary != null){
//      resultMap = new HashMap<>();
//      resultMap.put("filePath",webSiteLibrary.getIcon());
//    } else {
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
    //}

    return new JsonResult(1,"图标上传成功", resultMap);
  }

  @RequestMapping("/saveSite")
  @ResponseBody
  public JsonResult saveSite(WebSite webSite,Integer categoryId){
    WebSiteLibrary webSiteLibrary = webSiteLibraryService.findByUrl(webSite.getUrl());
    if(webSiteLibrary == null){
      webSiteLibrary = new WebSiteLibrary();
      webSiteLibrary.setTitle(webSite.getTitle());
      webSiteLibrary.setUrl(webSite.getUrl());
      webSiteLibrary.setIcon(webSite.getIcon());
      webSiteLibrary.setDescription(webSite.getSummary());
      webSiteLibrary.setCreateTime(new Date());
      webSiteLibraryService.create(webSiteLibrary);
    }
    Category category = categoryService.getById(categoryId);
    if (category.getUserId() != getUserId()){
      return new JsonResult(0, "error");
    }
    Set<Integer> categoryIds = new HashSet<>();
    categoryIds.add(categoryId);
    webSiteService.save(webSite,categoryIds);
    return new JsonResult(1, "保存成功~");
  }

  @RequestMapping("/moveSite")
  @ResponseBody
  public JsonResult moveSite(String webSiteIds,Integer categoryId){
    webSiteService.moveSite(webSiteIds,categoryId);
    return new JsonResult(1, "网址已经移动到目标分类~");
  }

  @RequestMapping("/removeSite/{categoryId}/{siteId}")
  @ResponseBody
  public JsonResult removeSite(@PathVariable("categoryId") Integer categoryId,@PathVariable("siteId") Integer siteId){
    Category category = categoryService.getById(categoryId);
    if (category.getUserId() != getUserId()){
      return new JsonResult(0, "error");
    }
    try {
      WebSite webSite = webSiteService.fetchById(siteId).orElse(new WebSite());
      webSiteService.updateSortAll(categoryId,webSite.getOrdered());
      webSiteCategoryService.removeWebsiteId(siteId);
      webSiteService.removeById(siteId);
    }catch (NotFoundException e){
      return new JsonResult(0, "网址已删除请勿重复提交。");
    }
    return new JsonResult(1, "删除成功~");
  }

  @RequestMapping("/sortSite/{categoryId}/{siteId}")
  @ResponseBody
  public JsonResult sort(@PathVariable("categoryId") Integer categoryId,@PathVariable("siteId") Integer siteId, @RequestParam(name = "oldIndex") Integer oldIndex,
      @RequestParam(name = "newIndex") Integer newIndex){

    webSiteService.updateSort( categoryId, oldIndex, newIndex);

    WebSite webSite = webSiteService.fetchById(siteId).orElse(new WebSite());
    webSite.setOrdered(newIndex);
    webSiteService.update(webSite);

    return new JsonResult(1, "排序保存成功~");
  }


  @RequestMapping("/active")
  @ResponseBody
  public JsonResult active(String userName){
    long userId =  getUserId();

    User user = userService.fetchById(userId).orElse(new User());
    if (user.getStatus() == 0){
      user.setStatus(1);
      user.setUsername(userName);
      user.setNickname(userName);
      user.setLastLoginTime(new Date());
      //状态修改为正常
      userService.update(user);

      //初始化常用网站
      webSiteService.initUserWeb(userId);
      return new JsonResult(1,"注册成功。开始您的旅程吧。");
    }

    return new JsonResult(0,"error");
  }


  @RequestMapping("/import")
  @ResponseBody
  private JsonResult inport(@RequestParam("file") MultipartFile file){
    try {
      Map<String, Map<String, String>>  resultMap = HtmlUtil.parseHtmlTwo(file.getInputStream());
      webSiteService.inportHtml(resultMap,(int)getUserId());
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
      List<Category>  categories =  categoryService.getUserCategoryList(getUserId());
      try {
        for (Category category : categories) {
          sb.append(webSiteService.exportToHtml(category));
        }
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
