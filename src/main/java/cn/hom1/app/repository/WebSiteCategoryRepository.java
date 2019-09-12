package cn.hom1.app.repository;

import cn.hom1.app.model.dto.CategoryIdAndWebSiteCountDto;
import cn.hom1.app.model.entity.WebSiteCategory;
import cn.hom1.app.repository.base.BaseRepository;
import java.util.List;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.lang.NonNull;
import org.springframework.transaction.annotation.Transactional;

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
  List<WebSiteCategory> findAllByCategoryIdIn(@NonNull Iterable<Integer> websiteIds);

  @NonNull
  List<WebSiteCategory> findByWebsiteId(@NonNull Integer websiteId);

  @NonNull
  @Transactional
  @Modifying
  void removeAllByWebsiteId(@NonNull Integer websiteId);

  @Query("select new cn.hom1.app.model.dto.CategoryIdAndWebSiteCountDto(count(wc.websiteId), wc.categoryId) from websiteCategory wc group by wc.categoryId")
  List<CategoryIdAndWebSiteCountDto> findWebSiteCount();

  @NonNull
  Integer countByCategoryId(@NonNull Integer categoryId);
}
