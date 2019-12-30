package com.couldr.app.service;

import com.couldr.app.model.entity.WebSiteUser;
import com.couldr.app.service.base.CrudService;

import java.util.List;
import java.util.Map;

public interface WebSiteUserService extends CrudService<WebSiteUser, Integer> {

  void initUserWeb(long userId);

  void inportHtml(Map<String, String> map,Integer userId);

  StringBuilder exportToHtml(Integer userId);
}
