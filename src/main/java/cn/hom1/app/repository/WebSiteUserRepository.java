package cn.hom1.app.repository;

import cn.hom1.app.model.entity.WebSiteUser;
import cn.hom1.app.repository.base.BaseRepository;
import java.util.List;

/**
 * 描述
 *
 * @author iksen
 * @date 2019-09-23 10:37
 */
public interface WebSiteUserRepository extends BaseRepository<WebSiteUser, Integer> {

  List<WebSiteUser> findAllByUserId(Integer userId);
}
