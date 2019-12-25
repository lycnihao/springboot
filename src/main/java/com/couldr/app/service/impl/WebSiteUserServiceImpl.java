package com.couldr.app.service.impl;

import com.couldr.app.model.entity.WebSite;
import com.couldr.app.model.entity.WebSiteUser;
import com.couldr.app.repository.WebSiteUserRepository;
import com.couldr.app.service.AttachmentService;
import com.couldr.app.service.WebSiteUserService;
import com.couldr.app.service.base.AbstractCrudService;
import com.couldr.app.utils.HtmlUtil;
import com.couldr.app.utils.ServiceUtils;
import java.util.ArrayList;
import java.util.List;

import java.util.Map;
import java.util.Set;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

/**
 * 描述
 *
 * @author iksen
 * @date 2019-09-23 10:36
 */
@Service
public class WebSiteUserServiceImpl  extends
        AbstractCrudService<WebSiteUser, Integer> implements WebSiteUserService {

  private Logger logger = LoggerFactory.getLogger(this.getClass());

  private WebSiteUserRepository webSiteUserRepository;

  private AttachmentService attachmentService;

  public WebSiteUserServiceImpl(WebSiteUserRepository webSiteUserRepository,AttachmentService attachmentService) {
    super(webSiteUserRepository);
    this.webSiteUserRepository = webSiteUserRepository;
    this.attachmentService = attachmentService;
  }

  @Override
  public List<WebSiteUser> ListByUserId(Integer userId) {
    return webSiteUserRepository.findAllByUserId(userId);
  }

  @Override
  public void updateSort(Integer userId, Integer oldIndex, Integer newIndex) {
    if (newIndex < oldIndex){
      webSiteUserRepository.updateSortIncrease(userId, newIndex, oldIndex);
    } else {
      webSiteUserRepository.updateSortReduce(userId, oldIndex, newIndex);
    }
  }

  @Override
  public void updateSortAll(Integer userId,Integer sort) {
    webSiteUserRepository.updateSortAll(userId,sort);
  }

  @Override
  public Integer findMaxSort(Integer userId) {
    return webSiteUserRepository.findMaxSort(userId);
  }

  @Override
  public void initUserWeb(long userId) {
    webSiteUserRepository.initUserWeb(userId);
  }

  @Override
  public void inportHtml(Map<String, String> map, Integer userId) {
    List<WebSiteUser> list = new ArrayList<>();
    map.keySet().forEach(key -> {
      String name = map.get(key);
      System.out.println(name);
      WebSite webSite = HtmlUtil.getCollectFromUrl(key);
      WebSiteUser webSiteUser = new WebSiteUser();
      webSiteUser.setUserId(userId);
      webSiteUser.setWebsiteUrl(webSite.getUrl());
      webSiteUser.setWebsiteCate("我的常用网址");
      webSiteUser.setWebsiteIcon(webSite.getIcon());
      webSiteUser.setWebsiteTitle(webSite.getTitle());
      list.add(webSiteUser);
    });
    super.createInBatch(list);
  }

  @Override
  public StringBuilder exportToHtml(Integer userId) {
    try {
      StringBuilder sb = new StringBuilder();
      List<WebSiteUser> webSiteUsers = webSiteUserRepository.findAllByUserId(userId);
      StringBuilder sbc = new StringBuilder();
      for(WebSiteUser webSiteUser : webSiteUsers){
        sbc.append("<DT><A HREF=\""+webSiteUser.getWebsiteUrl()+"\" TARGET=\"_blank\">"+webSiteUser.getWebsiteTitle()+"</A></DT>");
      }
      sb.append("<DL><P></P><DT><H3>");
      sb.append("我的常用地址");
      sb.append("</H3><DL><P></P>");
      sb.append(sbc);
      sb.append("</DL></DT></DL>");
      return sb;
    } catch (Exception e) {
      logger.error("异常：",e);
    }
    return null;
  }

}
