package com.couldr.app.service;

import com.couldr.app.model.entity.WebSiteUser;
import com.couldr.app.service.base.CrudService;

import java.util.List;

public interface WebSiteUserService extends CrudService<WebSiteUser, Integer> {

  List<WebSiteUser> ListByUserId(Integer userId);

  void updateSort(Integer userId, Integer oldIndex,Integer newIndex);

  void updateSortAll(Integer userId,Integer sort);

  Integer findMaxSort(Integer userId);

  void initUserWeb(Integer userId);
}
