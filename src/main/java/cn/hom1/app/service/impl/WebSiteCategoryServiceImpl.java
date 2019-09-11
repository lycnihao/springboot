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
import java.util.stream.Collectors;
import org.springframework.stereotype.Service;
import org.springframework.util.Assert;
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
  public Map<Integer, List<Category>> listCategoryListMap(Collection<Integer> cateIds) {
    if (CollectionUtils.isEmpty(cateIds)) {
      return Collections.emptyMap();
    }

    // Find all post categories
    List<WebSiteCategory> webSiteCategories = webSiteCategoryRepository.findAllByWebsiteIdIn(cateIds);

    // Fetch category ids
    Set<Integer> categoryIds = ServiceUtils.fetchProperty(webSiteCategories, WebSiteCategory::getCategoryId);

    // Find all categories
    List<Category> categories = categoryRepository.findAllById(categoryIds);

    // Convert to category map
    Map<Integer, Category> categoryMap = ServiceUtils.convertToMap(categories, Category::getCategoryId);

    // Create category list map
    Map<Integer, List<Category>> categoryListMap = new HashMap<>();

    // Foreach and collect
    webSiteCategories.forEach(webSite -> categoryListMap.computeIfAbsent(webSite.getWebsiteId(), websiteId -> new LinkedList<>())
        .add(categoryMap.get(webSite.getCategoryId())));
    return categoryListMap;
  }

  @Override
  public List<WebSiteCategory> mergeOrCreateByIfAbsent(Integer websiteId, Set<Integer> categoryIds) {
    Assert.notNull(websiteId, "Post id must not be null");
    if (CollectionUtils.isEmpty(categoryIds)) {
      return Collections.emptyList();
    }

    // Build post categories
    List<WebSiteCategory> webSiteCategories = categoryIds.stream().map(categoryId -> {
      WebSiteCategory webSiteCategory = new WebSiteCategory();
      webSiteCategory.setWebsiteId(websiteId);
      webSiteCategory.setCategoryId(categoryId);
      return webSiteCategory;
    }).collect(Collectors.toList());

    List<WebSiteCategory> webSiteCategoriesToCreate = new LinkedList<>();

    List<WebSiteCategory> webSiteCategoriesToRemove = new LinkedList<>();

    List<WebSiteCategory> webSiteCategoryList = webSiteCategoryRepository.findByWebsiteId(websiteId);
    webSiteCategoryList.forEach(webSiteCategory -> {
      if (!webSiteCategories.contains(webSiteCategory)) {
        webSiteCategoriesToRemove.add(webSiteCategory);
      }
    });

    webSiteCategories.forEach(webSiteCategoryStaging -> {
      if (!webSiteCategoryList.contains(webSiteCategoryStaging)) {
        webSiteCategoriesToCreate.add(webSiteCategoryStaging);
      }
    });

    webSiteCategoryRepository.deleteInBatch(webSiteCategoriesToRemove);
    webSiteCategoryRepository.saveAll(webSiteCategoriesToCreate);

    return webSiteCategories;
  }

  @Override
  public List<WebSiteCategory> findByWebsiteId(Integer websiteId) {
    return webSiteCategoryRepository.findByWebsiteId(websiteId);
  }

  @Override
  public List<WebSiteCategory> removeWebsiteId(Integer websiteId) {
    webSiteCategoryRepository.removeAllByWebsiteId(websiteId);
    return null;
  }
}
