package cn.hom1.app.service;

import cn.hom1.app.model.entity.WebSiteUser;
import cn.hom1.app.service.base.CrudService;
import java.util.List;

public interface WebSiteUserService extends CrudService<WebSiteUser, Integer> {

  List<WebSiteUser> ListByUserId(Integer userId);

  void updateSort(Integer userId, Integer oldIndex,Integer newIndex);

  void updateSortAll(Integer userId,Integer sort);

  int findMaxSort(Integer userId);
}
