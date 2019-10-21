package cn.hom1.app.service.impl;

import cn.hom1.app.model.entity.WebSiteUser;
import cn.hom1.app.repository.WebSiteUserRepository;
import cn.hom1.app.service.WebSiteUserService;
import cn.hom1.app.service.base.AbstractCrudService;
import java.util.List;
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

  private WebSiteUserRepository webSiteUserRepository;

  public WebSiteUserServiceImpl(WebSiteUserRepository webSiteUserRepository) {
    super(webSiteUserRepository);
    this.webSiteUserRepository = webSiteUserRepository;
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
  public int findMaxSort(Integer userId) {
    return webSiteUserRepository.findMaxSort(userId);
  }

}
