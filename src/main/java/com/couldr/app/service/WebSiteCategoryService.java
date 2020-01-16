package com.couldr.app.service;

import com.couldr.app.model.entity.Category;
import com.couldr.app.model.entity.WebSite;
import com.couldr.app.model.entity.WebSiteCategory;
import com.couldr.app.service.base.CrudService;
import java.util.Collection;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.lang.NonNull;
import org.springframework.lang.Nullable;

public interface WebSiteCategoryService  extends CrudService<WebSiteCategory, Integer> {

  /**
   * List category list map by post id collection.
   *
   * @param postIds post id collection
   * @return a category list map (key: postId, value: a list of category)
   */
  @NonNull
  Map<Integer, List<Category>> listCategoryListMap(@Nullable Collection<Integer> postIds);

  @NonNull
  Map<Integer, List<WebSite>> listWebSiteListMap(@Nullable Collection<Integer> webSiteIds);

  /**
   * Merges or creates post categories by post id and category id set if absent.
   *
   * @param postId      post id must not be null
   * @param categoryIds category id set
   * @return a list of post category
   */
  @NonNull
  List<WebSiteCategory> mergeOrCreateByIfAbsent(@NonNull Integer postId, @Nullable Set<Integer> categoryIds);

  @NonNull
  List<WebSiteCategory> findByWebsiteId(@NonNull Integer websiteId);

  @NonNull
  void removeWebsiteId(@NonNull Integer websiteId);

  @NonNull
  Integer findWebSiteCountByCategoryId(@NonNull Integer categoryId);

  @NonNull
  List<WebSiteCategory> findByWebsiteIdIn(@NonNull Set<Integer> websiteId);

}
