package cn.hom1.app.repository;

import cn.hom1.app.model.entity.WebSiteCategory;
import cn.hom1.app.repository.base.BaseRepository;
import java.util.List;
import org.springframework.lang.NonNull;

/**
 * 描述
 *
 * @author iksen
 * @date 2019-09-10 15:17
 */
public interface WebSiteCategoryRepository  extends BaseRepository<WebSiteCategory, Integer> {
  @NonNull
  List<WebSiteCategory> findAllByWebsiteIdIn(@NonNull Iterable<Integer> websiteIds);

  @NonNull
  List<WebSiteCategory> findByWebsiteId(@NonNull Integer websiteId);

  @NonNull
  List<WebSiteCategory> removeAllByWebsiteId(@NonNull Integer websiteId);
}
