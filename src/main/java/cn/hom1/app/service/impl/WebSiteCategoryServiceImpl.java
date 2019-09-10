package cn.hom1.app.service.impl;

import cn.hom1.app.model.entity.Category;
import cn.hom1.app.model.entity.WebSiteCategory;
import cn.hom1.app.repository.CategoryRepository;
import cn.hom1.app.repository.WebSiteCategoryRepository;
import cn.hom1.app.service.WebSiteCategoryService;
import cn.hom1.app.service.base.AbstractCrudService;
import cn.hom1.app.utils.ServiceUtils;
import java.util.Collection;
import java.util.Collections;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Set;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

/**
 * 描述
 *
 * @author iksen
 * @date 2019-09-10 15:15
 */
@Service
public class WebSiteCategoryServiceImpl extends AbstractCrudService<WebSiteCategory, Integer> implements WebSiteCategoryService {

  private final WebSiteCategoryRepository webSiteCategoryRepository;

  private final CategoryRepository categoryRepository;

  public WebSiteCategoryServiceImpl(WebSiteCategoryRepository webSiteCategoryRepository,CategoryRepository categoryRepository) {
    super(webSiteCategoryRepository);
    this.webSiteCategoryRepository = webSiteCategoryRepository;
    this.categoryRepository = categoryRepository;
  }

  @Override
  public Map<Integer, List<Category>> listCategoryListMap(Collection<Integer> postIds) {
    if (CollectionUtils.isEmpty(postIds)) {
      return Collections.emptyMap();
    }
    // Find all post categories
    List<WebSiteCategory> webSiteCategories = webSiteCategoryRepository.findAllByWebsiteIdIn(postIds);

    // Fetch category ids
    Set<Integer> categoryIds = ServiceUtils.fetchProperty(webSiteCategories, WebSiteCategory::getCategoryId);

    // Find all categories
    List<Category> categories = categoryRepository.findAllById(categoryIds);

    // Convert to category map
    Map<Integer, Category> categoryMap = ServiceUtils.convertToMap(categories, Category::getCategoryId);

    // Create category list map
    Map<Integer, List<Category>> categoryListMap = new HashMap<>();
    System.out.println(categoryListMap);
    // Foreach and collect
    webSiteCategories.forEach(webSite -> categoryListMap.computeIfAbsent(webSite.getWebsiteId(), websiteId -> new LinkedList<>())
        .add(categoryMap.get(webSite.getCategoryId())));
    return categoryListMap;
  }
}
