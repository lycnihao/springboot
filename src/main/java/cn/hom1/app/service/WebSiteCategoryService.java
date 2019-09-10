package cn.hom1.app.service;

import cn.hom1.app.model.entity.Category;
import cn.hom1.app.model.entity.WebSiteCategory;
import cn.hom1.app.service.base.CrudService;
import java.util.Collection;
import java.util.List;
import java.util.Map;
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

}
